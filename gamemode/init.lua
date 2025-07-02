AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

GM.Name = "��� ������ �����"
GM.Author = "Moonstreal"
GM.Email = ""
GM.Website = ""

DeriveGamemode("base") 
-- ����� �������������
function GM:PlayerSpawn(ply)
    ply:SetHealth(100)
    ply:Give("weapon_crowbar")  -- ������ ������
    ply:SetupHands()

    -- ������������� �� �������� (���� ����� ���������)
    if not ply:Team() or ply:Team() == TEAM_UNASSIGNED then
        ply:SetTeam(math.random(TEAM_RED, TEAM_BLUE))
    end
end

-- �������� ������
function GM:PlayerDeath(victim, inflictor, attacker)
    if victim == attacker then return end
    if attacker:IsPlayer() then
        attacker:AddFrags(1)  -- ���� ���� �� ��������
    end
end

function GM:PlayerSelectSpawn(ply)
    local teamSpawns = {}

    -- �������� ��� �����-������ ��� ������� ������
    if ply:Team() == TEAM_RED then
        teamSpawns = ents.FindByClass("info_player_RedTeam") -- ��� �������
    elseif ply:Team() == TEAM_BLUE then
        teamSpawns = ents.FindByClass("info_player_BlueTeam") -- ��� �����
    else
        teamSpawns = ents.FindByClass("info_player_start") -- ��������� �����
    end

    -- ���� ���� ���������� ������, �������� ���������
    if #teamSpawns > 0 then
        return teamSpawns[math.random(#teamSpawns)]
    end

    -- ���� ������ �� �����, ���������� ����������� �����
    return self.BaseClass:PlayerSelectSpawn(ply)
end