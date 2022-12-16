fx_version 'cerulean'
games { 'gta5' }

author 'MaDHouSe'
description 'MH - Delete Non active Players'
version '2.0'

shared_scripts {
    'config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

dependencies {
    'oxmysql',
    'qb-core',
}

lua54 'yes'
