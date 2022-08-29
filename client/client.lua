--[[ ====================================================== ]]--
--[[    QBCore Automatic Vehicle Wipe Script by MaDHouSe    ]]--
--[[ ====================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()

local function Delete(vehicle)
    SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
    SetEntityAsMissionEntity(vehicle, false, false) 
    DeleteVehicle(vehicle)
    if (DoesEntityExist(vehicle)) then 
        DeleteVehicle(vehicle) 
    end
end

local function isPlateIgnoredForWipe(plate)
    local state = false
    for _, v in ipairs(Config.IgnorePlates) do
        if v == plate then state = true end
    end
    return state
end

RegisterNetEvent("mh-vehiclewipe:client:wipe", function()
    QBCore.Functions.Notify(Lang:t('info.wipe_message1'), "primary", 60000)
    QBCore.Functions.Notify(Lang:t('info.wipe_message2', {seconds = 1}), "primary", 60000)
    local count = 0
    local ignore = 0
    Citizen.Wait(60000)                                                                         --- Time before the cleanup is done 30 000 = 30 seconds
    for vehicle in EnumerateVehicles() do
        local vehicleProps = QBCore.Functions.GetVehicleProperties(vehicle)
        Wait(10)
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
            QBCore.Functions.TriggerCallback("mh-vehiclewipe:server:isVehicleParked", function(parked)
                if parked then return end
                local ignorePlate = isPlateIgnoredForWipe(vehicleProps.plate) 
                if ignorePlate then return end
                Delete(vehicle)
                count = count + 1
                Wait(300)
            end, vehicleProps.plate)
        end
        Wait(300)
    end
    QBCore.Functions.Notify(Lang:t('info.clear_message1', {count = count}), "success", 2000)
    QBCore.Functions.Notify(Lang:t('info.clear_message2', {minutes = 30}), "success", 2000)
end)
