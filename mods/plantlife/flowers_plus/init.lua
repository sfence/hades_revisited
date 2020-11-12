local S = minetest.get_translator("flowers_plus")

-- This file supplies seaweed and waterlilies

flowers_plus = {}


local SPAWN_DELAY = 1000
local SPAWN_CHANCE = 200
local flowers_seed_diff = 329
local lilies_max_count = 12
local lilies_rarity = 33
local seaweed_max_count = 20
local seaweed_rarity = 33
-- globals
local lilypads_max_count = {}
local lilypads_rarity = {}
-- register the various rotations of waterlilies


local lilies_list = {
	{ nil  , nil 	   , 1	},
	{ "225", "22.5"    , 2	},
	{ "45" , "45"      , 3	},
	{ "675", "67.5"    , 4	},
	{ "s1" , "small_1" , 5	},
	{ "s2" , "small_2" , 6	},
	{ "s3" , "small_3" , 7	},
	{ "s4" , "small_4" , 8	},
}


for i in ipairs(lilies_list) do
	local deg1 = ""
	local deg2 = ""
	local lily_groups = {snappy = 3,flammable=2,waterlily=1}


	if lilies_list[i][1] ~= nil then
		deg1 = "_"..lilies_list[i][1]
		deg2 = "_"..lilies_list[i][2]
		lily_groups = { snappy = 3,flammable=2,waterlily=1, not_in_creative_inventory=1 }
	end


	minetest.register_node(":flowers:waterlily"..deg1, {
		description = S("Waterlily"),
		drawtype = "nodebox",
		tiles = { 
			"flowers_waterlily"..deg2..".png",
			"flowers_waterlily"..deg2..".png^[transformFY",
			"blank.png",
		},
		inventory_image = "flowers_waterlily.png",
		wield_image  = "flowers_waterlily.png",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		groups = lily_groups,
		sounds = hades_sounds.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -7/16, 0.5 },
		},
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.495, -0.5, 0.5, -0.49, 0.5 },
		},
		buildable_to = true,


		liquids_pointable = true,
		drop = "flowers:waterlily",
		on_place = function(itemstack, placer, pointed_thing)
			local keys=placer:get_player_control()
			local pt = pointed_thing


			local place_pos = nil
			local top_pos = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
			local under_node = minetest.get_node(pt.under)
			local above_node = minetest.get_node(pt.above)
			local top_node   = minetest.get_node(top_pos)


			if plantslib:get_nodedef_field(under_node.name, "buildable_to") then
				if under_node.name ~= "hades_core:water_source" then
					place_pos = pt.under
				elseif top_node.name ~= "hades_core:water_source" 
				       and plantslib:get_nodedef_field(top_node.name, "buildable_to") then
					place_pos = top_pos
				else
					return itemstack
				end
			elseif plantslib:get_nodedef_field(above_node.name, "buildable_to") then
				place_pos = pt.above
			end

			if not place_pos then
				return itemstack
			end

			if not plantslib:node_is_owned(place_pos, placer) then

				local nodename = "hades_core:cobble" -- if this block appears, something went....wrong :-)

				if not keys["sneak"] then
					local node = minetest.get_node(pt.under)
					local waterlily = math.random(1,8)
					if waterlily == 1 then
						nodename = "flowers:waterlily"
					elseif waterlily == 2 then
						nodename = "flowers:waterlily_225"
					elseif waterlily == 3 then
						nodename = "flowers:waterlily_45"
					elseif waterlily == 4 then
						nodename = "flowers:waterlily_675"
					elseif waterlily == 5 then
						nodename = "flowers:waterlily_s1"
					elseif waterlily == 6 then
						nodename = "flowers:waterlily_s2"
					elseif waterlily == 7 then
						nodename = "flowers:waterlily_s3"
					elseif waterlily == 8 then
						nodename = "flowers:waterlily_s4"
					end
					minetest.add_node(place_pos, {name = nodename, param2 = math.random(0,3) })
				else
					local fdir = minetest.dir_to_facedir(placer:get_look_dir())
					minetest.add_node(place_pos, {name = "flowers:waterlily", param2 = fdir})
				end


				if not minetest.is_creative_enabled(placer:get_player_name()) then
					itemstack:take_item()
				end
				return itemstack
			end
		end,
		on_rotate = "simple",
	})
end


local algae_list = { {nil}, {2}, {3}, {4} }


