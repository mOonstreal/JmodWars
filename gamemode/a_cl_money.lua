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
        ply:ChatPrint("Вы купили " .. itemClass .. " за " .. price .. "$!")
    else
        ply:ChatPrint("Недостаточно денег!")
    end
end)