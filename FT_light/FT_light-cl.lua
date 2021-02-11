ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

--------------------------------------------------------------

isMenuOpen = false
function Menu()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		if not isMenuOpen then
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'light_menu', {
					title = _U('menu_title'),
					align = 'top-left',
					elements = {
						{label = _U('default'), value = -1},
						{label = _U('white'), value = 0},
						{label = _U('blue'), value = 1},
						{label = _U('electric_blue'), value = 2},
						{label = _U('mint_green'), value = 3},
						{label = _U('lime_green'), value = 4},
						{label = _U('yellow'), value = 5},
						{label = _U('golden_shower'), value = 6},
						{label = _U('orange'), value = 7},
						{label = _U('red'), value = 8},
						{label = _U('pony_pink'), value = 9},
						{label = _U('hot_pink'), value = 10},
						{label = _U('purple'), value = 11},
						{label = _U('blacklight'), value = 12},
					}
				}, function(data, menu)
						menu.close()
						isMenuOpen = false
						function toggleColor(INT)
							local playerPed = GetPlayerPed(-1)
							local playerVeh = GetVehiclePedIsUsing(playerPed)
							ToggleVehicleMod(playerVeh, 22, true)
							SetVehicleXenonLightsColour(playerVeh, INT) -- INT:https://docs.fivem.net/natives/?_0x3DFF319A831E0CDB
							TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(PlayerId()), 'society_mechanic', _U('billing_notification'), 200)
						end
						if data.current.value == -1 then
							toggleColor(-1)
						end
						if data.current.value == 0 then
							toggleColor(0)
						end
						if data.current.value == 1 then
							toggleColor(1)
						end
						if data.current.value == 2 then
							toggleColor(2)
						end
						if data.current.value == 3 then
							toggleColor(3)
						end
						if data.current.value == 4 then
							toggleColor(4)
						end
						if data.current.value == 5 then
							toggleColor(5)
						end
						if data.current.value == 6 then
							toggleColor(6)
						end
						if data.current.value == 7 then
							toggleColor(7)
						end
						if data.current.value == 8 then
							toggleColor(8)
						end
						if data.current.value == 9 then
							toggleColor(9)
						end
						if data.current.value == 10 then
							toggleColor(10)
						end
						if data.current.value == 11 then
							toggleColor(11)
						end
						if data.current.value == 12 then
							toggleColor(12)
						end
						isMenuOpen = false
					end, function(data, menu)
						menu.close()
						isMenuOpen = false
					end)
				
		end

	else
		TriggerEvent('chat:addMessage', {
			color     = {0, 255, 255},
			multiline = true,
			args      = {_U('who_sends_no_car_notification'), _U('no_car_notification')}
		})
	end
end

RegisterCommand('light', function()
	Menu()
end, false)