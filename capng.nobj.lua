-- make generated variable nicer.
set_variable_format "%s"

c_module "capng" {

-- enable FFI bindings support.
luajit_ffi = true,

-- load CAP-NG shared library.
ffi_load"capng",

sys_include "cap-ng.h",

export_definitions {
-- POSIX-draft defined capabilities
"CAP_CHOWN",
"CAP_DAC_OVERRIDE",
"CAP_DAC_READ_SEARCH",
"CAP_FOWNER",
"CAP_FSETID",
"CAP_KILL",
"CAP_SETGID",
"CAP_SETUID",
-- Linux-specific capabilities
"CAP_SETPCAP",
"CAP_LINUX_IMMUTABLE",
"CAP_NET_BIND_SERVICE",
"CAP_NET_BROADCAST",
"CAP_NET_ADMIN",
"CAP_NET_RAW",
"CAP_IPC_LOCK",
"CAP_IPC_OWNER",
"CAP_SYS_MODULE",
"CAP_SYS_RAWIO",
"CAP_SYS_CHROOT",
"CAP_SYS_PTRACE",
"CAP_SYS_PACCT",
"CAP_SYS_ADMIN",
"CAP_SYS_BOOT",
"CAP_SYS_NICE",
"CAP_SYS_RESOURCE",
"CAP_SYS_TIME",
"CAP_SYS_TTY_CONFIG",
"CAP_MKNOD",
"CAP_LEASE",
"CAP_AUDIT_WRITE",
"CAP_AUDIT_CONTROL",
"CAP_SETFCAP",
"CAP_MAC_OVERRIDE",
"CAP_MAC_ADMIN",
"CAP_SYSLOG",
"CAP_WAKE_ALARM",
"CAP_LAST_CAP",
},

constants {
-- capng_act_t
CAPNG_DROP		= 0,
CAPNG_ADD		= 1,
-- capng_type_t
CAPNG_EFFECTIVE		= 1,
CAPNG_PERMITTED		= 2,
CAPNG_INHERITABLE	= 4,
CAPNG_BOUNDING_SET	= 8,
-- capng_select_t
CAPNG_SELECT_CAPS	= 16,
CAPNG_SELECT_BOUNDS	= 32,
CAPNG_SELECT_BOTH	= 48,
-- capng_results_t
CAPNG_FAIL		= -1,
CAPNG_NONE		= 0,
CAPNG_PARTIAL		= 1,
CAPNG_FULL		= 2,
-- capng_print_t
CAPNG_PRINT_STDOUT	= 0,
CAPNG_PRINT_BUFFER	= 1,
-- capng_flags_t
CAPNG_NO_FLAG		= 0,
CAPNG_DROP_SUPP_GRP	= 1,
CAPNG_CLEAR_BOUNDING	= 2,
},

subfiles {
"src/functions.nobj.lua",
},
}




