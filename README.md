## QBCore Automatic Vehicle Wipe Script by MaDHouSe
- This script will automatically wipe your server every 30min
- if you use qb-parking you can set `Config.UseParking` to `true`
- you can also add plates that will be ignored when the wipe is running.

## NOTE 
- If you are not using qb-parking, your vehicle goes to impound, this is by defauld by `qb-garage`
- It can happen that some vehicle not get wiped, but it wil be the next wipe that is comming.

## Install
- Stop your server.
- Place `qb-vehiclewipe` in `resources/[qb]` folder 
- Start your server.
- is wil run automatically every 30min for now.


## Config
```lua
Config.WaitTimer    = 60000 -- By default 1 minute
Config.WipeTime     = 30    -- By default wipe every 30 minutes.
Config.UseParking   = true  -- By default false, but if you are using qb-parking set this true
Config.IgnorePlates = {     -- Vehicleshop vehicle plates to be ignored for wipe.
    [0] = "BUY ME", 
}
```