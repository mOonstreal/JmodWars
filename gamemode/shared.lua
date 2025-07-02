
GM = GM or GAMEMODE

GM.TeamBased = true 

function GM:Initialize()
    print("Режим загружен!")
end

TEAM_RED = 1
TEAM_BLUE = 2

team.SetUp(TEAM_RED, "Красные", Color(255, 50, 50))
team.SetUp(TEAM_BLUE, "Синие", Color(50, 50, 255))

hook.Add("InitPostEntity", "CreateCustomSpawns", function()
    -- Создаём спавн для команды 1 (Красные)
    local spawn1 = ents.Create("info_player_RedTeam")
    spawn1:SetPos(Vector(1000, 0, 100)) -- Координаты X, Y, Z
    spawn1:SetAngles(Angle(0, 90, 0))   -- Угол поворота
    spawn1:Spawn()
    
    -- Создаём спавн для команды 2 (Синие)
    local spawn2 = ents.Create("info_player_BlueTeam")
    spawn2:SetPos(Vector(-1000, 0, 100))
    spawn2:SetAngles(Angle(0, -90, 0))
    spawn2:Spawn()
end)