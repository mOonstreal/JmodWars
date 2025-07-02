AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

GM.Name = "Мой Крутой Режим"
GM.Author = "Moonstreal"
GM.Email = ""
GM.Website = ""

DeriveGamemode("base") 
-- Игрок присоединился
function GM:PlayerSpawn(ply)
    ply:SetHealth(100)
    ply:Give("weapon_crowbar")  -- Выдаем оружие
    ply:SetupHands()

    -- Распределение по командам (если режим командный)
    if not ply:Team() or ply:Team() == TEAM_UNASSIGNED then
        ply:SetTeam(math.random(TEAM_RED, TEAM_BLUE))
    end
end

-- Убийство игрока
function GM:PlayerDeath(victim, inflictor, attacker)
    if victim == attacker then return end
    if attacker:IsPlayer() then
        attacker:AddFrags(1)  -- Даем очки за убийство
    end
end

function GM:PlayerSelectSpawn(ply)
    local teamSpawns = {}

    -- Собираем все спавн-поинты для команды игрока
    if ply:Team() == TEAM_RED then
        teamSpawns = ents.FindByClass("info_player_RedTeam") -- Для красных
    elseif ply:Team() == TEAM_BLUE then
        teamSpawns = ents.FindByClass("info_player_BlueTeam") -- Для синих
    else
        teamSpawns = ents.FindByClass("info_player_start") -- Дефолтный спавн
    end

    -- Если есть подходящие спавны, выбираем случайный
    if #teamSpawns > 0 then
        return teamSpawns[math.random(#teamSpawns)]
    end

    -- Если ничего не нашли, возвращаем стандартный спавн
    return self.BaseClass:PlayerSelectSpawn(ply)
end