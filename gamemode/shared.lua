GM = GM or GAMEMODE

GM.TeamBased = false

function GM:Initialize()
    print("Gamemode initialized!")
end

util.AddNetworkString("BM_UpdateMoney")
util.AddNetworkString("BM_BuyItem")

local PLAYER = FindMetaTable("Player")


util.AddNetworkString("BM_UpdateMoney")

function PLAYER:SetMoney(amount)
    self:SetNWInt("BM_Money", amount)
    net.Start("BM_UpdateMoney")
        net.WriteInt(amount, 32)
    net.Send(self)
end

function PLAYER:GetMoney()
    return self:GetNWInt("BM_Money", 0)
end

function PLAYER:AddMoney(amount)
    self:SetMoney(self:GetMoney() + (tonumber(amount) or 0))
end

hook.Add("PlayerInitialSpawn", "BM_SetupMoney", function(ply)
    ply:SetMoney(6000) -- start Money
    
    print("[Money] Player", ply:Nick(), "spawned with $6000")
end) --debug

-- obrabotka Money
net.Receive("BM_BuyItem", function(len, ply)
    if not IsValid(ply) then return end
    
    local itemClass = net.ReadString()
    local price = net.ReadUInt(32)
    
    if not itemClass or not price then return end
    
    if ply:GetMoney() < price then
        ply:ChatPrint("No money!")
        return
    end
    
    ply:AddMoney(-price)
    ply:Give(itemClass)
    ply:ChatPrint("You buy: " .. itemClass)
    
    print("[Shop]", ply:Nick(), "buy", itemClass, "for", price.."$")
end)

-- comanda vidachi
concommand.Add("bm_givemoney", function(ply, cmd, args)
    if IsValid(ply) then
        local amount = tonumber(args[1]) or 1000
        ply:AddMoney(amount)
        ply:ChatPrint("you add "..amount.."$")
    end
end)