hook.Add("HUDPaint", "DrawPlayerMoney", function()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end

    -- Получаем деньги через NWVar
    local money = ply:GetNWInt("PlayerMoney", 0)

    -- Рисуем текст на экране
    draw.SimpleText(
        "Деньги: " .. money .. "$",
        "DermaDefault", -- Шрифт (можно заменить на свой)
        ScrW() - 200, -- Позиция X (правый край экрана)
        50,           -- Позиция Y
        Color(255, 255, 255), -- Белый цвет
        TEXT_ALIGN_RIGHT -- Выравнивание по правому краю
    )
end)