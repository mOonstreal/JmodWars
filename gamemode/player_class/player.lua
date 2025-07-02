local PLAYER = FindMetaTable("Player")

function PLAYER:SetMoney(amount)
    self:SetNWInt("PlayerMoney", math.max(0, amount))
end

function PLAYER:GetMoney()
    return self:GetNWInt("PlayerMoney", 1000) -- 1000 Ч стартовые деньги
end

function PLAYER:AddMoney(amount)
    self:SetMoney(self:GetMoney() + amount)
end