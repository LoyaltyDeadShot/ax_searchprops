RegisterNetEvent('inyomamasass:gimmedatshit', function(item, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, amount)
end)