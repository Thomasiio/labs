fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name 'juice-crime'
author 'Thomasio aka Juice'
version '1.0'
description 'reputation based criminal system for ownership of drug labs'

dependencies {

}

server_scripts {
    'server.lua'
}

client_scripts {
    'client.lua'
}

files {
    'client.lua',
    'server.lua',
    'config.lua' 
}