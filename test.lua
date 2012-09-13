local capng = require"capng"

-- convert between numeric and text string
local function print_list_convert()
	print("cap", "name2cap", "cap2name")
	print("-------------------------------------------------------------")
	-- capng.CAP_LAST_CAP returns the numeric value of the last capability
	for i = 0, capng.CAP_LAST_CAP, 1 do
		print(i, capng.name_to_capability(capng.capability_to_name(i)), "", capng.capability_to_name(i))
	end
	print("-------------------------------------------------------------")
end

-- print current capabilities
local function print_capabilities()
	print("current capabilities [0 = none | 1 = partial | 2 = full]")
	print("-------------------------------------------------------------")
	print("-> capng.have_capabilities():", capng.have_capabilities(capng.CAPNG_SELECT_CAPS))
	print("-------------------------------------------------------------")
end

-- drop all capabilities
local function drop_all_capabilities()
	print("drop all capabilities")
	print("-------------------------------------------------------------")
	print("-> capng.clear():", capng.clear(capng.CAPNG_SELECT_BOTH))
	print("-> capng.apply():", capng.apply(capng.CAPNG_SELECT_BOTH))
	print("-------------------------------------------------------------")
end

local function keep_one_capability(cap)
	print("keep one capability (" .. capng.capability_to_name(cap) .. ")")
	print("-------------------------------------------------------------")
	print("-> capng.clear():", capng.clear(capng.CAPNG_SELECT_BOTH))
	print("-> capng.update():", capng.update(capng.CAPNG_ADD, capng.CAPNG_EFFECTIVE + capng.CAPNG_PERMITTED, cap))
	print("-> capng.apply():", capng.apply(capng.CAPNG_SELECT_BOTH))
	print("-------------------------------------------------------------")
end

--print("have_capability:", capng.have_capability(capng.CAPNG_EFFECTIVE, 0))
-- print("get_caps_process:", capng.get_caps_process())

print_list_convert()
-- at this point we should have full capabilities when running as root
print_capabilities()
-- only keep CAP_NET_ADMIN
keep_one_capability(capng.CAP_NET_ADMIN)
print_capabilities()
-- now drop all capabilities
drop_all_capabilities()
print_capabilities()


