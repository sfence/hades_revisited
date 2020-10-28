local S = minetest.get_translator("rebeds")

rebeds = {}
rebeds.player = {}
rebeds.pos = {}
rebeds.spawn = {}

rebeds.formspec = "size[8,15;true]"..
		"bgcolor[#080808BB; true]"..
		"button_exit[2,12;4,0.75;leave;"..minetest.formspec_escape(S("Leave Bed")).."]"

local modpath = minetest.get_modpath("rebeds")

-- load files
dofile(modpath.."/functions.lua")
dofile(modpath.."/api.lua")
dofile(modpath.."/beds.lua")
dofile(modpath.."/spawns.lua")
