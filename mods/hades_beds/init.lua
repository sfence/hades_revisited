local S = minetest.get_translator("hades_beds")

hades_beds = {}
hades_beds.player = {}
hades_beds.pos = {}
hades_beds.spawn = {}

local modpath = minetest.get_modpath("hades_beds")

-- load files
dofile(modpath.."/functions.lua")
dofile(modpath.."/api.lua")
dofile(modpath.."/beds.lua")
dofile(modpath.."/spawns.lua")
