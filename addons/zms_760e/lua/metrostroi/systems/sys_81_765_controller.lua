Metrostroi.DefineSystem("81_765_Controller")
TRAIN_SYSTEM.DontAccelerateSimulation = true

-- TODO:
-- Revise visual position (both before and after model change)
-- Revise systems:
    -- BUKP
    -- BARS
    -- PrOst KOS
    -- Speedometer

function TRAIN_SYSTEM:Initialize()
    self.Position = 0
    self.TargetPosition = 0

    self.Set1Pressed = false
    self.Set5Pressed = false

    self.Online = 0
    self.TractiveSetting = 0
    self.TargetTractiveSetting = 0
    self.IsOverriden = 0
end

function TRAIN_SYSTEM:Inputs()
    return {
        "Up", "Down", "Set1", "Set2", "Set3", "Set4", "Set5", "Set6", "Set7", "ResetTractiveSetting", "SetTractiveSetting"
    }
end

function TRAIN_SYSTEM:Outputs()
    return { "Position", "TractiveSetting", "Online", "IsOverriden" }
end

function TRAIN_SYSTEM:TriggerInput(name, value)
    if name == "Up" then
        if value > 0 then
            self.TargetPosition = math.min(2, self.TargetPosition + 1)
        elseif self.TargetPosition == 2 then
            self.TargetPosition = 1
        end

    elseif name == "Down" then
        if value > 0 then
            self.TargetPosition = math.max(-3, self.TargetPosition - 1)
        elseif self.TargetPosition == -2 then
            self.TargetPosition = -1
        end

    -- +M
    elseif name == "Set2" or name == "Set3" then
        self.TargetPosition = value > 0 and 2 or self.TargetPosition == 2 and 1 or self.TargetPosition

    -- M
    elseif name == "Set1" then
        if value > 0 then
            self.TargetPosition = self.TargetTractiveSetting > 20 and 0 or 1
            self.Set1Pressed = true
        else
            if self.TargetPosition == 0 then
                self.TargetPosition = 1
            end
            self.Set1Pressed = false
        end

    -- 0
    elseif name == "Set4" and value > 0 then
        self.TargetPosition = 0

    -- F
    elseif name == "Set5" then
        if value > 0 then
            self.TargetPosition = self.TargetTractiveSetting < -20 and 0 or -1
            self.Set5Pressed = true
        else
            if self.TargetPosition == 0 then
                self.TargetPosition = -1
            end
            self.Set5Pressed = false
        end

    -- +F
    elseif name == "Set6" then
        self.TargetPosition = value > 0 and -2 or self.TargetPosition == -2 and -1 or self.TargetPosition

    -- VF
    elseif name == "Set7" and value > 0 then
        self.TargetPosition = -3

    end

    if name == "ResetTractiveSetting" then
        self.TractiveSettingOverride = nil
        if value > 0 then
            self.MotionBlocked = true
            self.TractiveSetting = self.TargetTractiveSetting <= 0 and self.TargetTractiveSetting or 0
            self.TargetTractiveSetting = self.TargetTractiveSetting <= 0 and self.TargetTractiveSetting or 0
        end

    elseif name == "SetTractiveSetting" then
        self.TractiveSettingOverride = value
        self.MotionBlocked = value <= 0

    else
        self.ControllerTimer = CurTime() - 1

    end
end


local SettingSpeed = 45  -- Per second
local ZeroTimer = 1.6  -- Seconds

