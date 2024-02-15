--[[ ====================================================== ]]--
--[[            MH Vehicle Wipe Script by MaDHouSe          ]]--
--[[ ====================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()

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
    local coords = GetEntityCoords(PlayerPedId())
    ClearAreaOfVehicles(coords.x, coords.y, coords.z, 10000.0, false, false, false, false, false)
    QBCore.Functions.Notify(Lang:t('info.clear_message1', {count = count}), "success", 2000)
    QBCore.Functions.Notify(Lang:t('info.clear_message2', {minutes = 30}), "success", 2000)
end)
