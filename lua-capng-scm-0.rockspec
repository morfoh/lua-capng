#!/usr/bin/env lua

package	= 'lua-capng'
version	= 'scm-0'
source	= {
	url	= 'https://github.com/morfoh/lua-capng'
}
description	= {
	summary	= "Lua bindings for libcap-ng.",
	detailed	= '',
	homepage	= 'https://github.com/morfoh/lua-capng',
	license	= 'MIT',
	maintainer = "Christian Wiese",
}
dependencies = {
	'lua >= 5.1',
}
external_dependencies = {
	CAPNG = {
		header = "cap-ng.h",
		library = "cap-ng",
	}
}
build	= {
	type = "builtin",
	modules = {
		capng = {
			sources = { "src/pre_generated-capng.nobj.c" },
			libraries = { "capng" },
		}
	}
}
