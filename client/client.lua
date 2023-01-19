local props = {}
local propsUsabled = {}

CreateThread(function()
    while true do
        Wait(5000)
        local allProps = ESX.Game.GetObjects()
        for i=1, #allProps do
            for k, v in pairs(Config.SearchableProps) do
                if GetEntityModel(allProps[i]) == v then
                    table.insert(props, allProps[i])
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)

        for i=1, #props do
            local propPos = GetEntityCoords(props[i])
            local dist = #(pos - propPos)
            if dist < 7.5 and not IsPedInAnyVehicle(PlayerPedId()) and not propsUsabled[props[i]] then
                wait = 0 
                if dist < 1.8 then
                    ESX.ShowHelpNotification(HelpNotificationText)
                    if IsControlJustReleased(0, 38) then
                        local random = math.random(Config.MinReward, Config.MaxReward)
                        local item = Config.Items[math.random(#Config.Items)]
                        exports['mythic_progbar']:Progress({
                            name = 'heavy',
                            duration = 5000,
                            label = '',
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = 'mini@repair',
                                anim = 'fixing_a_ped',
                                flags = 49,
                            },
                            prop = {
                                model = nil,
                            }
                        }, function(status)
                            if not status then
							local luck = math.random(1,8)
								if luck == 4 then
								ESX.ShowNotification(FoundSomethingText)
                                propsUsabled[props[i]] = true
								CreateThread(function()
                                   local prop = props[i]
                                   Wait(Config.RefillPropTime)
                                   propsUsabled[prop] = false
								end)
								TriggerServerEvent('inyomamasass:gimmedatshit', item, random)
								elseif luck == 2 then
								ESX.ShowNotification(Config.FoundSomethingText)
								propsUsabled[props[i]] = true	
								CreateThread(function()
                                   local prop = props[i]
                                   Wait(Config.RefillPropTime)
                                   propsUsabled[prop] = false
								end)
								TriggerServerEvent('inyomamasass:gimmedatshit', item, random)
								else
								propsUsabled[props[i]] = true
								ESX.ShowNotification(Config.NothingFoundText)
								end
                            end
						end)
                    end
                end
            end
        end
        Wait(wait)
    end
end)