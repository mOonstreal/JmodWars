include("shared.lua")


function GM:Initialize()
    print("Client worked!")
end
local currentMoney = 0

local MATERIAL_CACHE = {}

local function SafeMaterial(path)
    if type(path) ~= "string" then return Material("error") end
    if not MATERIAL_CACHE[path] then
        MATERIAL_CACHE[path] = Material(path) or Material("error")
    end
    return MATERIAL_CACHE[path]
end


local COLORS = {
    BG = Color(15, 15, 20),
    ACCENT = Color(180, 40, 40),
    TEXT_MAIN = Color(240, 240, 240),
    TEXT_DARK = Color(160, 160, 160)
}

-- shrift
surface.CreateFont("BM_Title", {
    font = "Impact",
    size = 32,
    weight = 500,
    shadow = true
})

surface.CreateFont("BM_ItemName", {
    font = "Verdana",
    size = 18,
    weight = 800
})
-- shrift
surface.CreateFont("BM_Money", {
    font = "Trebuchet MS",
    size = 28,
    weight = 800,
    shadow = true
})

-- Main menu
function OpenBlackMarketMenu()
    local frame = vgui.Create("DFrame")
    frame:SetSize(650, 750)
    frame:SetTitle("")
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame:Center()
    frame:MakePopup()
    

    frame.Paint = function(self, w, h)

    draw.RoundedBox(0, 0, 0, w, h, COLORS.BG)
    surface.SetDrawColor(30, 30, 35, 50)
    surface.DrawRect(0, 0, w, h)
    
    -- Okontovka 
    surface.SetDrawColor(COLORS.ACCENT)
    surface.DrawOutlinedRect(0, 0, w, h, 2)
    
    local title = "Black Market"
    local money = LocalPlayer():GetNWInt("BM_Money", 0)
    
    surface.SetFont("BM_Title")
    local titleW, titleH = surface.GetTextSize(title)
    draw.SimpleText(title, "BM_Title", 20, 15, COLORS.ACCENT)
    
    draw.SimpleText(money.."$", "BM_Money", 30 + titleW, 18, 
        money > 0 and Color(150, 255, 150) or Color(255, 150, 150))
end


    -- button Vkladok
    local closeBtn = vgui.Create("DButton", frame)
    closeBtn:SetText("✕")
    closeBtn:SetFont("DermaLarge")
    closeBtn:SetTextColor(Color(200, 200, 200))
    closeBtn:SetSize(40, 40)
    closeBtn:SetPos(605, 5)
    closeBtn.DoClick = function() frame:Close() end
    closeBtn.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, self:IsHovered() and Color(200, 50, 50) or Color(80, 80, 80))
    end

    -- Vkladki
    local tabs = vgui.Create("DPropertySheet", frame)
    tabs:SetPos(10, 60)
    tabs:SetSize(630, 680)
    tabs.tabScroller:SetOverlap(-1)
    tabs.Paint = function() end


    -- Stili Vkladok
    function SkinTabs(sheet)
        for _, tab in pairs(sheet.Items) do
            if IsValid(tab.Tab) then
                tab.Tab.Paint = function(self, w, h)
                    local active = sheet:GetActiveTab() == tab.Tab
                    draw.RoundedBox(0, 0, 0, w, h, active and COLORS.ACCENT or Color(40, 40, 45))
                    
                    if tab.Tab.Image and type(tab.Tab.Image) == "string" then
                        local mat = SafeMaterial(tab.Tab.Image)
                        if mat then
                            surface.SetMaterial(mat)
                            surface.SetDrawColor(color_white)
                            surface.DrawTexturedRect(w/2-8, h/2-8, 16, 16)
                        end
                    end
                end
            end
        end
    end


    -- Create vkladok
    local propTab = vgui.Create("DPanel")
    propTab.Paint = function() end
    
    local medsTab = vgui.Create("DPanel")
    medsTab.Paint = function() end
    
    local miscTab = vgui.Create("DPanel")
    miscTab.Paint = function() end

    tabs:AddSheet("", propTab, "icon16/house.png")
    tabs:AddSheet("", medsTab, "icon16/heart.png")
    tabs:AddSheet("", miscTab, "icon16/box.png")

    SkinTabs(tabs)

    -- Napolnenie Vkladok
    AddpropTab(propTab)
    AddMedicalTab(medsTab)
    AddMiscTab(miscTab)
end

