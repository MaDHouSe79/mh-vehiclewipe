--[[ ====================================================== ]]--
--[[            MH Vehicle Wipe Script by MaDHouSe          ]]--
--[[ ====================================================== ]]--
fx_version 'cerulean'
games {'gta5'}
author 'MaDHouSe79'
description 'MH Automatic Vehicle Wipe, with ignore plates on wipe.'
version '1.0'
shared_scripts {'@qb-core/shared/locale.lua', 'locales/en.lua', 'config.lua'}
client_scripts {'client/main.lua'}
server_script {'@oxmysql/lib/MySQL.lua', 'server/main.lua', 'server/update.lua'}
lua54 'yes'
