--[[ ====================================================== ]]--
--[[            MH Vehicle Wipe Script by MaDHouSe          ]]--
--[[ ====================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()

local function Delete(vehicle)
    SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
    SetEntityAsMissionEntity(vehicle, true, true) 
    if (DoesEntityExist(vehicle)) then DeleteVehicle(vehicle) end
end

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent('mh-vehiclewipe:server:onjoin')
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        TriggerServerEvent('mh-vehiclewipe:server:onjoin')
    end
end)

RegisterNetEvent("mh-vehiclewipe:client:wipe", function()
    QBCore.Functions.Notify(Lang:t('info.wipe_message1'), "primary", Config.WaitTimer)
    QBCore.Functions.Notify(Lang:t('info.wipe_message2', {seconds = 1}), "primary", Config.WaitTimer)
    local count = 0
    Citizen.Wait(Config.WaitTimer) --- Time before the cleanup is done 30 000 = 30 seconds`
    local vehicles = GetGamePool('CVehicle')
    for _, vehicle in pairs(vehicles) do
        if DoesEntityExist(vehicle) then
            local plate = QBCore.Functions.GetPlate(vehicle)
            QBCore.Functions.TriggerCallback("mh-vehiclewipe:server:isVehicleParked", function(parked)
                if parked then return end
                QBCore.Functions.TriggerCallback("mh-vehiclewipe:server:isVehicleIgnored", function(ignore)
                    if ignore then return end
                    Delete(vehicle)
                    count = count + 1
                end, plate)
            end, plate)
            Wait(10)
        end
    end
    QBCore.Functions.Notify(Lang:t('info.clear_message1', {count = count}), "success", 2000)
    QBCore.Functions.Notify(Lang:t('info.clear_message2', {minutes = 30}), "success", 2000)
end)
