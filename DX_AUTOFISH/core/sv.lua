ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem(Config.Itemuse, function(source) --ชุป
	local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('KT_pussyfuck:USEITEM',source)
	Citizen.Wait(10000)
end)

RegisterServerEvent('KT_pussyfuck:ADD')
AddEventHandler('KT_pussyfuck:ADD', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xItem = xPlayer.getInventoryItem(Config.Additem)
	local xZItem = xPlayer.getInventoryItem(Config.Removeitem)
	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit and xZItem.count <= 0 then 
		TriggerClientEvent('KT_pussyfuck:CANCLE',source)
	else
		xPlayer.addInventoryItem(Config.Additem, 5)
		xPlayer.removeInventoryItem(Config.Removeitem, 1)
	end

	for k,v in pairs(Config.droprate) do
		if math.random(1, 100) <= v.Percent then
			local xItemCount = math.random(v.ItemCount[1], v.ItemCount[2])
			xPlayer.addInventoryItem(v.ItemName, xItemCount)
		end
	end
end)