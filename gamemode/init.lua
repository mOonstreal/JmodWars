AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

GM.Name = "im true kenkaneki"
GM.Author = "Moonstreal"
GM.Email = ""
GM.Website = ""

DeriveGamemode("base") 

if SERVER then
    AddCSLuaFile("player_class/player.lua") 
end
function GM:PlayerSpawn(ply)
    ply:SetHealth(100)
    ply:Give("weapon_physgun")           
    ply:SetupHands()
end
if SERVER then
    include("player_class/player.lua")
    AddCSLuaFile("player_class/player.lua")
end

util.AddNetworkString("BuyItem")

net.Receive("BuyItem", function(len, ply)
    local itemClass = net.ReadString()
    local price = net.ReadUInt(32)

    if ply:GetMoney() >= price then
        ply:AddMoney(-price)
        ply:Give(itemClass)
        if not ply.GetMoney then
        ErrorNoHalt("[JModWars] GetMoney not found for player " .. ply:Nick())
        return
    end
        ply:ChatPrint("You buy " .. itemClass .. " for " .. price .. "$!")
    else
        ply:ChatPrint("No money, go do it VanieJob!")
    end
end)