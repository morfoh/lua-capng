#
# Lua bindings for libcapng
#
cmake_minimum_required(VERSION 2.8)

project(lua-capng C)

set(BUILD_SHARED_LIBS TRUE)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

set(INSTALL_CMOD share/lua/cmod CACHE PATH "Directory to install Lua binary modules (configure lua via LUA_CPATH)")

set(COMMON_CFLAGS "${CFLAGS}")
set(COMMON_LDFLAGS)
set(COMMON_LIBS)

## Lua 5.1.x
include(FindLua51)
if(NOT ${LUA51_FOUND})
    message(FATAL_ERROR "The FindLua51 module could not find lua :-(")
endif()
set(COMMON_LIBS "${COMMON_LIBS};${LUA_LIBRARIES}")

## LibCapng
include(FindPkgConfig)
pkg_search_module(CAPNG REQUIRED libcap-ng)
set(COMMON_CFLAGS "${COMMON_CFLAGS} ${CAPNG_CFLAGS}")
set(COMMON_LDFLAGS "${COMMON_LDFLAGS} ${CAPNG_LDFLAGS}")
set(COMMON_LIBS "${COMMON_LIBS};${CAPNG_LIBRARIES}")

## LuaNativeObjects
include(LuaNativeObjects)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}
                    ${CMAKE_CURRENT_BINARY_DIR}
                    ${LUA_INCLUDE_DIR})

## LuaCapng
set(LUA_CAPNG_SRC
	capng.nobj.lua
)

if(${USE_PRE_GENERATED_BINDINGS})
	set(LUA_CAPNG_SRC src/pre_generated-capng.nobj.c)
else()
	# Generate Lua bindings.
	GenLuaNativeObjects(LUA_CAPNG_SRC)
endif()

add_library(lua-capng MODULE ${LUA_CAPNG_SRC})
target_link_libraries(lua-capng ${COMMON_LIBS})
set_target_properties(lua-capng PROPERTIES PREFIX "")
set_target_properties(lua-capng PROPERTIES COMPILE_FLAGS "${COMMON_CFLAGS}")
set_target_properties(lua-capng PROPERTIES OUTPUT_NAME capng)

install(TARGETS lua-capng
        DESTINATION "${INSTALL_CMOD}")

