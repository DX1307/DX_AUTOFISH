fx_version "adamant"
game "gta5"
version "1.0 Beta"
description 'Developed by DX#9190'

client_scripts {
    'config.lua',
	'core/cl.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'core/sv.lua'
}
