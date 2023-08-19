fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'um-all-commands'
author 'uyuyorum {um}'
version '1.0.0'
license 'GPL-3.0 license'
repository 'https://github.com/alp1x/um-all-commands'
description 'A simple tool to manage all commands'

ui_page 'web/build/index.html'
client_script 'lua/sendnui.lua'
server_script 'lua/getallcommands.lua'

files {
	'web/build/index.html',
	'web/build/assets/*.js',
	'web/build/assets/*.css',
}