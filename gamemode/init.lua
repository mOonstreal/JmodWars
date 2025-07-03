AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("Jmod/jmod_recipes.lua")

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
