fx_version 'cerulean'
games { 'gta5' }

author 'MaDHouSe'
description 'MH - Delete Non active Players'
version '1.0.0'

server_only 'yes'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/main.lua',
    'server/update.lua',
}

dependencies {
    'oxmysql',
    'qb-core',
}

lua54 'yes'
