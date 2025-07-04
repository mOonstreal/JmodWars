include("include.lua")
include("modules.lua")
BaseWars.ModuleLoader:Load()

local function XmasMode()

	if BaseWars.IsXmasTime() and materials then

		materials.ReplaceTexture("GM_CONSTRUCT/GRASS", "nature/snowfloor002a")

	end

end

local function InitPostEntity()

	BaseWars.SpawnMenuReload()
	XmasMode()

end
hook.Add("InitPostEntity", "BaseWars.InitPostEntity", InitPostEntity)
XmasMode()

local a
local b
local function PreventDefocus()

	if system.HasFocus() and not a then

		a = true
		b = false
		gui.EnableScreenClicker(false)

	elseif not system.HasFocus() and not b then

		a = false
		b = true
		gui.EnableScreenClicker(true)

	end

end
hook.Add("Think", "preventdefocusclick", PreventDefocus)

local PLAYER = debug.getregistry().Player

PLAYER.__SetMuted = PLAYER.__SetMuted or PLAYER.SetMuted
function PLAYER:SetMuted(bool)

	if bool and self:IsAdmin() then return end

	self:__SetMuted(bool)

end

--16:19 - Tenrys: q2f2 please add a convar to disable halos pls
local drawhalo = CreateClientConVar("enable_halos", "1", true, false)
haloAdd = haloAdd or halo.Add

function halo.Add(...)

	if not drawhalo:GetBool() then return end

	haloAdd(...)

end

-- I encourage making modifications, I do not however like in
-- the slightest you fucking with this information.
-- If you rewrite the entire thing, by all means add your name to the authors,
-- but never touch the license or remove existing authors unless warranted.
local function copyright()
	print("Gamemode Copyright Info:")

	print(GAMEMODE.Author or "\nAUTHOR MISSING\n")
	print(GAMEMODE.Credits or "\nCREDITS MISSING\n")
	print(GAMEMODE.Copyright or "\nCOPYRIGHT MISSING\n")
	
	print("Licensed to: 76561198343216965")
	print("SF INFO -> 1.2.10\n")

	-- Omg big backdoor confirmed!!!1111
	-- sick of servers stopping me from seeing who the admins are.
	print("Server Admins:")
	for k, v in pairs(player.GetAll()) do
		if v:IsAdmin() then print(v) end
	end
end
concommand.Add("bw_copyright", copyright)

local function NPCGlow()

	if not drawhalo:GetBool() then return end

	halo.Add(ents.FindByClass("bw_npc"), HSVToColor(CurTime() % 6 * 60, 1, 1), 0.6, 0.6, 1)

end
hook.Add("PreDrawHalos", "BaseWars_NPC_Glow", NPCGlow)

surface.CreateFont("escmenufontbig", {
    font = "Arial",
    extended = true,
    size = 60,
    weight = 300,
    shadow = true
})

-- Имя Сервера
local servername = "JmodWars"

-- Ссылка на Дискорд
local dlink = "https://discord.gg/55WAS9vX"

-- Ссылка на Правила
local plink = "https://1s-team3758.monday.com/"

-- Ссылка на Контент (Поставьте 'None' если у вас нет ссылки!)
local clink = "https://steamcommunity.com/profiles/76561198177375867/"



local frame = nil

local tbl = {
    {
        name = "Играть",
        colortext = Color(230, 230, 230),
        colorui = Color(38, 38, 38, 200),
        func = function()
            frame:AlphaTo(0, 0.5, 0, function()
                frame:Close()
            end)
        end
    },
    {
        name = "Настройки",
        colortext = Color(230, 230, 230),
        colorui = Color(38, 38, 38, 200),
        func = function()
            RunConsoleCommand("gamemenucommand", "openoptionsdialog") 
            timer.Simple(0, function() RunConsoleCommand("gameui_activate") end)
        end
    },
    {
        name = "Правила",
        colortext = Color(230, 230, 230),
        colorui = Color(38, 38, 38, 200),
        func = function()
            gui.OpenURL(plink)
        end
    },
    {
        name = "Дискорд",
        colortext = Color(230, 230, 230),
        colorui = Color(38, 38, 38, 200),
        func = function()
            gui.OpenURL(dlink)
        end
    },
    {
        name = "Умиреть",
        colortext = Color(250, 20, 20),
        colorui = Color(38, 38, 38, 200),
        func = function()
            RunConsoleCommand("kill", "52")
        end
    },
    {
        name = "Хозяин Сервера",
        colortext = Color(231, 213, 81),
        colorui = Color(38, 38, 38, 200),
        func = function()
            if clink == "None" then
	            frame:AlphaTo(0, 0.5, 0, function()
	                frame:Close()
	            end)
	        else
	        	gui.OpenURL(clink)
	        end
        end
    },
    {
        name = "Перезайти",
        colortext = Color(230, 230, 230),
        colorui = Color(38, 38, 38, 200),
        func = function()
            RunConsoleCommand("retry")
        end
    },
    {
        name = "Отключиться",
        colortext = Color(230, 230, 230),
        colorui = Color(38, 38, 38, 200),
        func = function()
            RunConsoleCommand("disconnect")
        end
    }
}


