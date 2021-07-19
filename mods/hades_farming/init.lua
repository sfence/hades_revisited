-- Global hades_farming namespace
hades_farming = {}
hades_farming.path = minetest.get_modpath("hades_farming")
local S = minetest.get_translator("hades_farming")
local N = function(s) return s end

-- Load files
dofile(hades_farming.path .. "/api.lua")
dofile(hades_farming.path .. "/nodes.lua")
dofile(hades_farming.path .. "/hoes.lua")
dofile(hades_farming.path .. "/register.lua")
