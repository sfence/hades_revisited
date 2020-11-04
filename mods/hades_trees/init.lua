local S = minetest.get_translator("hades_trees")
hades_trees = {}

dofile(minetest.get_modpath("hades_trees").."/common.lua")
dofile(minetest.get_modpath("hades_trees").."/olive.lua")
dofile(minetest.get_modpath("hades_trees").."/paletree.lua")
dofile(minetest.get_modpath("hades_trees").."/birch.lua")
dofile(minetest.get_modpath("hades_trees").."/jungle.lua")
dofile(minetest.get_modpath("hades_trees").."/cjtree.lua")
dofile(minetest.get_modpath("hades_trees").."/banana.lua")
dofile(minetest.get_modpath("hades_trees").."/orange.lua")

dofile(minetest.get_modpath("hades_trees").."/wood.lua")
dofile(minetest.get_modpath("hades_trees").."/crafting.lua")
dofile(minetest.get_modpath("hades_trees").."/leafdecay.lua")

dofile(minetest.get_modpath("hades_trees").."/generator.lua")

tt.register_snippet(function(itemstring)
	local l = minetest.get_item_group(itemstring, "ash_fertilizer")
	if l ~= 0 then
		return S("Turns nearby Volcanic Ash to Fertile Sand")
	end
end)