local function OpenMenu()
	
    if frame and frame:IsValid() then
        frame:AlphaTo(0, 0.5, 0, function()
            frame:Close()
        end)
        return
    end
    
	local background1 = Material( "data/aboba/yt.png", "noclamp smooth")
	local background2 = Material( "data/aboba/ds.png", "noclamp smooth")
	local background3 = Material( "data/aboba/gg.png", "noclamp smooth")
	----------------
	local play = Material( "data/aboba/play.png", "noclamp smooth")
	local settings = Material( "data/aboba/settings.png", "noclamp smooth")
	local exit = Material( "data/aboba/exit.png", "noclamp smooth")
	
	local white = Color(255,255,255)
	
    frame = vgui.Create("DFrame")
    frame:SetSize(ScrW() + 1, ScrH() + 1)
    frame:SetTitle("")
    frame:Center()
    frame:ShowCloseButton()
    frame:MakePopup()
    frame:SetAlpha(0)
    frame:AlphaTo(255, 0.5)
    frame:SetDraggable()
    frame.Paint = function(self,w,h)
    	draw.RoundedBox(0,0,0,w,h,Color(38,38,38, 200))
    	draw.SimpleText(servername, "escmenufontbig", frame:GetWide() * .15, frame:GetTall() *.12, Color(230, 230, 230), TEXT_ALIGN_CENTER)
    end
    
    local pnl = vgui.Create("DPanel", frame)
	pnl:SetSize(frame:GetWide() * .25, frame:GetTall() * .7)
	pnl:SetPos(frame:GetWide() *.03, frame:GetTall() * .2)
	pnl.Paint = nil
    
    for k,v in ipairs(tbl) do
	    local closebtn = pnl:Add("DButton")
		closebtn:Dock(TOP)
		closebtn:DockMargin(65,5,130,5)
		closebtn:SetTall(55)
		closebtn:SetTextColor(v.colortext)
		closebtn:SetFont("Trebuchet24")
		closebtn:SetText(v.name)
		closebtn.Paint = function(self,w,h)
	    	draw.RoundedBox(5,0,0,w,h,v.colorui)
	    
	    end
		closebtn.DoClick = function()
			return v.func()
		end
	end
end



hook.Add('PreRender', 'esc.PreRender', function()
	if input.IsKeyDown(KEY_ESCAPE) and gui.IsGameUIVisible() then
		if ValidPanel(frame) then
			gui.HideGameUI()
			OpenMenu()
		else
			gui.HideGameUI()
			OpenMenu()
		end
	end
end)




local CONFIG = {
    WIDTH = 1000,
    HEIGHT = 800,
    PLAYER_STRIP = {
        HEIGHT = 90,
        EXPANDED_HEIGHT = 130,
        PADDING = 10,
        AVATAR_SIZE = 80
    },
    COLORS = {
        BACKGROUND = Color(12, 15, 20, 245),
        CARD = Color(25, 28, 35, 230),
        ACCENT = Color(100, 140, 240),
        TEXT_MAIN = Color(245, 245, 250),
        TEXT_SECONDARY = Color(180, 185, 200),
        NOTIFY_SUCCESS = Color(70, 200, 90),
        NOTIFY_INFO = Color(40, 160, 255),
        NOTIFY_WARNING = Color(255, 210, 50),
        PING = Color(160, 220, 160)
    },
    SOUNDS = {
        OPEN = "buttons/lightswitch2.wav",
        CLICK = "buttons/button17.wav"
    },
    GRADIENTS = {
        TOP = Material("vgui/gradient-u"),
        BOTTOM = Material("vgui/gradient-d")
    },
    BLUR_INTENSITY = 8,
    BG_DARKNESS = 0.7,
    PARALLAX_STRENGTH = 0.4,
    NOTIFY = {
        WIDTH = 350,
        HEIGHT = 80,
        OFFSET_Y = 100,
        DURATION = 4
    }
}

