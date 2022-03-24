fx_version 'cerulean'
games { 'gta5' }

author 'MaDHouSe'
description 'QB Automatic Vehicle Wipe, with ignore plates on wipe.'
version '1.0'


shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- change en to your language
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/server.lua'
}
client_scripts {
    'config.lua',
    'client/client.lua',
    'client/entityiter.lua'
}

