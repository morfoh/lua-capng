-- Copyright (c) 2012 by Christian Wiese <chris@opensde.org>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

basetype "capng_act_t"		"integer" "0"
basetype "capng_type_t"		"integer" "0"
basetype "capng_select_t"	"integer" "0"
basetype "capng_results_t"	"integer" "0"
basetype "capng_print_t"	"integer" "0"
basetype "capng_flags_t"	"integer" "0"

--
-- functions to manipulate process capabilities
--
c_function "clear" {
	c_call "void" "capng_clear" { "capng_select_t", "set" },
}

c_function "fill" {
	c_call "void" "capng_fill" { "capng_select_t", "set" },
}

c_function "setpid" {
	c_call "void" "capng_setpid" { "int", "pid" },
}

c_function "get_caps_process" {
	c_call "int" "capng_get_caps_process" {},
}

c_function "update" {
	c_call "int" "capng_update" { "capng_act_t", "action", "capng_type_t", "type", "unsigned int", "capability" },
}

-- TODO
--int capng_updatev(capng_act_t action, capng_type_t type,
--                unsigned int capability, ...);

--
-- functions to apply the capabilities previously setup to a process
--
c_function "apply" {
	c_call "int" "capng_apply" { "capng_select_t", "set" },
}

c_function "lock" {
	c_call "int" "capng_lock" {},
}

c_function "change_id" {
	c_call "int" "capng_change_id" { "int", "uid", "int", "gid", "capng_flags_t", "flag" },
}

--
-- These functions are used for file based capabilities
--
c_function "get_caps_fd" {
	c_call "int" "capng_get_caps_fd" { "int", "fd" },
}

c_function "apply_caps_fd" {
	c_call "int" "capng_apply_caps_fd" { "int", "fd" },
}

--
-- functions to check capability bits
--
c_function "have_capabilities" {
	c_call "capng_results_t" "capng_have_capabilities" { "capng_select_t", "set" },
}

c_function "have_capability" {
	c_call "int" "capng_have_capability" { "capng_type_t", "which", "unsigned int", "capability" },
}

--
-- functions to printout capabilities
--
c_function "print_caps_numeric" {
	c_call "char *" "capng_print_caps_numeric" { "capng_print_t", "where", "capng_select_t", "set" },
}

c_function "print_caps_text" {
	c_call "char *" "capng_print_caps_text" { "capng_print_t", "where", "capng_type_t", "which" },
}

--
-- functions to convert between numeric and text string
--
c_function "name_to_capability" {
	c_call "int" "capng_name_to_capability" { "const char *", "name" },
}

c_function "capability_to_name" {
	c_call "const char *" "capng_capability_to_name" { "unsigned int", "capability" },
}

