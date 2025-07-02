
GM = GM or GAMEMODE

GM.TeamBased = true 

function GM:Initialize()
    print("����� ��������!")
end

TEAM_RED = 1
TEAM_BLUE = 2

team.SetUp(TEAM_RED, "�������", Color(255, 50, 50))
team.SetUp(TEAM_BLUE, "�����", Color(50, 50, 255))

hook.Add("InitPostEntity", "CreateCustomSpawns", function()
    -- ������ ����� ��� ������� 1 (�������)
    local spawn1 = ents.Create("info_player_RedTeam")
    spawn1:SetPos(Vector(1000, 0, 100)) -- ���������� X, Y, Z
    spawn1:SetAngles(Angle(0, 90, 0))   -- ���� ��������
    spawn1:Spawn()
    
    -- ������ ����� ��� ������� 2 (�����)
    local spawn2 = ents.Create("info_player_BlueTeam")
    spawn2:SetPos(Vector(-1000, 0, 100))
    spawn2:SetAngles(Angle(0, -90, 0))
    spawn2:Spawn()
end)