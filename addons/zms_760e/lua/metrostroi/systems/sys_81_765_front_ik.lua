--------------------------------------------------------------------------------
-- ТМ-ИК, ТНМ-ИК, БЛ-ИК
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("81_765_FrontIK")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize()
end

function TRAIN_SYSTEM:Outputs()
end

function TRAIN_SYSTEM:Inputs()
    return {}
end

if TURBOSTROI then return end

if SERVER then
    function TRAIN_SYSTEM:TriggerInput(name, val1, val2)
        if name ~= "SetRoute" then return end
        self.Train:SetNW2String("BMIK:Station", val1)
        if val2 then
            self.Train:SetNW2Int("BMIK:RouteNumber", tonumber(val2))
        end
    end

else
    local scw_bm, sch_bm = 1380, 230
    local scw_bnm, sch_bnm = 380, 190
    local scw_bl, sch_bl = 380, 380
    local blFt = 1 / 25

    function TRAIN_SYSTEM:ClientThink()
        local Wag = self.Train
        self.Working = Wag:GetNW2Bool("IK:Working", false)
        if not self.NextDrawBm or CurTime() >= self.NextDrawBm then
            self.NextDrawBm = CurTime() + 2
            if Wag:ShouldDrawPanel("BMIK") then
                render.PushRenderTarget(self.Train.BMIK, 0, 0, scw_bm, sch_bm)
                render.Clear(0, 0, 0, 0)
                cam.Start2D()
                    self:DrawBm()
                cam.End2D()
                render.PopRenderTarget()
            end
            if Wag:ShouldDrawPanel("BNMIK") then
                render.PushRenderTarget(self.Train.BNMIK, 0, 0, scw_bnm, sch_bnm)
                render.Clear(0, 0, 0, 0)
                cam.Start2D()
                    self:DrawBnm()
                cam.End2D()
                render.PopRenderTarget()
            end
        end

        if not self.NextDrawBl or CurTime() >= self.NextDrawBl then
            self.NextDrawBl = CurTime() + blFt
            if Wag:ShouldDrawPanel("BLIK") then
                render.PushRenderTarget(self.Train.BLIK, 0, 0, scw_bl, sch_bl)
                render.Clear(0, 0, 0, 0)
                cam.Start2D()
                    self:DrawBl()
                cam.End2D()
                render.PopRenderTarget()
            end
        end
    end

    function TRAIN_SYSTEM:ClientInitialize()
        self.Color = Color(236, 233, 19)
    end

    surface.CreateFont("BMIK:Size1", {
        font = "Moscow2017_EMU",
        extended = true,
        size = 255,
        weight = 500,
        antialias = true,
    })
    surface.CreateFont("BMIK:Size2", {
        font = "Moscow2017_EMU",
        extended = true,
        size = 180,
        weight = 500,
        antialias = true,
    })

    function TRAIN_SYSTEM:DrawBm()
        local curText = self.Train:GetNW2String("BMIK:Station", "")
        if self.BmText ~= curText then
            self.BmText = curText
            surface.SetFont("BMIK:Size1")
            local len = surface.GetTextSize(curText)
            self.BmFont = len >= 1290 and "BMIK:Size2" or "BMIK:Size1"
            surface.SetFont(self.BmFont)
            len = surface.GetTextSize(curText)
            if len >= 1290 then
                curText = utf8.sub(curText, 1, 15) .. "."
            end
            self.BmDisplText = curText
        end
        draw.SimpleText(self.BmDisplText, self.BmFont, scw_bm / 2, sch_bm / 2 + 24, self.Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    function TRAIN_SYSTEM:DrawBnm()
        local curText = self.Train:GetNW2Int("BMIK:RouteNumber", 0)
        if self.BnmText ~= curText then
            self.BnmText = curText
            self.BnmDisplText = Format("%03d", curText)
        end
        draw.SimpleText(self.BnmDisplText, "BMIK:Size2", scw_bnm / 2, sch_bnm / 2 + 18, self.Color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local pivo = Material("zxc765/PIVO_logo_lt.png", "smooth ignorez")
    function TRAIN_SYSTEM:DrawBl()
        local typ = self.Train:GetNW2Int("BLIK:Type", 1)
        local anim = self.Train:GetNW2Bool("BLIK:Anim", false)
        if typ == 2 then
            local rot = anim and 360 * (CurTime() % 15) / 15 or 0
            surface.SetMaterial(pivo)
            surface.SetDrawColor(255, 255, 255)
            surface.DrawTexturedRectRotated(scw_bl / 2, sch_bl / 2, scw_bl - 64, sch_bl - 64, rot)
        end
    end
end
