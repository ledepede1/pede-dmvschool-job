fx_version 'adamant'

game 'gta5'

author 'ledepede1'
description 'Pede Kørelærer'

--[[
Pede DriveSchool Job needs following dependencies:
ox_lib
ox_mysql
esx_license
esx_society
]]--

version '1.0'

lua54 'yes'

shared_scripts {
  '@ox_lib/init.lua',
}

-- Comment out ESX out if using QBCORE
shared_script {'@es_extended/imports.lua'}


client_scripts {
  'Configs/Config.lua',
  'Client/Main.lua',
  'Client/Targets.lua',
  'Client/Menu.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'Configs/Config.lua',
  'Server/Server.lua',
}

dependencies {
	'es_extended',
}