function TRAIN_SYSTEM:Think(dT)
    if self.ControllerTimer and CurTime() - self.ControllerTimer > 0.06 and self.Position ~= self.TargetPosition then
        local previousPosition = self.Position
        self.ControllerTimer = CurTime()
        if self.TargetPosition > self.Position then
            self.Position = self.Position + 1
        else
            self.Position = self.Position - 1
        end

        self.Train:PlayOnce("KV_" .. previousPosition .. "_" .. self.Position, "cabin", 0.25, 0.95)
    end

    if self.Position == self.TargetPosition then self.ControllerTimer = nil end

    self.Train.Panel:TriggerInput("SetController", self.Position)

    -- Is controller online (can change tractive power)
    -- FIXME: how realistic is it?
    self.Online = self.Train.BUKP and self.Train.BUKP.State == 5 and self.Train:GetNW2Int("VityazMainMsg", 0) == 0 and 1 or 0
    self.IsOverriden = self.TractiveSettingOverride ~= nil

    if self.Online > 0 then
        if self.Position == 0 and math.abs(self.TractiveSetting) >= 40 and not self.ZeroTimer then
            self.ZeroTimer = CurTime()
        elseif self.ZeroTimer and not (self.Position == 0 and math.abs(self.TractiveSetting) > 2) then
            self.ZeroTimer = nil
        elseif self.Position == 0 and self.ZeroTimer and math.abs(self.TractiveSetting) > 2 and CurTime() - self.ZeroTimer >= ZeroTimer then
            self.ZeroTimer = nil
            self.TractiveSetting = 0
            self.TargetTractiveSetting = 0
        end

        if self.MotionBlocked and self.Position <= 0 then
            self.MotionBlocked = false
        end

        if self.TargetTractiveSetting > 0 and self.MotionBlocked then
            self.TargetTractiveSetting = 0
        end

        if self.TractiveSettingOverride == nil then
            if self.Position == -3 then
                self.TargetTractiveSetting = -100
                self.TractiveSetting = -100

            elseif self.MotionBlocked and (self.TractiveSetting > 0 or self.TargetTractiveSetting == 0) then
                self.TargetTractiveSetting = 0
                self.TractiveSetting = 0

            elseif not self.MotionBlocked or self.Position <= 0 then
                if self.Position > 0 and self.TractiveSetting < 0 or self.Position < 0 and self.TractiveSetting > 0 then
                    self.TargetTractiveSetting = 0
                    self.TractiveSetting = 0
                end

                -- Fast descend: fast controller move from M to 0 - M sets traction from 100 to 40
                if self.TractiveSetting == 100 and self.Position == 1 then
                    self.WasPos1 = true
                elseif self.WasPos1 and self.Position == 0 then
                    self.LastDescend = CurTime()
                    self.WasPos1 = false
                else
                    self.WasPos1 = false
                end
                if self.Position == 1 and self.LastDescend and CurTime() - self.LastDescend < 0.2 then
                    self.LastDescend = nil
                    self.TargetTractiveSetting = 40
                end

                local delta = self.TargetTractiveSetting - self.TractiveSetting
                if math.abs(delta) < 2 then  -- Update target setting when actual is near current target
                    if self.Position == 0 and self.TargetTractiveSetting > 0 then
                        self.TargetTractiveSetting = math.max(0, self.TargetTractiveSetting - 10)
                    elseif self.Position == 0 and self.TargetTractiveSetting < 0 then
                        self.TargetTractiveSetting = math.min(0, self.TargetTractiveSetting + 10)
                    elseif self.Position == 1 then
                        self.TargetTractiveSetting = math.min(100, math.max(20, self.TargetTractiveSetting))
                    elseif self.Position == -1 then
                        self.TargetTractiveSetting = math.max(-100, math.min(-20, self.TargetTractiveSetting))
                    elseif self.Position == 2 then
                        self.TargetTractiveSetting = math.min(100, self.TargetTractiveSetting + 10)
                    elseif self.Position == -2 then
                        self.TargetTractiveSetting = math.max(-100, self.TargetTractiveSetting - 10)
                    end
                    delta = self.TargetTractiveSetting - self.TractiveSetting
                end

                local sgn = delta > 0 and 1 or delta < 0 and -1 or 0
                if sgn ~= 0 then
                    local newDelta = dT * SettingSpeed * sgn
                    if math.abs(newDelta) > math.abs(delta) then
                        self.TractiveSetting = self.TargetTractiveSetting
                    else
                        self.TractiveSetting = self.TractiveSetting + newDelta
                    end
                end

            end

        elseif self.TractiveSettingOverride ~= nil then
            self.TractiveSetting = self.TractiveSettingOverride
        end

    else
        self.TractiveSetting = 0
        self.TargetTractiveSetting = 0
        self.ZeroTimer = nil
    end

    if self.TargetPosition == 0 and self.Set1Pressed and self.TargetTractiveSetting <= 20 then
        self.TargetPosition = 1
        self.ControllerTimer = CurTime() - 1
    elseif self.TargetPosition == 0 and self.Set5Pressed and self.TargetTractiveSetting >= -20 then
        self.TargetPosition = -1
        self.ControllerTimer = CurTime() - 1
    end
end
