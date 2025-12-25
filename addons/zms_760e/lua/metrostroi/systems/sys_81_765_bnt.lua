--------------------------------------------------------------------------------
-- Блок наддверного табло КБ «Метроспецтехника»
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("81_765_BNT")
TRAIN_SYSTEM.DontAccelerateSimulation = true

function TRAIN_SYSTEM:Initialize()
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
    end

    function TRAIN_SYSTEM:Trigger(name, value)
    end

    function TRAIN_SYSTEM:Think(dT)
        local Wag = self.Train
        local Power = Wag.Electric.Battery80V > 62 and Wag.BUV.Power * (Wag.SF37.Value + Wag.SF38.Value) > 0
        local PowerLeft = Power and Wag.SF37.Value > 0
        local PowerRight = Power and Wag.SF38.Value > 0

        Wag:SetNW2Bool("BNT:PowerLeft", PowerLeft)
        Wag:SetNW2Bool("BNT:PowerRight", PowerRight)
        Wag:SetNW2Bool("BNT:SelectLeft", Wag.BUV.SelectLeft)
        Wag:SetNW2Bool("BNT:SelectRight", Wag.BUV.SelectRight)
        Wag:SetNW2Bool("BNT:Working", (PowerLeft or PowerRight) and self.Working)
        Wag:SetNW2Bool("BNT:FirstStation", self.Station == 1)
        Wag:SetNW2Bool("BNT:SecondStation", self.Station == 2)
        Wag:SetNW2String("BNT:LineColor", self.LineColor)
        Wag:SetNW2Bool("BNT:Terminus", self.Terminus)
    end

    function TRAIN_SYSTEM:AnimateNext()
        self:SetStation((self.Station or 1) + 1)
        self:SetInt("BNT:StationAnim", CurTime() + 7)
    end

    function TRAIN_SYSTEM:SetStation(stIdx)
        self.Station = stIdx
        for idx = 1, 10 do
            local cfgIdx = idx + stIdx - 2
            local st = self.Stations and self.Stations[cfgIdx]
            if idx < 10 and cfgIdx <= self.LastStation and st then
                self:SetString("BNT:Station" .. idx, st.name)
                self:SetString("BNT:StationEng" .. idx, st.nameEng)
                self:SetInt("BNT:Station%dChangeCount", #st.changes, idx)
                for cidx, ch in ipairs(st.changes) do
                    self:SetString("BNT:Station%dChangeName%d", ch.name, idx, cidx)
                    self:SetString("BNT:Station%dChangeNameEng%d", ch.nameEng, idx, cidx)
                    self:SetInt("BNT:Station%dChange%dIconCount", #ch.icons, idx, cidx)
                    for iidx, icon in ipairs(ch.icons) do
                        self:SetInt("BNT:Station%dChange%dIconType%d", icon.typ, idx, cidx, iidx)
                        self:SetString("BNT:Station%dChange%dIconSymbol%d", icon.symbol, idx, cidx, iidx)
                        self:SetString("BNT:Station%dChange%dIconColor%d", icon.color, idx, cidx, iidx)
                        self:SetString("BNT:Station%dChange%dIconPath%d", icon.path, idx, cidx, iidx)
                    end
                end
            elseif idx > 1 then
                self:SetInt("BNT:StationCount", idx - 1)
                break
            end
        end
        self:SetInt("BNT:StationAnim", 0)
    end

    function TRAIN_SYSTEM:AnimateDepart()
        self:SetInt("BNT:DepartAnim", CurTime() * 10)
    end

    function TRAIN_SYSTEM:AnimateArrive()
        self:SetInt("BNT:ArrivedAnim", CurTime() * 10)
    end

    function TRAIN_SYSTEM:AnimateTerminus()
        self:SetInt("BNT:TerminusAnim", CurTime() * 10)
        self:SetInt("BNT:ArrivedAnim", CurTime() * 10)
    end

    function TRAIN_SYSTEM:SetCl(fnc, str, val, arg, ...)
        if arg then str = string.format(str, arg, ...) end
        fnc(self.Train, str, val)
    end

    function TRAIN_SYSTEM:SetInt(str, val, arg, ...)
        self:SetCl(self.Train.SetNW2Int, str, val, arg, ...)
    end

    function TRAIN_SYSTEM:SetString(str, val, arg, ...)
        self:SetCl(self.Train.SetNW2String, str, val, arg, ...)
    end

else
    local scw, sch = 3840, 512

    local ScreenFps = 60
    local ScreenFt = 1 / ScreenFps
    local StationAnimDuration = 0.4
    local SlideDuration = 0.2
    local GifDuration = 2.6
    local FontTransitionFrames = math.ceil(ScreenFps * StationAnimDuration)

    function TRAIN_SYSTEM:ClientThink()
        local Wag = self.Train
        if self.NextDraw and CurTime() < self.NextDraw then return end
        self.NextDraw = CurTime() + ScreenFt
        self.Working = Wag:GetNW2Bool("BNT:Working", false)
        if Wag:ShouldDrawPanel("BNTL") then
            render.PushRenderTarget(self.Train.LBnt, 0, 0, 3840, 512)
            render.Clear(0, 0, 0, 0)
            cam.Start2D()
            self:DrawBnt(true)
            cam.End2D()
            render.PopRenderTarget()
        end
        if Wag:ShouldDrawPanel("BNTR") then
            render.PushRenderTarget(self.Train.RBnt, 0, 0, 3840, 512)
            render.Clear(0, 0, 0, 0)
            cam.Start2D()
            self:DrawBnt(false)
            cam.End2D()
            render.PopRenderTarget()
        end
    end

    function TRAIN_SYSTEM:ClientInitialize()
        self.colors = {}
    end

    local changeMat = Material("zxc765/bnt/changeNormal.png", "smooth ignorez")
    local gifMat = Material("zxc765/bnt/doorCloseAnim.png", "smooth ignorez")
    local termMat = Material("zxc765/bnt/terminus.png", "smooth ignorez")

    surface.CreateFont("BNT.SystemHeader", {
        extended = true,
        font = "Arimo",
        size = 255,
        weight = 500,
    })

    surface.CreateFont("BNT.SystemSmall", {
        extended = true,
        font = "Arimo",
        size = 40,
        weight = 500,
    })

    surface.CreateFont("BNT.TerminusHeader", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 86,
        weight = 600,
    })

    surface.CreateFont("BNT.Terminus", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 72,
        weight = 500,
    })

    surface.CreateFont("BNT.Depart", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 84,
        weight = 500,
    })

    surface.CreateFont("BNT.Arrived", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 40,
        weight = 500,
    })

    surface.CreateFont("BNT.ChangeSymbol", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 54,
        weight = 600,
    })

    surface.CreateFont("BNT.ChangeSymbolBig", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 76,
        weight = 600,
    })

    surface.CreateFont("BNT.Footer", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 64,
        weight = 500,
    })

    surface.CreateFont("BNT.FooterEng", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 36,
        weight = 500,
    })

    surface.CreateFont("BNT.StationSmall", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 72,
        weight = 600,
    })

    surface.CreateFont("BNT.StationSmallEng", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 48,
        weight = 500,
    })

    surface.CreateFont("BNT.StationBig", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 140,
        weight = 600,
    })
    surface.CreateFont("BNT.StationBigEng", {
        extended = true,
        font = "Moscow Sans Regular",
        size = 70,
        weight = 500,
    })

    local colorBackground = Color(255, 255, 255)
    local colorBlack = Color(12, 12, 12)
    local colorEng = Color(12, 12, 12, 175)

    local sizeGifH = 180
    local sizeMinBoxW = 400
    local sizeMinBigBoxW = 800
    local sizeBoxGap = 160
    local sizeBoxBigGap = 400
    local sizeChange = 64
    local sizeChangeGap = 12
    local sizeTrminusBanner = sch * 4

    local anims = {"DepartAnim", "ArrivedAnim"}

    local function animate(start, offset, duration)
        return math.Clamp((CurTime() - start / 10 - offset) / duration, 0, 1)
    end

    local function isLight(color)
        -- return math.max(color.r, color.g, color.b) > 0xEF
        return false  -- FIXME find common solution for this
    end

    local function circle(x, y, radius, seg)
        local cir = {}
        table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
        for i = 0, seg do
            local a = math.rad( ( i / seg ) * -360 )
            table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
        end
        local a = math.rad( 0 )
        table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
        return cir
    end

    local function animateGif(x, y, w, h, mat, anim, side, frameCount)
        local frame = math.Clamp(math.floor(anim * frameCount), 0, frameCount - 1)
        local i = math.floor(frame / side)
        local j = frame % side
        local u, v = j / side, i / side
        local size = 1 / side
        surface.SetMaterial(mat)
        surface.DrawTexturedRectUV(x, y, w, h, u, v, u + size, v + size)
    end

    function TRAIN_SYSTEM:DrawBnt(left)
        local Wag = self.Train
        if left and not Wag:GetNW2Bool("BNT:PowerLeft", false) or not left and not Wag:GetNW2Bool("BNT:PowerRight", false) then
            surface.SetDrawColor(2, 2, 2)
            surface.DrawRect(0, 0, scw, sch)
            return
        elseif not self.Working then
            surface.SetDrawColor(12, 12, 12)
            surface.DrawRect(0, 0, scw, sch)
            draw.SimpleText("БЛОК НЕАКТИВЕН", "BNT.SystemHeader", scw / 2, sch / 2, colorBackground, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(left and "левый" or "правый", "BNT.SystemSmall", scw / 2, 480, colorBackground, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            return
        end

        ScreenFps = Wag:GetNW2Int("BNT:ScreenFps", 60)
        if self.Fps ~= ScreenFps then
            ScreenFt = 1 / ScreenFps
            FontTransitionFrames = math.ceil(ScreenFps * StationAnimDuration)
            for idx = 0, FontTransitionFrames do
                surface.CreateFont("BNT.StationBig" .. idx, {
                    extended = true,
                    font = "Moscow Sans Regular",
                    size = Lerp(idx / FontTransitionFrames, 72, 140),
                    weight = 600,
                })
                surface.CreateFont("BNT.StationBigEng" .. idx, {
                    extended = true,
                    font = "Moscow Sans Regular",
                    size = Lerp(idx / FontTransitionFrames, 48, 70),
                    weight = 500,
                })
                surface.CreateFont("BNT.ChangeSymbol" .. idx, {
                    extended = true,
                    font = "Moscow Sans Regular",
                    size = Lerp(idx / FontTransitionFrames, 54, 76),
                    weight = 600,
                })
            end
            self.Fps = ScreenFps
        end

        surface.SetDrawColor(12, 12, 12)
        surface.DrawRect(0, 0, scw, sch)

        local stationAnim = math.Clamp((CurTime() - Wag:GetNW2Int("BNT:StationAnim", 0)) / StationAnimDuration, 0, 1)
        local gifSlideIn = 0
        local gifSlideOut = 1

        local animName, anim
        for _, k in ipairs(anims) do
            local cur = Wag:GetNW2Int("BNT:" .. k, 0)
            if not anim or anim < cur then
                anim = cur
                animName = k
            end
        end

        local x, y
        surface.SetDrawColor(colorBackground)
        surface.DrawRect(0, 0, scw, sch)

        local arrived = animName == "ArrivedAnim" and animate(anim, 1, SlideDuration) or 1 - animate(anim, 0, SlideDuration)
        local travel = animName == "ArrivedAnim" and 1 - animate(anim, 0, SlideDuration) or animate(anim, 1, SlideDuration)
        x, y = 95, 10
        draw.SimpleText("СТАНЦИЯ", "BNT.Arrived", x, y + (1 - arrived) * 20, self:GetCachedColor(colorBlack, arrived), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        draw.SimpleText("STATION", "BNT.Arrived", 300, y + (1 - arrived) * 20, self:GetCachedColor(colorEng, arrived), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        draw.SimpleText("СЛЕДУЮЩАЯ", "BNT.Arrived", x, y + (1 - travel) * 20, self:GetCachedColor(colorBlack, travel), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        draw.SimpleText("NEXT", "BNT.Arrived", 380, y + (1 - travel) * 20, self:GetCachedColor(colorEng, travel), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

        local oppositeExit = animName == "ArrivedAnim" and (Wag:GetNW2Bool("BNT:SelectLeft", false) and not left or Wag:GetNW2Bool("BNT:SelectRight", false) and left)
        if oppositeExit or animName == "DepartAnim" then
            gifSlideIn = animate(anim, 1, SlideDuration)
            gifSlideOut = animate(anim, 6, SlideDuration)
        end

        local changesInline1 = animName == "DepartAnim" and animate(anim, 4, SlideDuration) or 0
        local changesInline2 = animName == "DepartAnim" and 1 - animate(anim, 9.8, SlideDuration) or 0
        local changesFooter = animName == "DepartAnim" and animate(anim, 10, SlideDuration) + (1 - animate(anim, 3.8, SlideDuration)) or 1
        local terminusAnim = Wag:GetNW2Bool("BNT:Terminus", false) and animate(Wag:GetNW2Int("BNT:TerminusAnim"), oppositeExit and 6 or 0, SlideDuration * 1.4) or 0
        local lineColor = self:GetCachedColor(Wag:GetNW2String("BNT:LineColor", "#6e6e6e"))

        x, y = 0, 0
        if gifSlideOut < 1 then
            local pos = gifSlideOut > 0 and (1 - gifSlideOut) or gifSlideIn
            y = sizeGifH * pos

            surface.SetDrawColor(245, 212, 51)
            surface.DrawRect(x, y - sizeGifH, scw, sizeGifH)
            local text = oppositeExit and "Выход из дверей напротив" or "Осторожно, двери закрываются"
            local textEng = oppositeExit and "Exit from the doors opposite" or "Attention, the doors are closing"
            draw.SimpleText(text, "BNT.Depart", scw * 0.8 / 4, y - sizeGifH / 2, colorBlack, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(textEng, "BNT.Depart", scw * 3.2 / 4, y - sizeGifH / 2, colorEng, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

            if not oppositeExit then
                local gifW = sizeGifH * 2.753
                surface.SetDrawColor(255, 255, 255)
                animateGif(scw / 2 - gifW / 2, y - sizeGifH, gifW, sizeGifH, gifMat, animate(anim, 1 + SlideDuration, GifDuration), 8, 64)
            end
        end

        local x0, y0 = 100, 290 + y * 0.75
        local firstStation = Wag:GetNW2Bool("BNT:FirstStation", false)
        local secondStation = Wag:GetNW2Bool("BNT:SecondStation", false)
        local stcount = Wag:GetNW2Int("BNT:StationCount", 0)
        local termx, termy = scw - sizeTrminusBanner * terminusAnim, y
        local linex, liney = (firstStation and x0 or 0), y0 + 40
        local lineEnd = scw
        x, y = x0, y0

        local circles1, circles2 = {}, {}
        for idx = 1, math.min(8, stcount) do
            local station = Wag:GetNW2String("BNT:Station" .. idx, "Неизвестно")
            local boxW, boxH
            local font = "BNT.StationSmall"
            local fontEng = "BNT.StationSmallEng"
            local minBoxW = sizeMinBoxW
            local gap = idx == 1 and Lerp(stationAnim, sizeBoxBigGap, sizeBoxGap) or idx == 2 and Lerp(stationAnim, sizeBoxGap, sizeBoxBigGap) or sizeBoxGap
            local offsetY = idx == 1 and Lerp(stationAnim, 6, 0) or idx == 2 and Lerp(stationAnim, 0, 6) or 0
            local offsetEngY = idx == 1 and Lerp(stationAnim, 24, 0) or idx == 2 and Lerp(stationAnim, 0, 24) or 0
            local offsetChangeY = idx == 1 and Lerp(stationAnim, 24, 6) or idx == 2 and Lerp(stationAnim, 6, 24) or 6
            local changeScale = idx == 1 and Lerp(stationAnim, 1.4, 1) or idx == 2 and Lerp(stationAnim, 1, 1.4) or 1
            local fontFrame = math.floor((idx == 1 and 1 - stationAnim or stationAnim) * FontTransitionFrames)
            if idx < 3 then
                font = "BNT.StationBig" .. fontFrame
                fontEng = "BNT.StationBigEng" .. fontFrame
                minBoxW = Lerp(idx == 1 and 1 - stationAnim or stationAnim, sizeMinBoxW, sizeMinBigBoxW)
                if idx == 1 then
                    surface.SetFont(font)
                    boxW, boxH = surface.GetTextSize(station)
                    boxW = math.max(minBoxW, boxW + gap)
                    x = x0 - (boxW + x0) * stationAnim
                    if secondStation and stationAnim < 1 then
                        linex = math.max(0, x)
                    end
                end
            end

            boxW, boxH = draw.SimpleText(station, font, x, y + offsetY, colorBlack, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
            draw.SimpleText(Wag:GetNW2String("BNT:StationEng" .. idx, ""), fontEng, x, y + offsetEngY - boxH, colorEng, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)

            local change = false
            local prevIcon = nil
            for cidx = 1, Wag:GetNW2Int("BNT:Station" .. idx .. "ChangeCount", 0) do
                local fade = idx == 1 and changesInline1 or idx == 2 and changesInline2 or 1
                for iidx = 1, Wag:GetNW2Int("BNT:Station" .. idx .. "Change" .. cidx .. "IconCount", 0) do
                    local typ = Wag:GetNW2Int("BNT:Station" .. idx .. "Change" .. cidx .. "IconType" .. iidx, 0)
                    local symbol = Wag:GetNW2String("BNT:Station" .. idx .. "Change" .. cidx .. "IconSymbol" .. iidx, "?")
                    local color = Wag:GetNW2String("BNT:Station" .. idx .. "Change" .. cidx .. "IconColor" .. iidx, "#6e6e6e")
                    local path = Wag:GetNW2String("BNT:Station" .. idx .. "Change" .. cidx .. "IconPath" .. iidx, "zxc765/bnt/changeNormal.png")
                    local sz = sizeChange * changeScale
                    local ix, iy = x + boxW + sizeChangeGap, y - boxH + offsetChangeY + (boxH - sz) / 2 + 20 * (1 - fade)
                    local iconIdent = (typ > 1 and path or symbol)
                    if typ < 5 and prevIcon ~= iconIdent then
                        color = self:GetCachedColor(color, fade)
                        surface.SetMaterial(typ == 1 and changeMat or self:GetCachedMaterial(path))
                        surface.SetDrawColor(color)
                        surface.DrawTexturedRect(ix, iy, sz, sz)
                        if typ <= 2 then
                            draw.SimpleText(symbol, "BNT.ChangeSymbol" .. (idx > 2 and "" or fontFrame), math.floor(ix + sz / 2), iy + sz / 2 - 2, self:GetCachedColor(color.a > 20 and isLight(color) and colorBlack or colorBackground, fade), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                        end
                        boxW = boxW + (sizeChangeGap + sz) * (idx == 1 and 1 - stationAnim or 1)
                        change = change or typ < 4
                        prevIcon = iconIdent
                    end
                end
            end

            boxW = math.max(minBoxW, boxW + gap)
            if not change then
                surface.SetDrawColor(lineColor)
                surface.DrawRect(x, liney - 24, 24, 24)
            else
                table.insert(circles1, circle(x + 12, liney + 11, 40, 40))
                table.insert(circles2, circle(x + 12, liney + 11, 18, 20))
            end
            if idx == stcount then
                lineEnd = x
            end
            if not change and (idx == stcount or idx <= 2 and firstStation or idx == 1 and secondStation) then
                surface.SetDrawColor(lineColor)
                surface.DrawRect(x, liney, 24, 44)
            end
            x = x + boxW + (idx == 1 and Lerp(stationAnim, 0, x0) or 0)
            if x > scw then break end
        end

        if changesFooter > 0 then
            x, y = x0, liney + 120 - 20 * (1 - changesFooter)
            local idx = stationAnim < 1 and 1 or 2
            local sz = sizeChange * 1.4
            for cidx = 1, Wag:GetNW2Int("BNT:Station" .. idx .. "ChangeCount", 0) do
                local text = Wag:GetNW2String("BNT:Station" .. idx .. "ChangeName" .. cidx, "")
                local textEng = Wag:GetNW2String("BNT:Station" .. idx .. "ChangeNameEng" .. cidx, "")
                for iidx = 1, Wag:GetNW2Int("BNT:Station" .. idx .. "Change" .. cidx .. "IconCount", 0) do
                    local ix, iy = x, y - sz / 2
                    local typ = Wag:GetNW2Int("BNT:Station" .. idx .. "Change" .. cidx .. "IconType" .. iidx, 0)
                    local symbol = Wag:GetNW2String("BNT:Station" .. idx .. "Change" .. cidx .. "IconSymbol" .. iidx, "?")
                    local color = Wag:GetNW2String("BNT:Station" .. idx .. "Change" .. cidx .. "IconColor" .. iidx, "#6e6e6e")
                    local path = Wag:GetNW2String("BNT:Station" .. idx .. "Change" .. cidx .. "IconPath" .. iidx, "zxc765/bnt/changeNormal.png")
                    color = self:GetCachedColor(color, changesFooter)
                    surface.SetMaterial(typ ~= 1 and self:GetCachedMaterial(path) or changeMat)
                    surface.SetDrawColor(color)
                    surface.DrawTexturedRect(ix, iy, sz, sz)
                    if typ <= 2 then
                        draw.SimpleText(symbol, "BNT.ChangeSymbolBig", math.floor(ix + sz / 2), math.floor(y - 4), color.a > 50 and isLight(color) and colorBlack or colorBackground, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                    x = x + sz + 8
                end
                local tw = draw.SimpleText(text, "BNT.Footer", x, y + 8, self:GetCachedColor(colorBlack, changesFooter), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
                draw.SimpleText(textEng, "BNT.FooterEng", x, y, self:GetCachedColor(colorEng, changesFooter), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                x = x + tw + 40
            end
        end

        surface.SetDrawColor(lineColor)
        surface.DrawRect(linex, liney, lineEnd - linex, 24)
        draw.NoTexture()
        surface.SetDrawColor(lineColor)
        for _, c in ipairs(circles1) do
            surface.DrawPoly(c)
        end
        surface.SetDrawColor(colorBackground)
        for _, c in ipairs(circles2) do
            surface.DrawPoly(c)
        end

        if terminusAnim > 0 then
            surface.SetDrawColor(255, 255, 255)
            surface.SetMaterial(termMat)
            surface.DrawTexturedRect(termx, termy, sizeTrminusBanner, sch)
            local tx, ty = termx + 40, termy + 70
            draw.DrawText("Конечная", "BNT.TerminusHeader", tx, ty, colorBlack, TEXT_ALIGN_LEFT)
            draw.DrawText("Поезд дальше не идет\nПожалуйста, выйдите из вагонов", "BNT.Terminus", tx, ty + 100, colorBlack, TEXT_ALIGN_LEFT)
            draw.DrawText("This train terminates here\nPlease leave the train", "BNT.Terminus", tx, ty + 260, colorEng, TEXT_ALIGN_LEFT)
        end
    end

    function TRAIN_SYSTEM:GetCachedColor(str, alpha)
        local k = istable(str) and string.format("%d.%d.%d.%d", str.r, str.g, str.b, str.a) or str
        if alpha then alpha = math.Round(alpha, 3) k = string.format("%s.%d", k, alpha * 100) end
        if not self.colors[k] then
            local color = not istable(str) and HexToColor(str) or str
            self.colors[k] = alpha and ColorAlpha(color, alpha * color.a) or color
        end
        return self.colors[k]
    end

    function TRAIN_SYSTEM:GetCachedMaterial(path)
        if not path then return end
        if not self.colors[path] then
            self.colors[path] = Material(path, "smooth ignorez")
        end
        return self.colors[path]
    end
end
