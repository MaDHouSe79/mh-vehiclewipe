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

local function isPlateIgnoredForWipe(p)
    for _, v in ipairs(Config.IgnorePlates) do
        if v == p then return true end
    end
    return false
end

RegisterNetEvent("qb-vehiclewipe:client:wipe", function()
    QBCore.Functions.Notify(Lang:t('info.wipe_message1'), "primary", Config.WaitTimer)
    QBCore.Functions.Notify(Lang:t('info.wipe_message2', {seconds = Config.WaitTimer}), "primary", Config.WaitTimer)
    local count = 0
    local ignore = 0
    Citizen.Wait(Config.WaitTimer)                                                                         --- Time before the cleanup is done 30 000 = 30 seconds
    for vehicle in EnumerateVehicles() do
        local vehicleProps = QBCore.Functions.GetVehicleProperties(vehicle)
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
            if isPlateIgnoredForWipe(vehicleProps.plate) then return end
            Wait(100)
            QBCore.Functions.TriggerCallback("qb-vehiclewipe:server:isVehicleParked", function(parked)
                if parked then return end
                Delete(vehicle)
                count = count + 1
                Wait(300)
            end, vehicleProps.plate)
        end
        Wait(300)
    end
    QBCore.Functions.Notify(Lang:t('info.clear_message1', {count = count}), "success", 2000)
    QBCore.Functions.Notify(Lang:t('info.clear_message2', minutes = Config.WipeTime}), "success", 2000)
end)


