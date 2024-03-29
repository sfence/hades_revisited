local S = minetest.get_translator("hades_fences")

hades_fences = {}
function hades_fences.register_fence(name, def)
	if def.material then
		minetest.register_craft({
			output = name .. " 4",
			recipe = {
				{ def.material, 'group:stick', def.material },
				{ def.material, 'group:stick', def.material },
			}
		})
	end

	local fence_texture = "default_fence_overlay.png^" .. def.texture ..
			"^default_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		collision_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			connect_front = {{-1/8,-1/2,-1/2,1/8,1/2,-1/8}},
			connect_left = {{-1/2,-1/2,-1/8,-1/8,1/2,1/8}},
			connect_back = {{-1/8,-1/2,1/8,1/8,1/2,1/2}},
			connect_right = {{1/8,-1/2,-1/8,1/2,1/2,1/8}},
		},
		connects_to = {"group:fence_wood", "group:wood", "group:tree", "group:bark"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {},
		on_rotate = "simple",
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1
	-- Always connect to fence gates and walls regardless of type
	table.insert(def.connects_to, "group:fence_gate")
	table.insert(def.connects_to, "group:wall")

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end

local groups_colwood = {choppy=2, oddly_breakable_by_hand=2, flammable=2, fence_wood=1, fence_colwood=1}

local fences = {
	{ "rusty", S("Rusty Fence"), "hades_core_rusty.png", {cracky=3, fence_metal=1}, {"group:fence_metal", "columnia:rusty_block"}, hades_sounds.node_sound_metal_defaults() },
	{ "wood", S("Temperate Wood Fence"), "default_wood.png" },
	{ "pale_wood", S("Pale Wood Fence"), "hades_trees_pale_wood.png" },
	{ "jungle_wood", S("Tropical Wood Fence"), "default_junglewood.png" },
	{ "cream_wood", S("Cream Wood Fence"), "hades_trees_cream_wood.png" },
	{ "lush_wood", S("Lush Wood Fence"), "hades_trees_lush_wood.png" },

	{ "wood_uncolored", S("Uncolored Canvas Wood Fence"), "hades_trees_colwood_uncolored.png", groups_colwood },
	{ "wood_black", S("Black Canvas Wood Fence"), "hades_trees_colwood_black.png", groups_colwood },
	{ "wood_blue", S("Blue Canvas Wood Fence"), "hades_trees_colwood_blue.png", groups_colwood },
	{ "wood_cyan", S("Cyan Canvas Wood Fence"), "hades_trees_colwood_cyan.png", groups_colwood },
	{ "wood_magenta", S("Magenta Canvas Wood Fence"), "hades_trees_colwood_magenta.png", groups_colwood },
	{ "wood_violet", S("Violet Canvas Wood Fence"), "hades_trees_colwood_violet.png", groups_colwood },
	{ "wood_red", S("Red Canvas Wood Fence"), "hades_trees_colwood_red.png", groups_colwood },
	{ "wood_pink", S("Pink Canvas Wood Fence"), "hades_trees_colwood_pink.png", groups_colwood },
	{ "wood_orange", S("Orange Canvas Wood Fence"), "hades_trees_colwood_orange.png", groups_colwood },
	{ "wood_brown", S("Brown Canvas Wood Fence"), "hades_trees_colwood_brown.png", groups_colwood },
	{ "wood_yellow", S("Yellow Canvas Wood Fence"), "hades_trees_colwood_yellow.png", groups_colwood },
	{ "wood_green", S("Green Canvas Wood Fence"), "hades_trees_colwood_green.png", groups_colwood },
	{ "wood_dark_green", S("Dark Green Canvas Wood Fence"), "hades_trees_colwood_dark_green.png", groups_colwood },
	{ "wood_white", S("White Canvas Wood Fence"), "hades_trees_colwood_white.png", groups_colwood },
	{ "wood_grey", S("Grey Canvas Wood Fence"), "hades_trees_colwood_grey.png", groups_colwood },
	{ "wood_dark_grey", S("Dark Grey Canvas Wood Fence"), "hades_trees_colwood_dark_grey.png", groups_colwood },
}

for i=1, #fences do
	local groups = {choppy=2, oddly_breakable_by_hand=2, flammable=2, fence_wood=1}
	local sounds = hades_sounds.node_sound_wood_defaults()
	if fences[i][4] then
		groups = fences[i][4]
	end
	local connects_to = fences[i][5]
	if fences[i][6] then
		sounds = fences[i][6]
	end
	hades_fences.register_fence("hades_fences:fence_"..fences[i][1], {
		description = fences[i][2],
		texture = fences[i][3],
		groups = groups,
		sounds = sounds,
		connects_to = connects_to,
	})
end

dofile(minetest.get_modpath("hades_fences").."/crafting.lua")
