ENT.Type = "anim"
ENT.Base = "gmod_subway_base"
ENT.PrintName = "81-760E PvVZ"
ENT.Author = ""
ENT.Contact = ""
ENT.Purpose = ""
ENT.Instructions = ""
ENT.Category = "Metrostroi (trains)"
ENT.SkinsType = "81-760e"
ENT.Model = "models/metrostroi_train/81-760/81_760a_body.mdl"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.DontAccelerateSimulation = false


local function GetDoorPosition(i, k, j)
    if j == 0 then
        return Vector(381 - 36.0 + 1 * k - 0.85 * (k == 1 and 1 or 0) - 230 * i, -66 * (1 - 2 * k), -1)
    else
        return Vector(381 - 36.0 + 1 * k - 0.85 * (k == 1 and 1 or 0) - 230 * i, -66 * (1 - 2 * k), -1)
    end
end

ENT.LeftDoorPositions = {}
ENT.RightDoorPositions = {}
for i = 0, 3 do
    for k = 0, 1 do
        if k == 1 then
            table.insert(ENT.LeftDoorPositions, GetDoorPosition(i, k))
        else
            table.insert(ENT.RightDoorPositions, GetDoorPosition(i, k))
        end
    end
end

function ENT:PassengerCapacity()
    return 300
end

function ENT:GetStandingArea()
    return Vector(-450, -30, -53), Vector(360, 30, -53)
end