for i in ipairs(algae_list) do
	local num = ""
	local algae_groups = {snappy = 3,flammable=2,seaweed=1}


	if algae_list[i][1] ~= nil then
		num = "_"..algae_list[i][1]
		algae_groups = { snappy = 3,flammable=2,seaweed=1, not_in_creative_inventory=1 }
	end


	minetest.register_node(":flowers:seaweed"..num, {
		description = S("Seaweed"),
		drawtype = "nodebox",
		tiles = { 
			"flowers_seaweed"..num..".png",
			"flowers_seaweed"..num..".png^[transformFY",
			"blank.png",
		},
		inventory_image = "flowers_seaweed_2.png",
		wield_image  = "flowers_seaweed_2.png",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		groups = algae_groups,
		sounds = hades_sounds.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -7/16, 0.5 },
		},
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.495, -0.5, 0.5, -0.49, 0.5 },
		},	
		buildable_to = true,


		liquids_pointable = true,
		drop = "flowers:seaweed",
		on_place = function(itemstack, placer, pointed_thing)
			local keys=placer:get_player_control()
			local pt = pointed_thing


			local place_pos = nil
			local top_pos = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
			local under_node = minetest.get_node(pt.under)
			local above_node = minetest.get_node(pt.above)
			local top_node   = minetest.get_node(top_pos)


			if plantslib:get_nodedef_field(under_node.name, "buildable_to") then
				if under_node.name ~= "hades_core:water_source" then
					place_pos = pt.under
				elseif top_node.name ~= "hades_core:water_source" 
				       and plantslib:get_nodedef_field(top_node.name, "buildable_to") then
					place_pos = top_pos
				else
					return itemstack
				end
			elseif plantslib:get_nodedef_field(above_node.name, "buildable_to") then
				place_pos = pt.above
			end
			if not place_pos then
				return itemstack
			end

			if not plantslib:node_is_owned(place_pos, placer) then


				local nodename = "hades_core:cobble" -- :D

				if not keys["sneak"] then
					local node = minetest.get_node(pt.under)
					local seaweed = math.random(1,4)
					if seaweed == 1 then
						nodename = "flowers:seaweed"
					elseif seaweed == 2 then
						nodename = "flowers:seaweed_2"
					elseif seaweed == 3 then
						nodename = "flowers:seaweed_3"
					elseif seaweed == 4 then
						nodename = "flowers:seaweed_4"
					end
					minetest.add_node(place_pos, {name = nodename, param2 = math.random(0,3) })
				else
					local fdir = minetest.dir_to_facedir(placer:get_look_dir())
					minetest.add_node(place_pos, {name = "flowers:seaweed", param2 = fdir})
				end


				if not minetest.is_creative_enabled(placer:get_player_name()) then
					itemstack:take_item()
				end
				return itemstack
			end
		end,
		on_rotate = "simple",
	})
end


-- ongen registrations


flowers_plus.grow_waterlily = function(pos)
	local right_here = {x=pos.x, y=pos.y+1, z=pos.z}
	for i in ipairs(lilies_list) do
		local chance = math.random(1,8)
		local ext = ""
		local num = lilies_list[i][3]


		if lilies_list[i][1] ~= nil then
			ext = "_"..lilies_list[i][1]
		end


		if chance == num then
			minetest.add_node(right_here, {name="flowers:waterlily"..ext, param2=math.random(0,3)})
		end
	end
end


plantslib:register_generate_plant({
    surface = {"hades_core:water_source"},
    max_count = lilypads_max_count,
    rarity = lilypads_rarity,
    min_elevation = -30,
	max_elevation = 100,
	near_nodes = {"hades_core:dirt_with_grass"},
	near_nodes_size = 4,
	near_nodes_vertical = 1,
	near_nodes_count = 1,
    plantlife_limit = -0.9,
    temp_max = -0.22,
    temp_min = 0.22,
  },
  "flowers_plus.grow_waterlily"
)


flowers_plus.grow_seaweed = function(pos)
	local right_here = {x=pos.x, y=pos.y+1, z=pos.z}
	minetest.add_node(right_here, {name="along_shore:seaweed_"..math.random(1,4), param2=math.random(1,3)})
end


plantslib:register_generate_plant({
    surface = {"hades_core:water_source"},
    max_count = seaweed_max_count,
    rarity = seaweed_rarity,
    -- min_elevation = 1,
	max_elevation = 100,
	near_nodes = {"hades_core:mossystone", "hades_core:dirt_with_grass"},
	near_nodes_size = 3,
	near_nodes_vertical = 2,
	near_nodes_count = 1,
    plantlife_limit = -1.0,
  },
  "flowers_plus.grow_seaweed"
)

plantslib:spawn_on_surfaces({
	spawn_delay = SPAWN_DELAY/2,
	spawn_plants = {
		"flowers:waterlily",
		"flowers:waterlily_225",
		"flowers:waterlily_45",
		"flowers:waterlily_675",
		"flowers:waterlily_s1",
		"flowers:waterlily_s2",
		"flowers:waterlily_s3",
		"flowers:waterlily_s4"
	},
	avoid_radius = 2.5,
	spawn_chance = SPAWN_CHANCE*4,
	spawn_surfaces = {"hades_core:water_source"},
	avoid_nodes = {"group:flower", "group:flora" },
	seed_diff = flowers_seed_diff,
	light_min = 9,
	depth_max = 2,
	random_facedir = {0,3}
})


plantslib:spawn_on_surfaces({
	spawn_delay = SPAWN_DELAY*2,
	spawn_plants = {"flowers:seaweed"},
	spawn_chance = SPAWN_CHANCE*2,
	spawn_surfaces = {"hades_core:water_source"},
	avoid_nodes = {"group:flower", "group:flora"},
	seed_diff = flowers_seed_diff,
	light_min = 4,
	light_max = 10,
	neighbors = {"hades_core:dirt_with_grass"},
	facedir = 1
})


plantslib:spawn_on_surfaces({
	spawn_delay = SPAWN_DELAY*2,
	spawn_plants = {"flowers:seaweed"},
	spawn_chance = SPAWN_CHANCE*2,
	spawn_surfaces = {"hades_core:dirt_with_grass"},
	avoid_nodes = {"group:flower", "group:flora" },
	seed_diff = flowers_seed_diff,
	light_min = 4,
	light_max = 10,
	neighbors = {"hades_core:water_source"},
	ncount = 1,
	facedir = 1
})

-- crafting recipes!


minetest.register_craft({
	output = 'flowers:seaweed 3',
	recipe = {{'flowers:waterlily'},}
})

minetest.register_abm({
	label = "Turn seaweed to waterlily",
	nodenames = {"flowers:seaweed"},
	interval = 500,
	chance = 75,
	action = function(pos, node)
		minetest.set_node(pos, {name="flowers:waterlily"})
	end,
})

minetest.log("action", "[flowers_plus] loaded.")
