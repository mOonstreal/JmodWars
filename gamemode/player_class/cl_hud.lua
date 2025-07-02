hook.Add("HUDPaint", "DrawPlayerMoney", function()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end

    
    local money = ply:GetNWInt("PlayerMoney", 0)

   
    draw.SimpleText(
        "Δενόγθ: " .. money .. "$",
        "DermaDefault", 
        ScrW() - 200,
        50,           
        Color(255, 255, 255), 
        TEXT_ALIGN_RIGHT 
    )
end)