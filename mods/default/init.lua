-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.


-- The API documentation in here was moved into doc/lua_api.txt


WATER_ALPHA = 160
WATER_VISC = 1
LAVA_VISC = 7
LIGHT_MAX = minetest.LIGHT_MAX - 1

-- Definitions made by this mod that other mods can use too
default = {}

-- GUI related stuff
default.gui_inventory_bg_img = "background[5,5;1,1;inventory.png;true]"
default.gui_chest_bg_img = "background[5,5;1,1;chestui.png;true]"

function default.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

default.gui_survival_form = "size[8,8.5]"..
			default.gui_inventory_bg_img..
			"list[current_player;main;0,4.25;8,1;]"..
			"list[current_player;main;0,5.5;8,3;8]"..
			"list[current_player;craft;3,0.5;3,3;]"..
			"list[current_player;craftpreview;7,1.5;1,1;]"..
			"image[6,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			default.get_hotbar_bg(0,4.25)

-- Load files
dofile(minetest.get_modpath("default").."/functions.lua")
dofile(minetest.get_modpath("default").."/sounds.lua")
dofile(minetest.get_modpath("default").."/simple_nodes.lua")
dofile(minetest.get_modpath("default").."/tools.lua")
dofile(minetest.get_modpath("default").."/trees.lua")
dofile(minetest.get_modpath("default").."/wood.lua")
dofile(minetest.get_modpath("default").."/plants.lua")
dofile(minetest.get_modpath("default").."/furnaces.lua")
dofile(minetest.get_modpath("default").."/fences.lua")
dofile(minetest.get_modpath("default").."/chests.lua")
dofile(minetest.get_modpath("default").."/torches.lua")
dofile(minetest.get_modpath("default").."/chests.lua")
dofile(minetest.get_modpath("default").."/ladders.lua")
dofile(minetest.get_modpath("default").."/deco.lua")
dofile(minetest.get_modpath("default").."/signs.lua")
dofile(minetest.get_modpath("default").."/craftitems.lua")
dofile(minetest.get_modpath("default").."/crafting.lua")
dofile(minetest.get_modpath("default").."/player.lua")
dofile(minetest.get_modpath("default").."/alias.lua")
dofile(minetest.get_modpath("default").."/mapgen.lua")
