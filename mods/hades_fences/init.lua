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
		connects_to = {"group:fence_wood", "group:wood", "group:tree"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {},
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1
	-- Always connect to fence gates regardless of type
	table.insert(def.connects_to, "group:fence_gate")

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end

local fences = {
	{ "rusty", "Rusty Fence", "default_rusty.png", {cracky=3, fence_metal=1}, {"group:fence_metal"}, hades_sounds.node_sound_metal_defaults() },
	{ "wood", "Common Wood Fence", "default_wood.png" },
	{ "pale_wood", "Pale Wood Fence", "hades_trees_pale_wood.png" },
	{ "birch_wood", "Birch Wood Fence", "default_birchwood.png" },
	{ "jungle_wood", "Jungle Wood Fence", "default_junglewood.png" },
	{ "wood_black", "Black Wood Fence", "default_colwood_black.png" },
	{ "wood_blue", "Blue Wood Fence", "default_colwood_blue.png" },
	{ "wood_cyan", "Cyan Wood Fence", "default_colwood_cyan.png" },
	{ "wood_magenta", "Magenta Wood Fence", "default_colwood_magenta.png" },
	{ "wood_violet", "Violet Wood Fence", "default_colwood_violet.png" },
	{ "wood_red", "Red Wood Fence", "default_colwood_red.png" },
	{ "wood_pink", "Pink Wood Fence", "default_colwood_pink.png" },
	{ "wood_orange", "Orange Wood Fence", "default_colwood_orange.png" },
	{ "wood_brown", "Brown Wood Fence", "default_colwood_brown.png" },
	{ "wood_yellow", "Yellow Wood Fence", "default_colwood_yellow.png" },
	{ "wood_green", "Green Wood Fence", "default_colwood_green.png" },
	{ "wood_dark_green", "Dark Green Wood Fence", "default_colwood_dark_green.png" },
	{ "wood_white", "White Wood Fence", "default_colwood_white.png" },
	{ "wood_grey", "Grey Wood Fence", "default_colwood_grey.png" },
	{ "wood_dark_grey", "Dark Grey Wood Fence", "default_colwood_dark_grey.png" },
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