-- add tovar
function AddItemToTab(parent, name, class, price, modelOrIcon, rarityColor)
    if not IsValid(parent) then return end
    
    local panel = vgui.Create("DPanel", parent)
    panel:SetSize(610, 80)
    panel:DockMargin(0, 0, 0, 5)
    panel:Dock(TOP)
    
    panel.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(30, 30, 35))
        surface.SetDrawColor(rarityColor)
        surface.DrawRect(0, 0, 5, h)
        draw.SimpleText(name, "BM_ItemName", 110, 15, COLORS.TEXT_MAIN)
        draw.SimpleText(price .. "$", "DermaDefault", 110, 40, COLORS.TEXT_DARK)
        
        if self:IsHovered() then
            surface.SetDrawColor(255, 255, 255, 5)
            surface.DrawRect(0, 0, w, h)
        end
    end

    -- otobrashenie Model and iconka
    if type(modelOrIcon) == "string" and modelOrIcon:EndsWith(".mdl") and file.Exists(modelOrIcon, "GAME") then
        local modelPanel = vgui.Create("DModelPanel", panel)
        modelPanel:SetSize(80, 80)
        modelPanel:SetPos(15, 0)
        modelPanel:SetModel(modelOrIcon)
        
        function modelPanel:LayoutEntity(ent)
            if IsValid(ent) then
                ent:SetAngles(Angle(0, CurTime() * 30 % 360, 0))
                self:SetCamPos(Vector(25, 0, 0))
                self:SetLookAt(ent:GetPos() + Vector(0, 0, 5))
            end
        end
    else
        local iconPath = type(modelOrIcon) == "string" and (modelOrIcon:StartWith("icon16/") and modelOrIcon or "icon16/error.png") or "icon16/error.png"
        local icon = vgui.Create("DImage", panel)
        icon:SetSize(64, 64)
        icon:SetPos(20, 8)
        icon:SetImage(iconPath)
    end

    -- button buy
    local btn = vgui.Create("DButton", panel)
    btn:SetText("Buy")
    btn:SetSize(100, 30)
    btn:SetPos(490, 25)
    btn:SetFont("DermaDefaultBold")
    btn:SetTextColor(color_white)
    btn.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, self:IsHovered() and Color(COLORS.ACCENT.r + 20, COLORS.ACCENT.g + 20, COLORS.ACCENT.b + 20) or COLORS.ACCENT)
    end
    btn.DoClick = function()
        if not class or not price then return end
        net.Start("BM_BuyItem")
            net.WriteString(tostring(class))
            net.WriteUInt(tonumber(price) or 0, 32)
        net.SendToServer()
    end
end

-- Napolnenie Vkladok
function AddpropTab(tab)
    local scroll = vgui.Create("DScrollPanel", tab)
    scroll:Dock(FILL)

    AddItemToTab(scroll, "Setka", "models/props_building_details/Storefront_Template001a_Bars.mdl", 2500, "models/props_building_details/Storefront_Template001a_Bars.mdl", Color(200, 60, 60))
    AddItemToTab(scroll, "lock door", "models/props_doors/door03_slotted_left.mdl", 1800, "models/props_doors/door03_slotted_left.mdl", Color(200, 100, 60))
    AddItemToTab(scroll, "barrier", "models/props_c17/concrete_barrier001a.mdl", 1200, "models/props_c17/concrete_barrier001a.mdl", Color(180, 180, 60))
end

function AddMedicalTab(tab)
    local scroll = vgui.Create("DScrollPanel", tab)
    scroll:Dock(FILL)

    AddItemToTab(scroll, "Big Heal", "item_healthkit", 500, "icon16/heart.png", Color(60, 200, 60))
    AddItemToTab(scroll, "Test", "item_adrenaline", 300, "icon16/pill.png", Color(100, 200, 100))
end

function AddMiscTab(tab)
    local scroll = vgui.Create("DScrollPanel", tab)
    scroll:Dock(FILL)

    AddItemToTab(scroll, "Test", "ent_explosive", 3500, "icon16/bomb.png", Color(200, 80, 80))
    AddItemToTab(scroll, "Xyina", "item_container", 800, "icon16/box.png", Color(140, 140, 140))
end

-- Open menu
hook.Add("PlayerButtonDown", "OpenBMenu", function(ply, key)
    if key == KEY_Q then
        OpenBlackMarketMenu()
    end
end)
