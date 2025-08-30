<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
  <a href="https://github.com/MaDHouSe79/mh-vehiclewipe/issues">
    <img src="https://img.shields.io/github/issues/MaDHouSe79/mh-vehiclewipe"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-vehiclewipe/watchers">
    <img src="https://img.shields.io/github/watchers/MaDHouSe79/mh-vehiclewipe"/> 
  </a> 
  <a href="https://github.com/MaDHouSe79/mh-vehiclewipe/network/members">
    <img src="https://img.shields.io/github/forks/MaDHouSe79/mh-vehiclewipe"/> 
  </a>  
  <a href="https://github.com/MaDHouSe79/mh-vehiclewipe/stargazers">
    <img src="https://img.shields.io/github/stars/MaDHouSe79/mh-vehiclewipe?color=white"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-vehiclewipe/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/MaDHouSe79/mh-vehiclewipe?color=black"/> 
  </a>      
</p>

## Youtube
- [Youtube](https://www.youtube.com/@MaDHouSe79)

## MH Automatic Vehicle Wipe Script by MaDHouSe
- This script will automatically wipe your server every 30min
- if you use qb-parking you can set `Config.UseParking` to `true`
- you can also add plates that will be ignored when the wipe is running.

## NOTE 
- If you are not using mh-parking, your vehicle goes to impound, this is by defauld by `qb-garage`
- It can happen that some vehicle not get wiped, but it wil be the next wipe that is comming.

## Install
- Stop your server.
- Place `mh-vehiclewipe` in `resources/[mh]` folder 
- Start your server.
- is wil run automatically every 30min for now.

## Triggers, to add and remove a plates
```lua
-- client side triggers
TriggerServerEvent('mh-vehiclewipe:server:addplate', plate)
TriggerServerEvent('mh-vehiclewipe:server:removeplate', plate)
```

```lua
-- server side triggers
TriggerEvent('mh-vehiclewipe:server:addplate', plate)
TriggerEvent('mh-vehiclewipe:server:removeplate', plate)
```

## Admin Command
- typ `/wipeall` to start a server wipe.

## Config
```lua
Config.WaitTimer    = 60000 -- By default 1 minute
Config.WipeTime     = 30    -- By default wipe every 30 minutes.
Config.UseParking   = true  -- By default false, but if you are using qb-parking set this true
Config.IgnorePlates = {     -- Vehicleshop vehicle plates to be ignored for wipe.
    "BUY-ME", 
    "BUY ME", 
    "TESTDRIVE",
}
```

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)
