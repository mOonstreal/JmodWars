local function UpdateMoneyDisplay()
    if not IsValid(moneyPanel) then return end
    
    local money = LocalPlayer():GetNWInt("PlayerMoney", 0)
    moneyPanel:SetTooltip("���������: " .. os.date("%H:%M:%S")) -- ��� ������
    moneyPanel:InvalidateLayout() -- �����������
end


-- ��������� ������ �������
timer.Create("UpdateShopMoney", 1, 0, UpdateMoneyDisplay)

-- ������� ������ ��� �������� ����
frame.OnClose = function()
    timer.Remove("UpdateShopMoney")
end