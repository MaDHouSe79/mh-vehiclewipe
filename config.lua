--[[ ====================================================== ]]--
--[[    QBCore Automatic Vehicle Wipe Script by MaDHouSe    ]]--
--[[ ====================================================== ]]--

Config              = {}
Config.WaitTimer    = 60000 -- By default 1 minute
Config.WipeTime     = 30    -- By default wipe every 30 minutes.
Config.UseParking   = true  -- By default false, but if you are using qb-parking set this true
Config.IgnorePlates = {     -- Vehicleshop vehicle plates to be ignored for wipe.
    [0] = "BUY-ME", 
    [1] = "BUY ME", 
    [2] = "TESTDRIVE",
}
