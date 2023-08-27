fx_version "adamant"
game "gta5"
version "1.2 AddSystem"

name "DX_AUTOFISH"
author  "DX Development"
repository "https://github.com/DX1307/DX_AUTOFISH.git"
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
