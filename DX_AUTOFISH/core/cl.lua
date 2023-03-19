RegisterFontFile('XenonFont')
fontId = RegisterFontId('XenonFont')

ESX						= nil
local useitem = false
local startfish = false
local removeitem = 0
local getitem = 0
local getitemtime = Config.TimetoAdd

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()

end)


Citizen.CreateThread(function()
	while true do
		Wait(7)
		if useitem then
			if GetEntityCoords(GetPlayerPed(-1)) then
				if startfish == false then
					startfish = true
					getitem = getitemtime
					removeitem = checkcount(Config.Removeitem)
				end
			else
				CancelFishing()
			exports['okokNotify']:Alert("AFK fishing", "ต้องไปที่โซนตกปลา", 5000, 'error')
			end
		end
	end
end)

RegisterNetEvent('KT_pussyfuck:CANCLE')
AddEventHandler('KT_pussyfuck:CANCLE', function()
	CancelFishing()
	exports['okokNotify']:Alert("AFK fishing", "เหยื่อของท่านหมดหรือของท่านเต็ม", 5000, 'error')
	ClearPedTasksImmediately(GetPlayerPed(-1))
	Citizen.CreateThread(function()
		while true do
			Wait(0)
		if IsControlJustReleased(0, 38) then
				break
			end
		end
	end)
end)

RegisterCommand('die', function()
	SetEntityHealth(PlayerPedId(), 0)
end, restricted)

RegisterNetEvent('KT_pussyfuck:USEITEM')
AddEventHandler('KT_pussyfuck:USEITEM', function(confirm)local Zonefish = false
	if GetDistanceBetweenCoords(vector3(Config.Zonefish.x, Config.Zonefish.y, Config.Zonefish.z), GetEntityCoords(PlayerPedId()), true) < Config.range then
		startgame = confirm
		Startfish()
	end
end)

function Startfish()
		if GetEntityCoords(GetPlayerPed(-1)) then
			if checkHasItem(Config.Removeitem) then
				if useitem then 
					CancelFishing()
				else
					useitem = true
					local dict = "anim@heists@box_carry@"
					RequestAnimDict(dict)
					while not HasAnimDictLoaded(dict) do
						Citizen.Wait(100)
					end
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_FISHING", 0, true)
				end
		else
			exports['okokNotify']:Alert("AFK fishing", "ท่านไม่มีเหยื่อตกปลา", 5000, 'error')
		end
	else
		exports['okokNotify']:Alert("AFK fishing", "ต้องไปที่โซนตกปลา", 5000, 'error')
	end
end
--end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if startfish then
			if GetDistanceBetweenCoords(vector3(Config.Zonefish.x, Config.Zonefish.y, Config.Zonefish.z), GetEntityCoords(PlayerPedId()), true) < Config.range then
				DrawText3Ds(Config.Zonefish.x, Config.Zonefish.y, Config.Zonefish.z +1.2, "~g~AFK fishing ~s~time ~b~"..getitem.."~w~ Sec")
				DrawText3Ds(Config.Zonefish.x, Config.Zonefish.y, Config.Zonefish.z +1.0, "Another ~r~fishing bait ~g~ "..removeitem.." ~w~ item")
			end

			if getitem == 0 then
				TriggerServerEvent("KT_pussyfuck:ADD")
				getitem = getitemtime
				removeitem = removeitem - 1
			elseif removeitem == 0 then
                CancelFishing()
			end 
			if IsControlJustPressed(0, 73) then
		exports['okokNotify']:Alert("AFK fishing", "ยกเลิกตกปลา", 5000, 'error')
				CancelFishing()
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		if getitem > 0 then 
			getitem = getitem - 1
		end
	end
end)

checkHasItem = function(item_name)
	local inventory = ESX.GetPlayerData().inventory
	for i=1, #inventory do
	  local item = inventory[i]
	  if item_name == item.name and item.count > 0 then
		return true
	end
  end
  return false
end
checkcount = function(item_name)
	local inventory = ESX.GetPlayerData().inventory
	for i=1, #inventory do
	  local item = inventory[i]
	  	if item_name == item.name then
			return item.count
		end
  	end
end

CancelFishing = function()
	useitem = false
	startfish = false
	removeitem = 0
	getitem = 0
	ClearPedTasksImmediately(GetPlayerPed(-1))
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

CreateThread(function()
    for k, info in pairs(Config.blip) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)