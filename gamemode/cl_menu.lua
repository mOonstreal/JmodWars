local function UpdateMoneyDisplay()
    if not IsValid(moneyPanel) then return end
    
    local money = LocalPlayer():GetNWInt("PlayerMoney", 0)
    moneyPanel:SetTooltip("Обновлено: " .. os.date("%H:%M:%S")) -- Для дебага
    moneyPanel:InvalidateLayout() -- Перерисовка
end


-- Обновляем каждую секунду
timer.Create("UpdateShopMoney", 1, 0, UpdateMoneyDisplay)

-- Удаляем таймер при закрытии меню
frame.OnClose = function()
    timer.Remove("UpdateShopMoney")
end