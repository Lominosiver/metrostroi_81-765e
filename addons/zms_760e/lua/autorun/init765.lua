timer.Simple(0, function()
    local models = {
        ["models/metrostroi_train/81-760e/81_760e_body.mdl"] = true,
        ["models/metrostroi_train/81-760e/81_761e_body.mdl"] = true,
    }

    if CLIENT then
        local paths = {"models/metrostroi_train/81-765/", "models/metrostroi_train/81-760e/"}
        for _, path in ipairs(paths) do
            local files = file.Find(path .. "*.mdl", "GAME")
            for _, filename in pairs(files) do
                if not models[path .. filename] then models[path .. filename] = true end
            end
        end
    end

    for k, v in pairs(models) do
        if v then util.PrecacheModel(k) end
    end
end)
