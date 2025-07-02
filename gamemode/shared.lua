
GM = GM or GAMEMODE

GM.TeamBased = false

function GM:Initialize()
    print("bybybyby ok!")
end

-- ��� ������ ������ ������
hook.Add("PlayerInitialSpawn", "SetupPlayerMoney", function(ply)
    ply:SetMoney(3000) -- ��������� ������ (����� ��������� � ��)
end)

-- ��� ������ (�����������: ����� �� ������)
hook.Add("PlayerDeath", "PenaltyOnDeath", function(ply)
    ply:AddMoney(-200) -- ����� ������ 50$
end)

-- �������� � shared.lua
util.AddNetworkString("BM_BuyItem")

-- ������ ��� �����
local PLAYER = FindMetaTable("Player")

function PLAYER:SetMoney(amount)
    self:SetNWInt("BM_Money", math.max(0, amount))
end

function PLAYER:GetMoney()
    return self:GetNWInt("BM_Money", 0)
end

function PLAYER:AddMoney(amount)
    self:SetMoney(self:GetMoney() + amount)
end

-- ��������� �������
net.Receive("BM_BuyItem", function(len, ply)
    if not IsValid(ply) then return end
    
    local itemClass = net.ReadString()
    local price = net.ReadUInt(32)
    
    if ply:GetMoney() < price then
        ply:ChatPrint("No money!")
        return
    end
    
    ply:AddMoney(-price)
    ply:Give(itemClass)
    ply:ChatPrint("You buy: " .. itemClass)
end)
-- �� ������� (��������, � shared.lua)
player.GetAll()[1]:SetNWInt("BM_Money", 1000)