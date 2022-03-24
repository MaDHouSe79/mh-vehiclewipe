--[[ ====================================================== ]]--
--[[    QBCore Automatic Vehicle Wipe Script by MaDHouSe    ]]--
--[[ ====================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()

-- if you use qb-parking you can use this to ignore parked vehicles
QBCore.Functions.CreateCallback("qb-vehiclewipe:server:isVehicleParked", function(source, cb, plate)
    if Config.UseParking then
        MySQL.Async.fetchAll("SELECT * FROM player_parking WHERE plate = @plate", {
            ['@plate'] = plate
        }, function(rs)
            if type(rs) == 'table' and #rs > 0 then
                cb(true)
            else
                cb(false)
            end
        end)
    else
        cb(false)
    end
end)

function Wipe()
    TriggerClientEvent("qb-vehiclewipe:client:wipe", -1)
    SetTimeout(Config.WipeTime * (60 * 1000), Wipe)
end

-- dont remove this below, or the Auto wipe will not work.
Wipe()