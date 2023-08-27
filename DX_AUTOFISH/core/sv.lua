ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem(Config.Itemuse, function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('DX-AutoFish:USEITEM',source)
	Citizen.Wait(10000)
end)


ESX.RegisterServerCallback('DX-AutoFish:getPlayerInvLimit',function(source, cb, item, amount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local invItem = xPlayer.getInventoryItem(item)
	if (invItem.limit >= amount + invItem.count) or invItem.limit == -1 then 
        cb(true) 
    else 
        cb(false) 
    end
end)

RegisterServerEvent('DX-AutoFish:ADD')
AddEventHandler('DX-AutoFish:ADD', function(ItemName,ItemCount,Percent)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if math.random(1, 100) <= Percent then
		xPlayer.addInventoryItem(ItemName, ItemCount)
		xPlayer.removeInventoryItem(Config.Removeitem, 1)
	end
end)
