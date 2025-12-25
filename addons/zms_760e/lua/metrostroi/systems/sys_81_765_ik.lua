--------------------------------------------------------------------------------
-- Шина ИК (информационного комплекса)
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("81_765_IK")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize()
    self.Executables = {"Init", "Reset", "Execute"}
end

function TRAIN_SYSTEM:Outputs()
end

function TRAIN_SYSTEM:Inputs()
    return {}
end

if TURBOSTROI then return end
function TRAIN_SYSTEM:TriggerInput(name, value)
end

if SERVER then
    function TRAIN_SYSTEM:CANReceive(source, sourceid, target, targetid, textdata, data)
        self[textdata] = data
    end

    function TRAIN_SYSTEM:Trigger(name, value)
    end

    function TRAIN_SYSTEM:Get(str, arg, ...)
        if arg then
            str = string.format(str, arg, ...)
        end
        return self[str]
    end

    function TRAIN_SYSTEM:Think(dT)
        local Wag = self.Train
        local Power = Wag.Electric.Battery80V > 62 and Wag.BUV.Power * (Wag.SF37.Value + Wag.SF38.Value) > 0
        Wag:SetNW2Bool("DoorAlarmState", Power and self.DoorAlarm or false)

        for _, name in ipairs(self.Executables) do
            if self[name] then
                self[name] = false
                if Power then
                    self["Run" .. name](self)
                end
            end
        end
    end

    function TRAIN_SYSTEM:RunInit()
        self.Stations = {}
        for idx = 1, self.StationCount do
            local changes = {}
            for cidx = 1, self:Get("Station%dChangeCount", idx) or 0 do
                local icons = {}
                for iidx = 1, self:Get("Station%dChange%dIconCount", idx, cidx) or 0 do
                    icons[iidx] = {
                        typ = self:Get("Station%dChange%dIconType%d", idx, cidx, iidx),
                        symbol = self:Get("Station%dChange%dIconSymbol%d", idx, cidx, iidx),
                        color = self:Get("Station%dChange%dIconColor%d", idx, cidx, iidx),
                        path = self:Get("Station%dChange%dIconPath%d", idx, cidx, iidx),
                    }
                end
                changes[cidx] = {
                    icons = icons,
                    name = self:Get("Station%dChange%dName", idx, cidx),
                    nameEng = self:Get("Station%dChange%dNameEng", idx, cidx),
                }
            end
            self.Stations[idx] = {
                name = self["StationName" .. idx],
                nameEng = self["StationNameEng" .. idx],
                ledCount = self["StationLedCount" .. idx],
                changes = changes,
            }
        end

        local BNT = self.Train.BNT
        BNT.Stations = not self.Path and self.Stations or table.Reverse(self.Stations)
        BNT.LastStation = self.Path and #self.Stations - self.LastStation + 1 or self.LastStation
        BNT.LineColor = self.LineColor
        BNT.LineSymbol = self.LineSymbol

        self.ActiveRoute = self.RouteId
        BNT:SetStation(1)
    end

    function TRAIN_SYSTEM:RunReset()
        self.ActiveRoute = nil
        self.Train.BNT.Working = false
    end

    function TRAIN_SYSTEM:RunExecute()
        if self.RouteId ~= self.ActiveRoute then
            self:RunReset()
            return
        end

        local BNT = self.Train.BNT
        local curSt = self.Path and #self.Stations - self.Station + 1 or self.Station
        if curSt == BNT.Station and self.Depart then
            BNT:AnimateNext()
        else
            BNT:SetStation(curSt)
            if self.Depart then
                BNT:AnimateNext()
            end
        end

        BNT.Terminus = false
        self.Train.BUD:TriggerInput("Depart", self.Depart)

        if self.Depart then
            BNT:AnimateDepart()
        elseif not self.Terminus then
            BNT:AnimateArrive()
        else
            BNT:AnimateTerminus()
            BNT.Terminus = true
        end

        BNT.Working = true
    end
end