local yventpos = {-414.5 + 0 * 117, -414.5 + 1 * 117 + 6.2, -414.5 + 2 * 117 + 5, -414.5 + 3 * 117 + 2, -414.5 + 4 * 117 + 0.5, -414.5 + 5 * 117 - 2.3, -414.5 + 6 * 117,}
function ENT:InitializeSounds()
    self.BaseClass.InitializeSounds(self)
    -- [[                            BEGIN EXPERIMENTAL ENGINES                            ]]
    self.SoundNames["vvvf1"] = {
        "subway_trains/720a/VVVF/motor1.mp3",
        loop = true
    }

    self.SoundPositions["vvvf1"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf2"] = {
        "subway_trains/720a/VVVF/motor2.mp3",
        loop = true
    }

    self.SoundPositions["vvvf2"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf3"] = {
        "subway_trains/720a/VVVF/motor3.mp3",
        loop = true
    }

    self.SoundPositions["vvvf3"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf4"] = {
        "subway_trains/720a/VVVF/motor4.mp3",
        loop = true
    }

    self.SoundPositions["vvvf4"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf5"] = {
        "subway_trains/720a/VVVF/motor5.mp3",
        loop = true
    }

    self.SoundPositions["vvvf5"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf6"] = {
        "subway_trains/720a/VVVF/motor6.mp3",
        loop = true
    }

    self.SoundPositions["vvvf6"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf7"] = {
        "subway_trains/720a/VVVF/motor7.mp3",
        loop = true
    }

    self.SoundPositions["vvvf7"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf8"] = {
        "subway_trains/720a/VVVF/motor8.mp3",
        loop = true
    }

    self.SoundPositions["vvvf8"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf9"] = {
        "subway_trains/720a/VVVF/motor9.mp3",
        loop = true
    }

    self.SoundPositions["vvvf9"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf10"] = {
        "subway_trains/720a/VVVF/motor10.mp3",
        loop = true
    }

    self.SoundPositions["vvvf10"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf11"] = {
        "subway_trains/720a/VVVF/motor11.mp3",
        loop = true
    }

    self.SoundPositions["vvvf11"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf12"] = {
        "subway_trains/720a/VVVF/motor12.mp3",
        loop = true
    }

    self.SoundPositions["vvvf12"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf13"] = {
        "subway_trains/720a/VVVF/motor13.mp3",
        loop = true
    }

    self.SoundPositions["vvvf13"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf14"] = {
        "subway_trains/720a/VVVF/motor14.mp3",
        loop = true
    }

    self.SoundPositions["vvvf14"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf15"] = {
        "subway_trains/720a/VVVF/motor15.mp3",
        loop = false
    }

    self.SoundPositions["vvvf15"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf16"] = {
        "subway_trains/720a/VVVF/motor16.mp3",
        loop = true
    }

    self.SoundPositions["vvvf16"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf17"] = {
        "subway_trains/720a/VVVF/motor17.mp3",
        loop = true
    }

    self.SoundPositions["vvvf17"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf18"] = {
        "subway_trains/720a/VVVF/motor18.mp3",
        loop = true
    }

    self.SoundPositions["vvvf18"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf19"] = {
        "subway_trains/720a/VVVF/motor19.mp3",
        loop = true
    }

    self.SoundPositions["vvvf19"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf21"] = {
        "subway_trains/720a/VVVF/motor21.mp3",
        loop = true
    }

    self.SoundPositions["vvvf21"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf22"] = {
        "subway_trains/720a/VVVF/motor22.mp3",
        loop = true
    }

    self.SoundPositions["vvvf22"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf23"] = {
        "subway_trains/720a/VVVF/motor23.mp3",
        loop = true
    }

    self.SoundPositions["vvvf23"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf24"] = {
        "subway_trains/720a/VVVF/motor24.mp3",
        loop = true
    }

    self.SoundPositions["vvvf24"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf25"] = {
        "subway_trains/720a/VVVF/motor25.mp3",
        loop = true
    }

    self.SoundPositions["vvvf25"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf26"] = {
        "subway_trains/720a/VVVF/motor26.mp3",
        loop = true
    }

    self.SoundPositions["vvvf26"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf27"] = {
        "subway_trains/720a/VVVF/motor27.mp3",
        loop = true
    }

    self.SoundPositions["vvvf27"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["vvvf28"] = {
        "subway_trains/720a/VVVF/motor28.mp3",
        loop = true
    }

    self.SoundPositions["vvvf28"] = {400, 1e9, Vector(0, 0, -448), 1}
    self.SoundNames["ONIX"] = {
        "subway_trains/760/engines/inverter.wav",
        loop = true
    }

    self.SoundPositions["ONIX"] = {400, 1e9, Vector(0, 0, -448), 0.5}
    self.SoundNames["KATP_lowspeed"] = {
        "subway_trains/720a/inverter_lowspeed.wav",
        loop = true
    }

    self.SoundPositions["KATP_lowspeed"] = {400, 1e9, Vector(0, 0, -448), 1.8}
    self.SoundNames["KATP"] = {
        "subway_trains/720a/inverter_katp3.wav",
        loop = true
    }

    self.SoundPositions["KATP"] = {400, 1e9, Vector(0, 0, -448), 2.5}
    self.SoundNames["Hitachi"] = {
        "subway_trains/720a/inverter.wav",
        loop = true
    }

    self.SoundPositions["Hitachi"] = {400, 1e9, Vector(0, 0, -448), 0.5}
    self.SoundNames["Hitachi2"] = {
        "subway_trains/722/engines/inverter_2000.wav",
        loop = true
    }

    self.SoundPositions["Hitachi2"] = {400, 1e9, Vector(0, 0, -448), 1.5}
    self.SoundNames["Hitachi2_2"] = {
        "subway_trains/720a/inverter.wav",
        loop = true
    }

    self.SoundPositions["Hitachi2_2"] = {400, 1e9, Vector(0, 0, -448), 0.4}
    self.SoundNames["Hitachi2_1"] = {
        "subway_trains/722/engines/inverter_2000.wav",
        loop = true
    }

    self.SoundPositions["Hitachi2_1"] = {400, 1e9, Vector(0, 0, -448), 1.5}
    self.SoundNames["async_p2"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundPositions["async_p2"] = {400, 1e9, Vector(0, 0, 0), 1.2}
    self.SoundNames["async_p2_1"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundPositions["async_p2_1"] = {400, 1e9, Vector(0, 0, 0), 1}
    self.SoundNames["async_p3"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundPositions["async_p3"] = {400, 1e9, Vector(0, 0, 0), 1.4}
    self.SoundNames["async_p3_1"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundPositions["async_p3_1"] = {400, 1e9, Vector(0, 0, 0), 1.4}
    self.SoundNames["test_async_start"] = {
        "subway_trains/722/engines/inverter_start2.wav",
        loop = true
    }

    self.SoundNames["test_async1_n"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundNames["test_async1_2_n"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundNames["test_async1_3_n"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundNames["test_async2_n"] = {
        "subway_trains/722/engines/inverter_2000.wav",
        loop = true
    }

    self.SoundNames["test_async3_n"] = {
        "subway_trains/722/engines/inverter_2800.wav",
        loop = true
    }

    self.SoundNames["test_async3_2_n"] = {
        "subway_trains/722/engines/inverter_2800.wav",
        loop = true
    }

    self.SoundPositions["test_async_start"] = {400, 1e9, Vector(0, 0, 0), 0.5}
    self.SoundPositions["test_async1_n"] = {400, 1e9, Vector(0, 0, 0), 0.5}
    self.SoundPositions["test_async1_2_n"] = {400, 1e9, Vector(0, 0, 0), 0.1}
    self.SoundPositions["test_async1_3_n"] = {400, 1e9, Vector(0, 0, 0), 0.1}
    self.SoundPositions["test_async2_n"] = {400, 1e9, Vector(0, 0, 0), 0.1}
    self.SoundPositions["test_async3_n"] = {400, 1e9, Vector(0, 0, 0), 0.1}
    self.SoundPositions["test_async3_2_n"] = self.SoundPositions["test_async3_n"]
    self.SoundNames["async_p2_n"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundPositions["async_p2_n"] = {400, 1e9, Vector(0, 0, 0), 1}
    self.SoundNames["async_p2_1_n"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundPositions["async_p2_1_n"] = {400, 1e9, Vector(0, 0, 0), 1.9}
    self.SoundNames["async_p3_n"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundPositions["async_p3_n"] = {400, 1e9, Vector(0, 0, 0), 1.5}
    self.SoundNames["async_p3_1_n"] = {
        "subway_trains/722/engines/inverter_1000.wav",
        loop = true
    }

    self.SoundPositions["async_p3_1_n"] = {400, 1e9, Vector(0, 0, 0), 1.5}
    self.SoundNames["engine_loud"] = {
        "subway_trains/722/engines/engine_loud.wav",
        loop = true
    }

    self.SoundPositions["engine_loud"] = {400, 1e9, Vector(0, 0, 0), 0.32}
    self.SoundNames["chopper_hitachi"] = {
        "subway_trains/722/chopper.wav",
        loop = true
    }

    self.SoundPositions["chopper_hitachi"] = {400, 1e9, Vector(0, 0, 0), 0.05}
    self.SoundNames["chopper_katp"] = {
        "subway_trains/720a/chopper.mp3",
        loop = true
    }

    self.SoundPositions["chopper_katp"] = {400, 1e9, Vector(0, 0, 0), 0.35}
    self.SoundNames["chopper_onix"] = {
        "subway_trains/720a/chopper_onix.wav",
        loop = true
    }

    self.SoundPositions["chopper_onix"] = {400, 1e9, Vector(0, 0, 0), 0.2}
    -- [[                              END EXPERIMENTAL ENGINES                            ]]
    self.SoundNames["async1"] = {
        "subway_trains/760/engines/inverter.wav",
        loop = true
    }

    self.SoundPositions["async1"] = {400, 1e9, Vector(0, 0, 0), 0.5}
    for i = 1, 7 do
        self.SoundNames["vent" .. i] = {
            loop = true,
            "subway_trains/720/vent_mix.wav"
        }

        self.SoundPositions["vent" .. i] = {100, 1e9, Vector(yventpos[i], 0, 30), 0.5}
    end

    self.SoundNames["ring"] = {
        loop = true, --{"subway_trains/760/ring/ring760_start.mp3","subway_trains/760/new/ring760_loop.mp3","subway_trains/760/ring/ring760_end.mp3"}
        "subway_trains/760/new/ring_ars.wav"
    }

    self.SoundPositions["ring"] = {100, 1e9, Vector(409, 25.6, -26.3)}
    self.SoundNames["compressor"] = {
        loop = true, --{loop=true,"subway_trains/722/compressol_loop.wav"}
        "subway_trains/760/new/compressor_loop.wav"
    }

    self.SoundPositions["compressor"] = {
        800, --FIXME: Pos
        1e9,
        Vector(-118, -40, -66)
    }

    self.SoundNames["compressor_pn1"] = "subway_trains/760/new/compressor_dhm.wav"
    self.SoundPositions["compressor_pn1"] = {
        800, --FIXME: Pos
        1e9,
        Vector(-118, -40, -66)
    }

    self.SoundNames["compressor_pn2"] = "subway_trains/760/new/compressor_dhm_2.wav"
    self.SoundPositions["compressor_pn2"] = {
        800, --FIXME: Pos	
        1e9,
        Vector(-118, -40, -66)
    }

    self.SoundNames["release"] = {
        loop = true,
        "subway_trains/760/new/pneumo_release2.wav"
    }

    self.SoundPositions["release"] = {
        320, --FIXME: Pos
        1e9,
        Vector(-183, 0, -70),
        0.4
    }

    self.SoundNames["parking_brake"] = {
        loop = true,
        "subway_trains/common/pneumatic/autostop_loop.wav"
    }

    self.SoundPositions["parking_brake"] = {400, 1e9, Vector(-183, 0, -70), 0.95}
    self.SoundNames["crane013_brake"] = {
        loop = true,
        "subway_trains/common/pneumatic/release_2.wav"
    }

    self.SoundPositions["crane013_brake"] = {80, 1e9, Vector(475, -10, -47.9), 0.86}
    self.SoundNames["crane013_brake2"] = {
        loop = true,
        "subway_trains/common/pneumatic/013_brake2.wav"
    }

    self.SoundPositions["crane013_brake2"] = {80, 1e9, Vector(475, -10, -47.9), 0.86}
    self.SoundNames["crane013_release"] = {
        loop = true,
        "subway_trains/common/pneumatic/013_release.wav"
    }

    self.SoundPositions["crane013_release"] = {80, 1e9, Vector(475, -10, -47.9), 0.4}
    self.SoundNames["pneumo_disconnect_close"] = {"subway_trains/760/013_close1.wav"}
    self.SoundNames["pneumo_disconnect_open"] = {"subway_trains/760/013_open1.wav",}
    self.SoundPositions["pneumo_disconnect_close"] = {100, 1e9, Vector(478, 45, -61), 0.5}
    self.SoundPositions["pneumo_disconnect_open"] = {100, 1e9, Vector(478, 45, -61), 0.5}
    self.SoundPositions["pneumo_disconnect_close"] = {100, 1e9, Vector(478, 45, -61), 0.5}
    self.SoundPositions["pneumo_disconnect_open"] = {100, 1e9, Vector(478, 45, -61), 0.5}
    self.SoundNames["front_isolation"] = {
        loop = true,
        "subway_trains/common/pneumatic/isolation_leak.wav"
    }

    self.SoundPositions["front_isolation"] = {300, 1e9, Vector(500, 0, -63), 1}
    self.SoundNames["rear_isolation"] = {
        loop = true,
        "subway_trains/common/pneumatic/isolation_leak.wav"
    }

    self.SoundPositions["rear_isolation"] = {300, 1e9, Vector(-469, 0, -63), 1}
    self.SoundNames["horn"] = {
        loop = 0.6,
        "subway_trains/common/pneumatic/horn/horn3_start.wav",
        "subway_trains/common/pneumatic/horn/horn3_loop.wav",
        "subway_trains/common/pneumatic/horn/horn3_end.wav"
    }

    self.SoundPositions["horn"] = {1100, 1e9, Vector(500, 0, -30)}
    self.SoundNames["KV_-3_-2"] = "subway_trains/722/kuau/x_xp.mp3"
    self.SoundNames["KV_-2_-1"] = "subway_trains/722/kuau/xp_x2.mp3"
    self.SoundNames["KV_-1_0"] = "subway_trains/722/kuau/x_xp.mp3"
    self.SoundNames["KV_0_1"] = "subway_trains/722/kuau/0_x.mp3"
    self.SoundNames["KV_1_2"] = "subway_trains/722/kuau/x_xp.mp3"
    self.SoundNames["KV_2_1"] = "subway_trains/722/kuau/xp_x2.mp3"
    self.SoundNames["KV_1_0"] = "subway_trains/722/kuau/x_xp.mp3"
    self.SoundNames["KV_0_-1"] = "subway_trains/722/kuau/0_x.mp3"
    self.SoundNames["KV_-1_-2"] = "subway_trains/722/kuau/x_xp.mp3"
    self.SoundNames["KV_-2_-3"] = "subway_trains/722/kuau/xp_x.mp3"
    self.SoundPositions["KV_-3_-2"] = {80, 1e9, Vector(461.8, 25.3, -27.7)}
    self.SoundPositions["KV_-2_-1"] = self.SoundPositions["KV_-3_-2"]
    self.SoundPositions["KV_-1_0"] = self.SoundPositions["KV_-3_-2"]
    self.SoundPositions["KV_0_1"] = self.SoundPositions["KV_-3_-2"]
    self.SoundPositions["KV_1_2"] = self.SoundPositions["KV_-3_-2"]
    self.SoundPositions["KV_2_1"] = self.SoundPositions["KV_-3_-2"]
    self.SoundPositions["KV_1_0"] = self.SoundPositions["KV_-3_-2"]
    self.SoundPositions["KV_0_-1"] = self.SoundPositions["KV_-3_-2"]
    self.SoundPositions["KV_-1_-2"] = self.SoundPositions["KV_-3_-2"]
    self.SoundPositions["KV_-2_-3"] = self.SoundPositions["KV_-3_-2"]
    self.SoundNames["kro_in"] = {"subway_trains/717/kru/kru_insert1.mp3", "subway_trains/717/kru/kru_insert2.mp3"}
    self.SoundNames["kro_out"] = {"subway_trains/717/kru/kru_eject1.mp3", "subway_trains/717/kru/kru_eject2.mp3", "subway_trains/717/kru/kru_eject3.mp3",}
    self.SoundNames["kro_-1_0"] = {"subway_trains/717/kru/kru0-1_1.mp3", "subway_trains/717/kru/kru0-1_2.mp3", "subway_trains/717/kru/kru0-1_3.mp3", "subway_trains/717/kru/kru0-1_4.mp3",}
    self.SoundNames["kro_0_1"] = {"subway_trains/717/kru/kru1-2_1.mp3", "subway_trains/717/kru/kru1-2_2.mp3", "subway_trains/717/kru/kru1-2_3.mp3", "subway_trains/717/kru/kru1-2_4.mp3",}
    self.SoundNames["kro_1_0"] = {"subway_trains/717/kru/kru2-1_1.mp3", "subway_trains/717/kru/kru2-1_2.mp3", "subway_trains/717/kru/kru2-1_3.mp3", "subway_trains/717/kru/kru2-1_4.mp3",}
    self.SoundNames["kro_0_-1"] = {"subway_trains/717/kru/kru1-0_1.mp3", "subway_trains/717/kru/kru1-0_2.mp3", "subway_trains/717/kru/kru1-0_3.mp3", "subway_trains/717/kru/kru1-0_4.mp3",}
    self.SoundPositions["kro_in"] = {80, 1e9, Vector(463.4, 53.3, -21.1)}
    self.SoundPositions["kro_out"] = self.SoundPositions["kro_in"]
    self.SoundPositions["kro_-1_0"] = self.SoundPositions["kro_in"]
    self.SoundPositions["kro_0_1"] = self.SoundPositions["kro_in"]
    self.SoundPositions["kro_1_0"] = self.SoundPositions["kro_in"]
    self.SoundPositions["kro_0_-1"] = self.SoundPositions["kro_in"]
    self.SoundNames["krr_in"] = self.SoundNames["kro_in"]
    self.SoundNames["krr_out"] = self.SoundNames["kro_out"]
    self.SoundNames["krr_-1_0"] = self.SoundNames["kro_-1_0"]
    self.SoundNames["krr_0_1"] = self.SoundNames["kro_0_1"]
    self.SoundNames["krr_1_0"] = self.SoundNames["kro_1_0"]
    self.SoundNames["krr_0_-1"] = self.SoundNames["kro_0_-1"]
    self.SoundPositions["krr_in"] = {80, 1e9, Vector(470.4, 53.9, -17.3)}
    self.SoundPositions["krr_out"] = self.SoundPositions["krr_in"]
    self.SoundPositions["krr_-1_0"] = self.SoundPositions["krr_in"]
    self.SoundPositions["krr_0_1"] = self.SoundPositions["krr_in"]
    self.SoundPositions["krr_1_0"] = self.SoundPositions["krr_in"]
    self.SoundPositions["krr_0_-1"] = self.SoundPositions["krr_in"]
    self.SoundNames["switch_batt_on"] = {"subway_trains/760/vb_on.wav"}
    self.SoundNames["switch_batt_off"] = {"subway_trains/720/switches/batt_off.mp3", "subway_trains/720/switches/batt_off2.mp3"}
    self.SoundNames["switch_batt"] = {"subway_trains/720/switches/batt_on.mp3", "subway_trains/720/switches/batt_on2.mp3", "subway_trains/720/switches/batt_off.mp3", "subway_trains/720/switches/batt_off2.mp3"}
    self.SoundNames["switch_pvz_on"] = {"subway_trains/720/switches/switchb_on.mp3", "subway_trains/720/switches/switchp_on.mp3"}
    self.SoundNames["switch_pvz_off"] = {"subway_trains/720/switches/switchb_off.mp3", "subway_trains/720/switches/switchp_off.mp3"}
    self.SoundNames["switch_on"] = {"subway_trains/720/switches/switchp_on.mp3", "subway_trains/720/switches/switchp_on2.mp3", "subway_trains/720/switches/switchp_on3.mp3"}
    self.SoundNames["switch_off"] = {"subway_trains/720/switches/switchp_off.mp3", "subway_trains/720/switches/switchp_off2.mp3", "subway_trains/720/switches/switchp_off3.mp3"}

    self.SoundNames["button_press"] = {"subway_trains/760/switches/butt_press.mp3","subway_trains/760/switches/butt_press2.mp3","subway_trains/760/switches/butt_press3.mp3"}
    self.SoundNames["button_release"] = {"subway_trains/760/switches/butt_release.mp3","subway_trains/760/switches/butt_release2.mp3","subway_trains/760/switches/butt_release3.mp3"}
    self.SoundNames["button_square_press"] = "subway_trains/720/switches/butts_press.mp3"
    self.SoundNames["button_square_release"] = "subway_trains/720/switches/butts_release.mp3"
    self.SoundNames["button_square_on"] = {"subway_trains/720/switches/butts_on.mp3", "subway_trains/720/switches/butts_on2.mp3"}
    self.SoundNames["button_square_off"] = {"subway_trains/720/switches/butts_off.mp3", "subway_trains/720/switches/butts_off2.mp3"}

    self.SoundNames["door_cab_open"] = {"subway_trains/720/door/door_torec_open.mp3", "subway_trains/720/door/door_torec_open2.mp3"}
    self.SoundNames["door_cab_close"] = {"subway_trains/720/door/door_torec_close.mp3", "subway_trains/720/door/door_torec_close2.mp3"}
    self.SoundNames["door_cab_roll"] = {"subway_trains/720/door/cabdoor_roll1.mp3", "subway_trains/720/door/cabdoor_roll2.mp3", "subway_trains/720/door/cabdoor_roll3.mp3", "subway_trains/720/door/cabdoor_roll4.mp3"}

    self.SoundNames["battery_on_1"]   = "subway_trains/722/battery/battery_off_1.mp3"
    self.SoundPositions["battery_on_1"] = {100,1e9,Vector(182,50,-75),0.5}
    self.SoundNames["battery_off_1"]   = "subway_trains/722/battery/battery_off_1.mp3"
    self.SoundPositions["battery_off_1"] = {100,1e9,Vector(182,50,-75),1}
    self.SoundNames["battery_off_2"]   = "subway_trains/722/battery/battery_off_2.mp3"
    self.SoundPositions["battery_off_2"] = {100,1e9,Vector(182,50,-75),1}
    self.SoundNames["battery_pneumo"]   = "subway_trains/722/battery/battery_pneumo.mp3"
    self.SoundPositions["battery_pneumo"] = {200,1e9,Vector(182,50,-75),0.5}

    self.SoundNames["rolling_10"] = {loop=true,"subway_trains/760/rolling/rolling_10.wav"}
    self.SoundNames["rolling_45"] = {loop=true,"subway_trains/760/rolling/rolling_45.wav"}
    self.SoundNames["rolling_60"] = {loop=true,"subway_trains/760/rolling/rolling_60.wav"}
    self.SoundNames["rolling_70"] = {loop=true,"subway_trains/760/rolling/rolling_70.wav"}
    self.SoundPositions["rolling_10"] = {485,1e9,Vector(0,0,0),0.20}
    self.SoundPositions["rolling_45"] = {485,1e9,Vector(0,0,0),0.50}
    self.SoundPositions["rolling_60"] = {485,1e9,Vector(0,0,0),0.55}
    self.SoundPositions["rolling_70"] = {485,1e9,Vector(0,0,0),0.60}
    self.SoundNames["rolling_low"] = {loop=true,"subway_trains/760/rolling/rolling_outside_low.wav"}
    self.SoundNames["rolling_medium1"] = {loop=true,"subway_trains/760/rolling/rolling_outside_medium1.wav"}
    self.SoundNames["rolling_medium2"] = {loop=true,"subway_trains/760/rolling/rolling_outside_medium2.wav"}
    self.SoundNames["rolling_high2"] = {loop=true,"subway_trains/760/rolling/rolling_outside_high2.wav"}
    self.SoundPositions["rolling_low"] = {480,1e12,Vector(0,0,0),0.6*0.4}
    self.SoundPositions["rolling_medium1"] = {480,1e12,Vector(0,0,0),0.90*0.4}
    self.SoundPositions["rolling_medium2"] = {480,1e12,Vector(0,0,0),0.90*0.4}
    self.SoundPositions["rolling_high2"] = {480,1e12,Vector(0,0,0),1.00*0.4}

    self.SoundNames["gv_f"] = {"subway_trains/717/kv70/reverser_0-b_1.mp3", "subway_trains/717/kv70/reverser_0-b_2.mp3"}
    self.SoundNames["gv_b"] = {"subway_trains/717/kv70/reverser_b-0_1.mp3", "subway_trains/717/kv70/reverser_b-0_2.mp3"}
    self.SoundPositions["gv_f"] = {80, 1e9, Vector(126.4, 50, -60 - 23.5), 0.8}
    self.SoundPositions["gv_b"] = {80, 1e9, Vector(126.4, 50, -60 - 23.5), 0.8}
    self.SoundNames["disconnectvalve"] = "subway_trains/common/switches/pneumo_disconnect_switch.mp3"
    --self.SoundNames["doors"] = "subway_trains/720/door/door_roll.mp3"
    --self.SoundNames["doorl"] = {loop=true,"subway_trains/722/door_loop.wav"}
    --self.SoundPositions["doors"] = {300,1e9,Vector(0,0,0),0.5}
    --self.SoundPositions["doorl"] = {300,1e9,Vector(0,0,0),0.5}
    --self.SoundNames["work_beep"] = {loop=true,"subway_trains/720/work_beep_loop.wav"}
    --self.SoundPositions["work_beep"] = {100,1e9,Vector(407.5,23,10),0.05}
    self.SoundNames["batt_on"] = "subway_trains/720/batt_on.mp3"
    self.SoundPositions["batt_on"] = {400, 1e9, Vector(126.4, 50, -60 - 23.5), 0.3}
    self.SoundNames["igla_on"] = "subway_trains/common/other/igla/igla_on1.mp3"
    self.SoundNames["igla_off"] = "subway_trains/common/other/igla/igla_off2.mp3"
    self.SoundNames["igla_start1"] = "subway_trains/common/other/igla/igla_start.mp3"
    self.SoundNames["igla_start2"] = "subway_trains/common/other/igla/igla_start2.mp3"
    self.SoundNames["igla_alarm1"] = "subway_trains/common/other/igla/igla_alarm1.mp3"
    self.SoundNames["igla_alarm2"] = "subway_trains/common/other/igla/igla_alarm2.mp3"
    self.SoundNames["igla_alarm3"] = "subway_trains/common/other/igla/igla_alarm3.mp3"
    self.SoundPositions["igla_on"] = {50, 1e9, Vector(452.56, 62, 3.81), 0.3}
    self.SoundPositions["igla_off"] = {50, 1e9, Vector(452.56, 62, 3.81), 0.3}
    self.SoundPositions["igla_start1"] = {50, 1e9, Vector(452.56, 62, 3.81), 0.5}
    self.SoundPositions["igla_start2"] = {50, 1e9, Vector(452.56, 62, 3.81), 0.3}
    self.SoundPositions["igla_alarm1"] = {50, 1e9, Vector(452.56, 62, 3.81), 0.5}
    self.SoundPositions["igla_alarm2"] = {50, 1e9, Vector(452.56, 62, 3.81), 0.5}
    self.SoundPositions["igla_alarm3"] = {50, 1e9, Vector(452.56, 62, 3.81), 0.5}
    self.SoundNames["epk_brake"] = {
        loop = true,
        "subway_trains/760/new/rvtb_loop.wav"
    }

    self.SoundPositions["epk_brake"] = {80, 1e9, Vector(458, 56.5, -61), 0.65}
    self.SoundNames["epk_brake_close"] = {"subway_trains/760/new/rvtb_end.wav"}
    self.SoundPositions["epk_brake_close"] = {80, 1e9, Vector(458, 56.5, -61), 0.65}
    self.SoundNames["epk_brake_open"] = {"subway_trains/760/new/rvtb_start.wav"}
    self.SoundPositions["epk_brake_open"] = {80, 1e9, Vector(458, 56.5, -61), 0.65}
    self.SoundNames["valve_brake"] = {
        loop = true,
        "subway_trains/760/new/stopcrane_loop.wav"
    }

    self.SoundPositions["valve_brake"] = {400, 1e9, Vector(418.25, -49.2, 1.3), 1}
    self.SoundNames["valve_brake_close"] = {"subway_trains/760/stopkran_close.wav"}
    self.SoundPositions["valve_brake_close"] = {400, 1e9, Vector(418.25, -49.2, 1.3), 1}
    self.SoundNames["valve_brake_open"] = {"subway_trains/760/stopkran_open.wav"}
    self.SoundPositions["valve_brake_open"] = {400, 1e9, Vector(418.25, -49.2, 1.3), 1}
    self.SoundNames["emer_brake"] = {
        loop = true,
        "subway_trains/common/pneumatic/autostop_loop.wav"
    }

    self.SoundPositions["emer_brake"] = {600, 1e9, Vector(380, -45, -75), 0.95}
    self.SoundNames["vent_loop"] = {
        loop = true,
        "subway_trains/760/new/vent_cockpit_default_2.wav"
    }

    self.SoundPositions["vent_loop"] = {400, 1e9, Vector(422, 55, 40), 1}
    self.SoundNames["vent_loop_max"] = {
        loop = true,
        "subway_trains/760/new/vent_cockpit_high.wav"
    }

    self.SoundPositions["vent_loop_max"] = {400, 1e9, Vector(422, 55, 40), 1}

    for i = 0, 3 do
        for k = 0, 1 do
            self.SoundNames["door" .. i .. "x" .. k .. "r0"] = {loop = true, "subway_trains/765/doors/door_open_loop1.mp3"}
            self.SoundPositions["door" .. i .. "x" .. k .. "r0"] = {100, 1e9, GetDoorPosition(i, k), 0.8}
            self.SoundNames["door" .. i .. "x" .. k .. "r1"] = {loop = true, "subway_trains/765/doors/door_open_loop2.mp3"}
            self.SoundPositions["door" .. i .. "x" .. k .. "r1"] = {100, 1e9, GetDoorPosition(i, k), 0.8}

            self.SoundNames["door" .. i .. "x" .. k .. "o0"] = {"subway_trains/765/doors/door_open_end1.mp3"}
            self.SoundPositions["door" .. i .. "x" .. k .. "o0"] = {150, 1e9, GetDoorPosition(i, k), 1.0}
            self.SoundNames["door" .. i .. "x" .. k .. "o1"] = {"subway_trains/765/doors/door_open_end2.mp3"}
            self.SoundPositions["door" .. i .. "x" .. k .. "o1"] = {150, 1e9, GetDoorPosition(i, k), 1.0}

            self.SoundNames["door" .. i .. "x" .. k .. "op0"] = {"subway_trains/765/doors/door_open_start1.mp3"}
            self.SoundPositions["door" .. i .. "x" .. k .. "op0"] = {150, 1e9, GetDoorPosition(i, k), 1.0}
            self.SoundNames["door" .. i .. "x" .. k .. "op1"] = {"subway_trains/765/doors/door_open_start2.mp3"}
            self.SoundPositions["door" .. i .. "x" .. k .. "op1"] = {150, 1e9, GetDoorPosition(i, k), 1.0}

            self.SoundNames["door" .. i .. "x" .. k .. "c0"] = {"subway_trains/765/doors/door_close_end1.mp3"}
            self.SoundPositions["door" .. i .. "x" .. k .. "c0"] = {250, 1e9, GetDoorPosition(i, k), 1.0}
            self.SoundNames["door" .. i .. "x" .. k .. "c1"] = {"subway_trains/765/doors/door_close_end2.mp3"}
            self.SoundPositions["door" .. i .. "x" .. k .. "c1"] = {250, 1e9, GetDoorPosition(i, k), 1.0}
        end
    end

    local doorAlarmFile = self:GetNW2Bool("FastDoorSignal", true) and "subway_trains/765/doors/door_alarm_fast.mp3" or "subway_trains/765/doors/door_alarm.mp3"
    for k, tbl in ipairs({self.LeftDoorPositions or {}, self.RightDoorPositions or {}}) do
        for i, pos in ipairs(tbl) do
            local idx = (k - 1) * 4 + i
            local sid = "door_alarm_" .. idx
            self.SoundNames[sid] = { loop = true, doorAlarmFile }
            self.SoundPositions[sid] = { 100, 1e9, pos + Vector(0, 0, 30), 1 }
        end
    end

    self.SoundNames["door_alarm"] = {"subway_trains/760/new/door_alarm_fast.mp3"}
    self.SoundPositions["door_alarm"] = {485, 1e9, Vector(0, 0, 0), 0.25}
    self.SoundNames["sf_on"] = "subway_trains/722/switches/sf_on.mp3"
    self.SoundNames["sf_off"] = "subway_trains/722/switches/sf_off.mp3"
    self.SoundNames["door_cab_l_open"] = self.SoundNames["door_cab_open"]
    self.SoundPositions["door_cab_l_open"] = {800, 1e9, Vector(412.8, 63.2, 34.5), 0.5}
    self.SoundNames["door_cab_l_close"] = self.SoundNames["door_cab_close"]
    self.SoundPositions["door_cab_l_close"] = {800, 1e9, Vector(412.8, 63.2, 34.5), 0.5}
    self.SoundNames["door_cab_r_open"] = self.SoundNames["door_cab_open"]
    self.SoundPositions["door_cab_r_open"] = {800, 1e9, Vector(412.8, -63.2, 34.5), 0.5}
    self.SoundNames["door_cab_r_close"] = self.SoundNames["door_cab_close"]
    self.SoundPositions["door_cab_r_close"] = {800, 1e9, Vector(412.8, -63.2, 34.5), 0.5}
    self.SoundNames["door_cab_m_open"] = self.SoundNames["door_cab_open"]
    self.SoundPositions["door_cab_m_open"] = {800, 1e9, Vector(380, 5, -12.3), 0.5}
    self.SoundNames["door_cab_m_close"] = self.SoundNames["door_cab_close"]
    self.SoundPositions["door_cab_m_close"] = {800, 1e9, Vector(380, 5, -12.3), 0.5}
    self.SoundNames["door_add_1_open"] = self.SoundNames["door_cab_open"]
    self.SoundPositions["door_add_1_open"] = {800, 1e9, Vector(411.2, -57.5, 45), 0.5}
    self.SoundNames["door_add_1_close"] = self.SoundNames["door_cab_close"]
    self.SoundPositions["door_add_1_close"] = {800, 1e9, Vector(411.2, -57.5, 45), 0.5}
    self.SoundNames["door_add_2_open"] = self.SoundNames["door_cab_open"]
    self.SoundPositions["door_add_2_open"] = {800, 1e9, Vector(406.5, -30.2, 45.5), 0.5}
    self.SoundNames["door_add_2_close"] = self.SoundNames["door_cab_close"]
    self.SoundPositions["door_add_2_close"] = {800, 1e9, Vector(406.5, -30.2, 45.5), 0.5}
    self.SoundNames["door_pvz_open"] = self.SoundNames["door_cab_open"]
    self.SoundPositions["door_pvz_open"] = {800, 1e9, Vector(411.6, 21, 42), 0.5}
    self.SoundNames["door_pvz_close"] = self.SoundNames["door_cab_close"]
    self.SoundPositions["door_pvz_close"] = {800, 1e9, Vector(411.6, 21, 42), 0.5}
    self.SoundNames["bkpu"] = {"subway_trains/760/vb_on.wav"}
    self.SoundPositions["bkpu"] = {800, 1e9, Vector(410.2, 59, 1), 0.5}
    self.SoundNames["ring_ppz"] = {
        loop = true,
        "subway_trains/760/new/ring_vityaz.wav"
    }

    self.SoundPositions["ring_ppz"] = {800, 1e9, Vector(410.2, 57, 1), 0.5}
    self.SoundNames["powerreserve"] = {"subway_trains/760/vb_on.wav"}
    self.SoundPositions["powerreserve"] = {800, 1e9, Vector(410.2, 55, 1), 0.5}
    self.SoundNames["bv_off"] = {"subway_trains/760/new/bv_off.wav"}
    self.SoundPositions["bv_off"] = {800, 1e9, Vector(0, 0, -45), 0.5}
    self.SoundNames["rvs1"] = {"subway_trains/722/door_alarm.mp3"}
    self.SoundPositions["rvs1"] = {800, 1e9, Vector(454.817, 60.54, -10.64), 0.5}
    for i = 1, 10 do
        local id1 = Format("b1tunnel_%d", i)
        local id2 = Format("b2tunnel_%d", i)
        self.SoundNames[id1.."a"] = {"subway_trains/760/rolling/wheels/tunnel/st"..i.."a.wav"}
        self.SoundNames[id1.."b"] = {"subway_trains/760/rolling/wheels/tunnel/st"..i.."b.wav"}
        self.SoundNames[id2.."a"] = {"subway_trains/760/rolling/wheels/tunnel/st"..i.."a.wav"}
        self.SoundNames[id2.."b"] = {"subway_trains/760/rolling/wheels/tunnel/st"..i.."b.wav"}
        self.SoundPositions[id1 .. "a"] = {700 * 0.75, 1e9, Vector(317 - 5, 0, -84), 1 * 0.5}
        self.SoundPositions[id1 .. "b"] = self.SoundPositions[id1 .. "a"]
        self.SoundPositions[id2 .. "a"] = {700 * 0.75, 1e9, Vector(-317 + 0, 0, -84), 1 * 0.5}
        self.SoundPositions[id2 .. "b"] = self.SoundPositions[id2 .. "a"]
    end

    for i = 1, 14 do
        local id1 = Format("b1street_%d", i)
        local id2 = Format("b2street_%d", i)
        self.SoundNames[id1.."a"] = {"subway_trains/760/rolling/wheels/street/street_"..i.."a.mp3"}
        self.SoundNames[id1.."b"] = {"subway_trains/760/rolling/wheels/street/street_"..i.."b.mp3"}
        self.SoundNames[id2.."a"] = {"subway_trains/760/rolling/wheels/street/street_"..i.."a.mp3"}
        self.SoundNames[id2.."b"] = {"subway_trains/760/rolling/wheels/street/street_"..i.."b.mp3"}
        self.SoundPositions[id1 .. "a"] = {700, 1e9, Vector(317 - 5, 0, -84), 1.5 * 0.5}
        self.SoundPositions[id1 .. "b"] = self.SoundPositions[id1 .. "a"]
        self.SoundPositions[id2 .. "a"] = {700, 1e9, Vector(-317 + 0, 0, -84), 1.5 * 0.5}
        self.SoundPositions[id2 .. "b"] = self.SoundPositions[id2 .. "a"]
    end

    for k, v in ipairs(self.AnnouncerPositions) do
        self.SoundNames["announcer_noise1_" .. k] = {
            loop = true,
            "subway_announcers/upo/noiseS1.wav"
        }

        self.SoundPositions["announcer_noise1_" .. k] = {v[2] or 300, 1e9, v[1], v[3] * 0.2}
        self.SoundNames["announcer_noise2_" .. k] = {
            loop = true,
            "subway_announcers/upo/noiseS2.wav"
        }

        self.SoundPositions["announcer_noise2_" .. k] = {v[2] or 300, 1e9, v[1], v[3] * 0.2}
        self.SoundNames["announcer_noise3_" .. k] = {
            loop = true,
            "subway_announcers/upo/noiseS3.wav"
        }

        self.SoundPositions["announcer_noise3_" .. k] = {v[2] or 300, 1e9, v[1], v[3] * 0.2}
        self.SoundNames["announcer_noiseW" .. k] = {
            loop = true,
            "subway_announcers/upo/noiseW.wav"
        }

        self.SoundPositions["announcer_noiseW" .. k] = {v[2] or 300, 1e9, v[1], v[3] * 0.2}
        self.SoundPositions["announcer_noiseW" .. k] = {v[2] or 300, 1e9, v[1], v[3] * 0.2}

        self.SoundNames["announcer_sarmat_start" .. k] = {"subway_trains/722/sarmat_start.mp3"}
        self.SoundPositions["announcer_sarmat_start" .. k] = {v[2] or 300, 1e9, v[1], v[3] * 0.2}
    end

    local hornType = self:GetNW2Int("HornType", 0)
    if hornType == 2 then hornType = math.random(3, 5) end
    if hornType == 3 then
        self.SoundNames["horn"] = { loop = 0.6, "subway_trains/common/pneumatic/horn/horn1_start.wav","subway_trains/common/pneumatic/horn/horn1_loop.wav", "subway_trains/common/pneumatic/horn/horn1_end.mp3" }
        self.SoundPositions["horn"] = {1100,1e9,Vector(450,0,-55),1}
    elseif hornType == 4 then
        self.SoundNames["horn"] = { loop = 0.6, "subway_trains/common/pneumatic/horn/horn2_start.wav","subway_trains/common/pneumatic/horn/horn2_loop.wav", "subway_trains/common/pneumatic/horn/horn2_end.mp3" }
        self.SoundPositions["horn"] = {1100,1e9,Vector(450,0,-55),1}
    elseif hornType == 5 then
        self.SoundNames["horn"] = { loop = 0.6, "subway_trains/765/tifon/tifon_start.mp3","subway_trains/765/tifon/tifon_loop.mp3", "subway_trains/765/tifon/tifon_end.mp3" }
        self.SoundPositions["horn"] = {1100,1e9,Vector(450,0,-55),1}
    end
end

function ENT:InitializeSystems()
    self:LoadSystem("TR", "TR_3B") --"81_760_TR_7B")
    self:LoadSystem("Electric", "81_760E_Electric")
    self:LoadSystem("AsyncInverter", "81_760_AsyncInverter")
    self:LoadSystem("KV765", "81_765_Controller")
    self:LoadSystem("RV", "81_720_RV")
    self:LoadSystem("BUKP", "81_760E_BUKP")
    self:LoadSystem("BUV", "81_760E_BUV") --БКВУ
    self:LoadSystem("BUD", "81_765_BUD")
    self:LoadSystem("BARS", "81_760E_BARS")
    self:LoadSystem("SD3", "Relay", "Switch")
    self:LoadSystem("Pneumatic", "81_760E_Pneumatic")
    self:LoadSystem("Horn", "81_720_Horn")
    self:LoadSystem("Panel", "81_760E_Panel")

    -- Deprecated, candidate for removal
    self:LoadSystem("Announcer", "81_71_Announcer", "AnnouncementsASNP")

    self:LoadSystem("ASNP", "81_760_ASNP")
    self:LoadSystem("ASNP_VV", "81_760_ASNP_VV")
    self:LoadSystem("BackTicker", "81_760_Ticker")
    self:LoadSystem("IGLA_CBKI", "81_760_IGLA_CBKI1")
    self:LoadSystem("IGLA_PCBK", "81_760_IGLA_PCBK")
    self:LoadSystem("CIS", "81_760E_CIS")
    self:LoadSystem("RVS", "81_760A_RVS_1")
    self:LoadSystem("RPDP", "81_760_RPDP")
    self:LoadSystem("BNT", "81_760_BNT") --Монитор блока наддверного табло
    -- self:LoadSystem("Speedometer", "81_760E_Speedometer")
    -- self:LoadSystem("BMCIS", "81_760E_BMCIS")
    self:LoadSystem("BUIK", "81_765_BUIK")
    self:LoadSystem("RouteNumber", "81_760_RouteNumber")
    self:LoadSystem("CAMS", "81_760_CAMS")
    self:LoadSystem("Prost_Kos", "81_760E_Prost_Kos")
    --self:LoadSystem("MEZHWAG")
end

ENT.AnnouncerPositions = {}
table.insert(ENT.AnnouncerPositions, {Vector(470, 0, 44), 100, 0.1})
for i = 1, 4 do
    table.insert(ENT.AnnouncerPositions, {
        Vector(323 - (i - 1) * 230, --[[+37.5]]
            47, 44),
        100,
        0.1
    })

    table.insert(ENT.AnnouncerPositions, {Vector(323 - (i - 1) * 230, -47, 44), 100, 0.1})
end

ENT.Cameras = {
    --{Vector(407.5+17,32,22),Angle(0,180-7,0),"Train.760.CameraCond"},
    {Vector(412 + 17, 49, 1), Angle(0, 180, 0), "Train.760.CameraPPZ"},
    {Vector(445.5 + 11, 52, -1), Angle(0, 90, 0), "Train.760.CameraASNPIGLA"},
    {Vector(416.8 + 63, 45, -7), Angle(25, 20, 0), "Train.760.CameraCams"},
    {Vector(425.8 + 54, 25, -7), Angle(20, 0, 0), "БУ-ИК (Блок упр. Информац. Компл.)"},
    {Vector(425.8 + 57, 4, -10), Angle(20, 0, 0), "Train.760.CameraVityaz"},
    {Vector(427.5 + 40, -40, -25), Angle(55, -70, 0), "Train.760.CameraKRMH"},
    {Vector(407, 18, 9), Angle(0, 180, 0), "Train.760.CameraPVZ"},
    {Vector(520, 0, 15), Angle(60, 0, 0), "Автосцепка"},
}

---------------------------------------------------
-- Defined train information
-- Types of wagon(for wagon limit system):
-- 0 = Head or intherim
-- 1 = Only head
-- 2 = Only intherim
---------------------------------------------------
ENT.SubwayTrain = {
    Type = "81-760",
    Name = "81-760A",
    WagType = 1,
    Manufacturer = "MVM",
    ALS = {
        HaveAutostop = true,
        TwoToSix = true,
        RSAs325Hz = true,
        Aproove0As325Hz = false,
        CheckLKT = false,
    },
    EKKType = 763,
    NoFrontEKK = true,
}

ENT.NumberRanges = {{37095, 37332}}
--[[
local Texture = {}
for k,v in pairs(Metrostroi.Skins["train"]) do
    if v.typ == "81-760" then Texture[k] = v.name or k end
end
local PassTexture = {}
for k,v in pairs(Metrostroi.Skins["pass"] or {}) do
    if v.typ == "81-760" then PassTexture[k] = v.name or k end
end
local CabTexture = {}
for k,v in pairs(Metrostroi.Skins["cab"] or {}) do
    if v.typ == "81-760" then CabTexture[k] = v.name or k end
end]]
local Schemes = {}
for k, v in pairs(Metrostroi.Skins["760_schemes"] or {}) do
    Schemes[k] = v.name or k
end

local Announcer = {}
for k, v in pairs(Metrostroi.AnnouncementsASNP or {}) do
    Announcer[k] = v.name or k
end

ENT.Spawner = {
    model = {"models/metrostroi_train/81-760/81_760a_body.mdl", "models/metrostroi_train/81-760/81_760a_int.mdl", "models/metrostroi_train/81-760/81_760_cockpit.mdl", "models/metrostroi_train/81-760/81_760_headlamps.mdl",},
    spawnfunc = function(i, tbls, tblt)
        local WagNum = tbls.WagNum
        if i > 1 and i < WagNum then
            if (WagNum > 6 and (i == WagNum - 1 or i == 2)) or (WagNum > 3 and WagNum ~= 5 and i == WagNum - 1) or (WagNum == 5 and i == 3) then
                return "gmod_subway_81-763e"
            else
                return "gmod_subway_81-761e"
            end
        else
            return "gmod_subway_81-760e"
        end
    end,
    --interim = "gmod_subway_81-761a",
    postfunc = function(trains, WagNum)
        local LastRot = false
        local wag1 = trains[1]:GetWagonNumber()
        for i = 1, #trains do
            local ent = trains[i]
            if ent._SpawnerStarted <= 2 then
                timer.Simple(6, function()
                    if not IsValid(ent) then return end
                    ent.BUV.OrientateBUP = wag1
                    ent.BUV.CurrentBUP = wag1
                end)
            end

            if not ent.BUKP then continue end
            ent.BUKP.State = 1
            local wagn = math.min(8, WagNum)
            ent.BUKP.WagNum = wagn
            ent.BUKP.Trains = {}
            local first, last = 1, #trains
            for i1 = 1, wagn do
                local tent = trains[i == 1 and i1 or #trains - i1 + 1]
                ent.BUKP.Trains[i1] = tent:GetWagonNumber()
                ent.BUKP.Trains[tent:GetWagonNumber()] = {}
                ent:SetNW2String("BMCISWagN" .. i1, tent:GetWagonNumber())
            end

            ent:SetNW2Int("CAMSWagNum", wagn)
            ent.CAMS.Inv = ent:GetWagonNumber() > trains[i == 1 and wagn or 1]:GetWagonNumber()
            ent:SetNW2Bool("CAMSInv", ent:GetWagonNumber() > trains[i == 1 and wagn or 1]:GetWagonNumber())
            ent:SetNW2Bool("CAMSLast", trains[wagn]:GetWagonNumber() > 37000)
            ent.ASNP.Path = i ~= 1
        end
    end,
    Metrostroi.Skins.GetTable("Texture", "Spawner.Texture", Texture, "train"),
    -- Metrostroi.Skins.GetTable("PassTexture","Spawner.PassTexture",PassTexture,"pass"),
    -- Metrostroi.Skins.GetTable("CabTexture","Spawner.CabTexture",CabTexture,"cab"),
    {
        "Announcer",
        "Spawner.760.Announcer",
        "List",
        function()
            local Announcer = {}
            for k, v in pairs(Metrostroi.AnnouncementsASNP or {}) do
                if not v.riu then Announcer[k] = v.name or k end
            end
            return Announcer
        end
    },
    {
        "CISConfig",
        "Spawner.760.CISConfig",
        "List",
        function()
            local CISConfig = {}
            for k, v in pairs(Metrostroi.CISConfig or {}) do
                CISConfig[k] = v.name or k
            end
            return CISConfig
        end
    },
    {
        "Scheme",
        "Spawner.760.Schemes",
        "List",
        function()
            local Schemes = {}
            for k, v in pairs(Metrostroi.Skins["760_schemes"] or {}) do
                Schemes[k] = v.name or k
            end
            return Schemes
        end
    },
    { "SarmatBeep", "Звук теста аппаратуры от \"Сармат\"", "Boolean" },
    { "AnnouncerClicks", "Звук клика в оповещениях", "Boolean" },
    { "HornType", "Тифон", "List", { "Стандартный", "Случайный", "Тип 1", "Тип 2", "81-765" }, 5 },
    {
        "VVVFSound",
        "Spawner.720a.VVVFSound",
        "List",
        {
            "Стоковый с 81-760",
            "Spawner.720a.VVVFSound.1", -- ALSTOM ONIX IGBT
            "Spawner.720a.VVVFSound.2", -- ТМХ КАТП-1
            "Spawner.720a.VVVFSound.3", -- ТМХ КАТП-3
            "Spawner.720a.VVVFSound.4", -- Hitachi GTO
            "Spawner.720a.VVVFSound.5", -- Hitachi IGBT
            "Spawner.720a.VVVFSound.6", -- Hitachi VFI-HD1420F
            "КАТП-3 Экспериментальный"
        },
        8,
        nil,
        function(self, spawnerList)
            if self:GetSelectedID() ~= 3 then
                spawnerList.HSEngines:SetValue(false)
                spawnerList.HSEngines:SetDisabled(true)
                spawnerList.HSEngines.Disable = true
            else
                spawnerList.HSEngines:SetDisabled(false)
                spawnerList.HSEngines.Disable = false
            end

            if self:GetSelectedID() ~= 2 then
                spawnerList.FirstONIX:SetValue(false)
                spawnerList.FirstONIX:SetDisabled(true)
                spawnerList.FirstONIX.Disable = true
            else
                spawnerList.FirstONIX:SetDisabled(false)
                spawnerList.FirstONIX.Disable = false
            end
        end
    },
    {"HSEngines", "Spawner.720a.HSEngines", "Boolean"},
    {"FirstONIX", "Spawner.720a.FirstONIX", "Boolean"},
    {
        "SpawnMode",
        "Spawner.Common.SpawnMode",
        "List",
        {"Spawner.Common.SpawnMode.Full", "Spawner.Common.SpawnMode.Deadlock", "Spawner.Common.SpawnMode.NightDeadlock", "Spawner.Common.SpawnMode.Depot"},
        nil,
        function(ent, val, rot, i, wagnum, rclk)
            if rclk then return end
            if ent._SpawnerStarted ~= val then
                if val <= 2 then
                    ent.Electric:TriggerInput("Power", true)
                end
                local first = i == 1 or _LastSpawner ~= CurTime()
                if ent.SF1 then
                    for i = 1, 29 do
                        if ent["SF" .. i] and i ~= 22 then ent["SF" .. i]:TriggerInput("Set", 1) end
                    end

                    ent.SA15:TriggerInput("Set", 1)
                    --ent.Vent2:TriggerInput("Set",val==1 and 1 or 0)
                    ent.HeadlightsSwitch:TriggerInput("Set", val <= 2 and 2 or 0)
                    ent.SA2:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SA3:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SA5:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SA6:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SA9:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.DoorClose:TriggerInput("Set", first and val == 1 and 1 or 0)
                    --ent.PassScheme:TriggerInput("Set",val==1 and 1 or 0)
                    --ent.R_Announcer:TriggerInput("Set",val<=2 and 1 or 0)
                    ent.R_ASNPOn:TriggerInput("Set", 1)
                    --[[
                if val==1 then
                    timer.Simple(1,function()
                        if not IsValid(ent) then return end
                        ent.BUKP.State=2
                    end)
                end]]
                    ent.SA1k:TriggerInput("Set", val == 3 and 0 or 1)
                    ent.SA1k.Value = val == 3 and 0 or 1
                    ent.SA1:TriggerInput("Set", val == 3 and 1 or 0)
                    ent.SF4:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SF5:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SF6:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SF12:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SF13:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SF15:TriggerInput("Set", val <= 2 and 1 or 0)
                    for i = 26, 28 do
                        if ent["SF" .. i] then ent["SF" .. i]:TriggerInput("Open", 1) end
                    end

                    ent.SF27:TriggerInput("Set", val <= 2 and 1 or 0)
                    ent.SF28:TriggerInput("Set", val == 3 and 1 or 0)
                    _LastSpawner = CurTime()
                    ent.CabinDoorLeft = val == 4 and first
                    ent.CabinDoorRight = val == 4 and first
                    ent.PassengerDoor = val == 4
                    ent.RearDoor = val == 4
                else
                    ent.FrontDoor = val == 4
                    ent.RearDoor = val == 4
                end

                ent.BUD.RightDoorState = val == 4 and {1, 1, 1, 1} or {0, 0, 0, 0}
                ent.BUD.DoorRight = val == 4
                ent.BUD.LeftDoorState = val == 4 and {1, 1, 1, 1} or {0, 0, 0, 0}
                ent.BUD.DoorLeft = val == 4
                ent.GV:TriggerInput("Set", val < 4 and 1 or 0)
                if val <= 2 then
                    if ent.SF1 then
                        timer.Simple(first and 2 or 1, function()
                            if not IsValid(ent) then return end
                            ent:SetNW2Int("VityazWagNum", ent.BUKP.WagNum)
                            for i = 1, ent.BUKP.WagNum do
                                ent:CANWrite("BUKP", ent:GetWagonNumber(), "BUV", ent.BUKP.Trains[i], "Orientate", i % 2 > 0)
                            end

                            ent.BUKP.Errors = {}
                            ent.BUKP.InitTimer = CurTime() + 0.0
                            ent.BUKP.Timer2 = CurTime() + 3
                            ent.BUKP.State = 5
                            ent.BUKP.State2 = 11
                            ent.BUKP.Prost = true
                            ent.BUKP.Kos = true
                            ent.BUKP.Ovr = true
                            ent.CAMS.State = -1
                            ent.CAMS.StateTimer = CurTime() + 6
                            ent.VentTimer = -20
                            -- ent.Speedometer.State = 1
                            -- ent.BMCIS.State = 1
                        end)

                        if first then
                            timer.Simple(8, function()
                                if not IsValid(ent) then return end
                                ent.BUKP.InitTimer = CurTime() + 0.5
                                ent.BUKP.Reset = 1
                            end)
                        end
                    end

                    timer.Simple(7, function()
                        if not IsValid(ent) then return end
                        ent.BUV.PassLight = val == 1
                        if ent.AsyncInverter then ent.BUV.PSNSignal = true end
                        if ent.ASNP and val <= 2 and isnumber(ent.ASNP.RouteNumber) and ent.ASNP.RouteNumber > 0 then
                            ent.BUIK.RouteNumber = ent.ASNP.RouteNumber
                        end
                    end)

                    timer.Simple(3, function()
                        if not IsValid(ent) then return end
                        ent.BV:TriggerInput("Set", 1)
                    end)

                    ent.Pneumatic.BrakeLinePressure = 2.25 + math.random() * 0.15
                end

                ent.Pneumatic.TrainLinePressure = val == 3 and 5 + math.random() or val == 2 and 6.6 + math.random() * 1.4 or 7.6 + math.random() * 0.5
                if not ent.SF1 then ent.Pneumatic.TLPressure = ent.Pneumatic.TrainLinePressure end
                ent.Pneumatic.ParkingBrakePressure = val == 3 and 0 or ent.Pneumatic.TrainLinePressure
                ent.Pneumatic.ParkingBrake = val == 3
                ent._SpawnerStarted = val
            end
        end
    },
}