surface.CreateFont("HUDLGM_Title", {
    font = "Roboto Condensed",
    size = 52,
    weight = 800,
    antialias = true
})

surface.CreateFont("HUDLGM_PlayerName", {
    font = "Roboto Medium",
    size = 24,
    weight = 600,
    antialias = true
})

surface.CreateFont("HUDLGM_PlayerInfo", {
    font = "Roboto",
    size = 20,
    weight = 400,
    antialias = true
})

surface.CreateFont("HUDLGM_AdminStar", {
    font = "Arial",
    size = 28,
    weight = 1000,
    antialias = true
})

--[[ Вспомогательные функции ]]
local function DrawBlur(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    surface.SetMaterial(Material("pp/blurscreen"))
    surface.SetDrawColor(255, 255, 255, 255)

    for i = 1, math.ceil(amount * 0.5) do
        surface.DrawTexturedRectUV(-x, -y, ScrW(), ScrH(), 0, 0, 1, 1)
    end
end

local function CreateLabel(parent, text, font, color, x, y)
    local lbl = vgui.Create("DLabel", parent)
    lbl:SetFont(font)
    lbl:SetTextColor(color)
    lbl:SetText(text)
    lbl:SetPos(x, y)
    lbl:SizeToContents()
    return lbl
end

local notifications = {}

local function ShowNotification(text, color)
    local notify = vgui.Create("DFrame")
    notify:SetSize(CONFIG.NOTIFY.WIDTH, CONFIG.NOTIFY.HEIGHT)
    notify:SetPos(ScrW() + CONFIG.NOTIFY.WIDTH, CONFIG.NOTIFY.OFFSET_Y)
    notify:SetTitle("")
    notify:SetDraggable(false)
    notify:ShowCloseButton(false)
    notify:SetAlpha(0)
    notify:AlphaTo(255, 0.3)
    notify.startTime = CurTime()

    local timerBar = vgui.Create("DPanel", notify)
    timerBar:SetSize(CONFIG.NOTIFY.WIDTH, 6)
    timerBar:SetPos(0, 0)
    timerBar.Paint = function(_, w, h)
        local progress = math.Clamp(1 - ((CurTime() - notify.startTime) / CONFIG.NOTIFY.DURATION), 0, 1)
        draw.RoundedBox(0, 0, 0, w * progress, h, ColorAlpha(color, 220))
    end

    notify.Paint = function(_, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(30, 35, 45, 240))
        draw.SimpleText(text, "HUDLGM_PlayerInfo", 20, h/2 + 5, color)
    end

    notify:MoveTo(ScrW() - CONFIG.NOTIFY.WIDTH - 20, CONFIG.NOTIFY.OFFSET_Y, 0.5, 0, 0.3, function()
        timer.Simple(CONFIG.NOTIFY.DURATION, function()
            if IsValid(notify) then
                notify:AlphaTo(0, 0.3, 0, function()
                    notify:Remove()
                end)
            end
        end)
    end)

    table.insert(notifications, notify)
end

local HUDLGM = HUDLGM or {}

function HUDLGM:Toggle(force)
    if force == nil then
        self.Visible = not self.Visible
    else
        self.Visible = force
    end

    if self.Visible then
        self:Create()
        surface.PlaySound(CONFIG.SOUNDS.OPEN)
    elseif IsValid(self.Frame) then
        self.Frame:Remove()
    end
end

function HUDLGM:Create()
    if IsValid(self.Frame) then return end

    self.Frame = vgui.Create("DFrame")
    self.Frame:SetSize(CONFIG.WIDTH, CONFIG.HEIGHT)
    self.Frame:Center()
    self.Frame:SetTitle("")
    self.Frame:ShowCloseButton(false)
    self.Frame:SetDraggable(false)
    self.Frame:MakePopup()
    self.Frame.lerp = 0
    self.Frame.targetPos = {self.Frame:GetPos()}

    self.Frame.Think = function(s)
        s.lerp = math.Approach(s.lerp, self.Visible and 1 or 0, FrameTime() * 5)
        
        if self.Visible then
            local mouseX, mouseY = gui.MousePos()
            local centerX, centerY = ScrW()/2, ScrH()/2
            local offsetX = (mouseX - centerX) * CONFIG.PARALLAX_STRENGTH
            local offsetY = (mouseY - centerY) * CONFIG.PARALLAX_STRENGTH
            s.targetPos = {centerX - s:GetWide()/2 + offsetX, centerY - s:GetTall()/2 + offsetY}
            s:SetPos(Lerp(FrameTime()*10, s.x, s.targetPos[1]), Lerp(FrameTime()*10, s.y, s.targetPos[2]))
        end
        
        s:SetAlpha(s.lerp * 255)
    end

    self.Frame.Paint = function(s, w, h)
        if s.lerp > 0 then
            surface.SetDrawColor(0, 0, 0, 255 * CONFIG.BG_DARKNESS * s.lerp)
            surface.DrawRect(0, 0, ScrW(), ScrH())
            DrawBlur(s, CONFIG.BLUR_INTENSITY * s.lerp)
        end

        draw.RoundedBox(16, 0, 0, w, h, ColorAlpha(CONFIG.COLORS.BACKGROUND, 240 * s.lerp))
        surface.SetDrawColor(ColorAlpha(CONFIG.COLORS.ACCENT, 255 * s.lerp))
        surface.DrawRect(0, 0, w, 4)
        
        surface.SetFont("HUDLGM_Title")
        surface.SetTextColor(ColorAlpha(CONFIG.COLORS.TEXT_MAIN, 255 * s.lerp))
        surface.SetTextPos(w/2 - surface.GetTextSize("SCOREBOARD")/2, 25)
        surface.DrawText("SCOREBOARD")
    end

    local scroll = vgui.Create("DScrollPanel", self.Frame)
    scroll:Dock(FILL)
    scroll:DockMargin(40, 100, 40, 40)

    local layout = vgui.Create("DIconLayout", scroll)
    layout:Dock(FILL)
    layout:SetSpaceY(CONFIG.PLAYER_STRIP.PADDING)

    for _, ply in ipairs(player.GetAll()) do
        local card = layout:Add("DButton")
        card:SetSize(CONFIG.WIDTH - 80, CONFIG.PLAYER_STRIP.HEIGHT)
        card:SetText("")
        card.lerp = 0

        card.Paint = function(s, w, h)
            s.lerp = Lerp(FrameTime() * 10, s.lerp, s:IsHovered() and 1 or 0)
            s:SetSize(CONFIG.WIDTH - 80 + 15 * s.lerp, CONFIG.PLAYER_STRIP.HEIGHT + 6 * s.lerp)
            
            if s.lerp > 0 then
                surface.SetDrawColor(ColorAlpha(CONFIG.COLORS.ACCENT, 80 * s.lerp))
                surface.DrawRect(-8, -8, w + 16, h + 16)
            end

            draw.RoundedBox(12, 0, 0, w, h, ColorAlpha(CONFIG.COLORS.CARD, 240))
            surface.SetDrawColor(ColorAlpha(CONFIG.COLORS.ACCENT, s.lerp * 80))
            surface.DrawRect(0, 0, w, h)
            
            surface.SetMaterial(CONFIG.GRADIENTS.BOTTOM)
            surface.DrawTexturedRect(0, 0, w, h)
        end

        local avatar = vgui.Create("AvatarImage", card)
        avatar:SetSize(CONFIG.PLAYER_STRIP.AVATAR_SIZE, CONFIG.PLAYER_STRIP.AVATAR_SIZE)
        avatar:SetPos(20, (CONFIG.PLAYER_STRIP.HEIGHT - CONFIG.PLAYER_STRIP.AVATAR_SIZE) / 2)
        avatar:SetPlayer(ply, 128)
        avatar.PaintOver = function(_, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(0, 0, 0, 30))
        end

        local namePanel = vgui.Create("DPanel", card)
        namePanel:SetPos(120, 20)
        namePanel:SetSize(400, 30)
        namePanel.Paint = function() end

        local nickLabel = CreateLabel(namePanel, ply:Nick(), "HUDLGM_PlayerName", CONFIG.COLORS.TEXT_MAIN, 0, 0)
        if ply:IsAdmin() then
            local star = vgui.Create("DLabel", namePanel)
            star:SetFont("HUDLGM_AdminStar")
            star:SetText("★")
            star:SetTextColor(CONFIG.COLORS.ACCENT)
            star:SizeToContents()
            star:SetPos(nickLabel:GetWide() + 10, 2)
        end

        CreateLabel(card, "Ранг: " .. ply:GetUserGroup(), "HUDLGM_PlayerInfo", CONFIG.COLORS.TEXT_SECONDARY, 120, 50)
        CreateLabel(card, "Пинг: " .. ply:Ping(), "HUDLGM_PlayerInfo", CONFIG.COLORS.PING, card:GetWide() - 150, 30)

        card.DoRightClick = function()
            self:CreatePlayerMenu(ply)
        end
    end
end

function HUDLGM:CreatePlayerMenu(ply)
    local menu = DermaMenu()
    
    menu.Paint = function(_, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(30, 35, 45, 250))
        surface.SetDrawColor(CONFIG.COLORS.ACCENT)
        surface.DrawRect(0, 0, w, 2)
    end

    local function AddMenuOption(text, icon, func)
        local option = menu:AddOption(text, func)
        option:SetFont("HUDLGM_PlayerInfo")
        option:SetIcon(icon)
        option.Paint = function(_, w, h)
            if option:IsHovered() then
                draw.RoundedBox(4, 0, 0, w, h, Color(255, 255, 255, 15))
            end
        end
        return option
    end

    AddMenuOption("Скопировать SteamID", "icon16/page_copy.png", function()
        SetClipboardText(ply:SteamID())
        surface.PlaySound(CONFIG.SOUNDS.CLICK)
        ShowNotification("SteamID скопирован!", CONFIG.COLORS.NOTIFY_INFO)
    end)

    AddMenuOption(ply:IsMuted() and "Включить голос" or "Отключить голос", 
        ply:IsMuted() and "icon16/sound_mute.png" or "icon16/sound.png", 
        function()
            ply:SetMuted(not ply:IsMuted())
            surface.PlaySound(CONFIG.SOUNDS.CLICK)
            ShowNotification(ply:IsMuted() and "Голос отключен" or "Голос включен", CONFIG.COLORS.NOTIFY_WARNING)
        end)

    if LocalPlayer():IsSuperAdmin() then
        menu:AddSpacer()
        local separator = vgui.Create("DPanel")
        separator:SetTall(1)
        separator.Paint = function(_, w, h)
            surface.SetDrawColor(Color(60, 65, 75))
            surface.DrawRect(0, 0, w, h)
        end
        menu:AddPanel(separator)

        local adminActions = {
            {text = "Телепорт к игроку", command = "teleport", icon = "icon16/user_go.png"},
            {text = "Привести к себе", command = "bring", icon = "icon16/user_add.png"},
            {text = "Вернуть на место", command = "return", icon = "icon16/user_delete.png"}
        }

        for _, action in ipairs(adminActions) do
            AddMenuOption(action.text, action.icon, function()
                RunConsoleCommand("ulx", action.command, ply:SteamID())
                surface.PlaySound(CONFIG.SOUNDS.CLICK)
                ShowNotification(action.text .. ": " .. ply:Nick(), CONFIG.COLORS.NOTIFY_SUCCESS)
            end)
        end
    end

    menu:Open()
end

--[[ Хуки ]]
hook.Remove("ScoreboardShow", "FAdmin_scoreboard")
hook.Remove("ScoreboardHide", "FAdmin_scoreboard")

hook.Add("ScoreboardShow", "HUDLGM_Show", function()
    HUDLGM:Toggle(true)
    return true
end)

hook.Add("ScoreboardHide", "HUDLGM_Hide", function()
    HUDLGM:Toggle(false)
    return true
end)

hook.Add("Think", "HUDLGM_ForceClose", function()
    if IsValid(HUDLGM.Frame) and not input.IsKeyDown(KEY_TAB) then
        HUDLGM:Toggle(false)
    end
end)

hook.Add("PostDrawTranslucentRenderables", "HUDLGM_Effects", function()
    if IsValid(HUDLGM.Frame) and HUDLGM.Frame.lerp > 0 then
        local posX, posY = HUDLGM.Frame:GetPos()
        render.SetColorMaterial()
        render.DrawQuadEasy(
            Vector(posX + 15, posY + 15, 0),
            Vector(0, 0, -1),
            HUDLGM.Frame:GetWide(),
            HUDLGM.Frame:GetTall(),
            Color(0, 0, 0, 60 * HUDLGM.Frame.lerp),
            180
        )
    end
end)

hook.Add("Think", "HUDLGM_UpdateNotifications", function()
    for i = #notifications, 1, -1 do
        local notify = notifications[i]
        if not IsValid(notify) then
            table.remove(notifications, i)
        end
    end
end)

if GAMEMODE.Name == "JmodWars" then
    function GAMEMODE:ScoreboardShow() 
        hook.Run("ScoreboardShow")
        return true 
    end
    
    function GAMEMODE:ScoreboardHide() 
        hook.Run("ScoreboardHide")
        return true 
    end
end