--------------------------------------------------------------------------------
-- Дефиниции для конфигов ИК для 81-765 с обратной совместимостью с ЦИС
--------------------------------------------------------------------------------

-- Иконки для переходов и информации
IK_ICON_MCC = "zxc765/bnt/mcc.png"  -- МЦК
IK_ICON_MCD1 = "zxc765/bnt/mcd1.png"  -- МЦД1
IK_ICON_MCD2 = "zxc765/bnt/mcd2.png"  -- МЦД2
IK_ICON_MCD3 = "zxc765/bnt/mcd3.png"  -- МЦД3
IK_ICON_MCD4 = "zxc765/bnt/mcd4.png"  -- МЦД4
IK_ICON_MCD5 = "zxc765/bnt/mcd5.png"  -- МЦД5
IK_ICON_ZHD = "zxc765/bnt/zhd_platform.png"  -- ЖД-платформа
IK_ICON_PARKING = "zxc765/bnt/parking.png"  -- Перехватывающая парковка
IK_ICON_ACCESS = "zxc765/bnt/access.png"  -- Доступ для инвалидов

-- Типы переходов
IK_CHANGE_TYPE_NORMAL = 1  -- Обычная пересадка между линиями мосметро
IK_CHANGE_TYPE_EXTRA = 2  -- Кастомная иконка в path, с символом в symbol (шрифт Moscow Sans Regular)
IK_CHANGE_TYPE_CUSTOM = 3  -- Кастомная иконка в path, без символа
IK_CHANGE_TYPE_NOCHANGE = 4  -- Кастомная иконка, без символа, отображается на БНТ, не является переходом
IK_CHANGE_TYPE_INFO = 5  -- Кастомная иконка, без символа, на БНТ отображается только в футере


-- Шаблоны
IK_TEMPLATE_PARKING = {
    -- Перехватывающая парковка
    name = "Перехватывающая парковка",
    nameEng = "Free parking",
    icons = {
        {
            typ = IK_CHANGE_TYPE_NOCHANGE,
            color = "#ffffff",
            path = IK_ICON_PARKING,
        }
    }
}
IK_TEMPLATE_ACCESS = {
    -- Доступ для инвалидов (не имеет текста на БНТ, оставляем поля пустыми)
    name = "",
    nameEng = "",
    icons = {
        {
            typ = IK_CHANGE_TYPE_INFO,
            color = "#ffffff",
            path = IK_ICON_ACCESS,
        }
    }
}

if SERVER then
    concommand.Add("metrostroi_bmik", function(ply, _, _, str)
        local train = ply:GetTrain()
        if IsValid(train) and train.FrontIK then
            train.FrontIK:TriggerInput("SetRoute", str)
        end
    end)
end
