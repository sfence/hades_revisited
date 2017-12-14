local BEDROCK_LAYER = -30912 -- determined as appropriate by experiment

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "bedrock:bedrock",
	wherein        = "default:stone",
	clust_scarcity = 1 * 1 * 1,
	clust_num_ores = 5,
	clust_size     = 2,
	y_min     = BEDROCK_LAYER, -- Engine changes can modify this value.
	y_max     = -30656, -- This ensures the bottom of the world is not even loaded.
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "bedrock:deepstone",
	wherein        = "default:stone",
	clust_scarcity = 1 * 1 * 1,
	clust_num_ores = 5,
	clust_size     = 2,
	y_min     = -30656,
	y_max     = -30000,
})

minetest.register_node("bedrock:bedrock", {
	description = "Bedrock",
	tiles = {"bedrock_bedrock.png"},
	groups = {unbreakable = 1, not_in_creative_inventory = 1}, -- For Map Tools' admin pickaxe.
	sounds = default.node_sound_stone_defaults(),
	is_ground_content = false,
	on_blast = function() end,
	on_destruct = function () end,
	can_dig = function() return false end,
	diggable = false,
	drop = "",
})

minetest.register_node("bedrock:deepstone", {
	description = "Deepstone",
	tiles = {"bedrock_deepstone.png"},
	drop = "default:stone", -- Intended.
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})

-- Generate a perfect bedrock layer at the world bottom
minetest.register_on_generated(function(minp, maxp)
	if maxp.y >= BEDROCK_LAYER and minp.y <= BEDROCK_LAYER then
		local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
		local data = vm:get_data()
		local area = VoxelArea:new({MinEdge=emin, MaxEdge=emax})
		local c_bedrock = minetest.get_content_id("bedrock:bedrock")

		for x = minp.x, maxp.x do
			for z = minp.z, maxp.z do
				local p_pos = area:index(x, BEDROCK_LAYER, z)
				data[p_pos] = c_bedrock
			end
		end

		vm:set_data(data)
		vm:calc_lighting()
		vm:update_liquids()
		vm:write_to_map()
	end
end)

if minetest.get_modpath("mesecons_mvps") then
	mesecon:register_mvps_stopper("bedrock:bedrock")
end

if minetest.setting_getbool("log_mods") then
	minetest.log("action", "[bedrock] loaded.")
end
