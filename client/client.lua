--[[ ====================================================== ]]--
--[[            MH Vehicle Wipe Script by MaDHouSe          ]]--
--[[ ====================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()

local function Delete(vehicle)
    SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
    SetEntityAsMissionEntity(vehicle, false, false) 
    DeleteVehicle(vehicle)
    if (DoesEntityExist(vehicle)) then DeleteVehicle(vehicle) end
end

RegisterNetEvent("mh-vehiclewipe:client:wipe", function()
    QBCore.Functions.Notify(Lang:t('info.wipe_message1'), "primary", Config.WaitTimer)
    QBCore.Functions.Notify(Lang:t('info.wipe_message2', {seconds = 1}), "primary", Config.WaitTimer)
    local count = 0
    Citizen.Wait(Config.WaitTimer) --- Time before the cleanup is done 30 000 = 30 seconds
    for vehicle in EnumerateVehicles() do
        local vehicleProps = QBCore.Functions.GetVehicleProperties(vehicle)
        Wait(10)
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
            QBCore.Functions.TriggerCallback("mh-vehiclewipe:server:isVehicleParked", function(parked)
                if parked then return end
                QBCore.Functions.TriggerCallback("mh-vehiclewipe:server:isVehicleIgnored", function(ignore)
                    if ignore then return end
                    Delete(vehicle)
                    count = count + 1
                    Wait(300)
                end, vehicleProps.plate)
            end, vehicleProps.plate)
        end
        Wait(300)
    end
    QBCore.Functions.Notify(Lang:t('info.clear_message1', {count = count}), "success", 2000)
    QBCore.Functions.Notify(Lang:t('info.clear_message2', {minutes = 30}), "success", 2000)
end)
