--[[ ====================================================== ]]--
--[[            MH Vehicle Wipe Script by MaDHouSe          ]]--
--[[ ====================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()
local ignoredPlates = {}

local function Trim(value)
    if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

local function AddPlate(plate)
    if not ignoredPlates[plate] then 
        ignoredPlates[plate] = {}
        ignoredPlates[plate].plate = plate 
    end
end

local function RemovePlate(plate)
    for k, v in ipairs(ignoredPlates) do
        if v.plate == plate then 
            v.plate = nil
            k = nil
        end
    end
end

local function CheckPlate(plate)
    if ignoredPlates[plate] then return true end
    return false
end

local function Wipe()
    TriggerClientEvent("mh-vehiclewipe:client:wipe", -1)
    SetTimeout(Config.WipeTime * (60 * 1000), Wipe)
end

QBCore.Commands.Add("wipeall", "Wipe vehicles", {}, false, function(source)
    Wipe()
end, "admin")

-- if you use mh-parking you can use this to ignore parked vehicles.
QBCore.Functions.CreateCallback("mh-vehiclewipe:server:isVehicleParked", function(source, cb, plate)
    if Config.UseParking then
        local result = MySQL.scalar.await('SELECT * FROM player_parking WHERE plate = ?', {plate})
        if result ~= nil then cb(true) else cb(false) end
    else
        cb(false) 
    end
end)

QBCore.Functions.CreateCallback("mh-vehiclewipe:server:isVehicleIgnored", function(source, cb, plate)
    if CheckPlate(plate) then cb(true) else cb(false) end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        ignoredPlates = {}
        for i = 1, #Config.IgnorePlates, 1 do
            AddPlate(Trim(Config.IgnorePlates[i]))
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        ignoredPlates = {}
    end
end)

RegisterNetEvent("mh-vehiclewipe:server:onjoin", function()
    Wipe()
end)

RegisterNetEvent("mh-vehiclewipe:server:addplate", function(plate)
    AddPlate(Trim(plate))
end)

RegisterNetEvent("mh-vehiclewipe:server:removeplate", function(plate)
    RemovePlate(Trim(plate))
end)
