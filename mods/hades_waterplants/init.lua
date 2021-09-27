local S = minetest.get_translator("hades_waterplants")

local has_screwdriver = minetest.get_modpath("screwdriver") ~= nil

-- This file supplies seaweed and waterlilies

hades_waterplants = {}


local SPAWN_DELAY = 1000
local SPAWN_CHANCE = 200
local WATERPLANTS_SEED_DIFF = 329
local WATERPLANTS_SEED_DIFF2 = 459
-- register the various rotations of waterlilies


local lilies_list = {
	{ nil  , nil 	   , 1, true },
	{ "225", "22.5"    , 2, true },
	{ "45" , "45"      , 3, true },
	{ "675", "67.5"    , 4, true },
	{ "s1" , "small_1" , 5, false },
	{ "s2" , "small_2" , 6, false },
	{ "s3" , "small_3" , 7, false },
	{ "s4" , "small_4" , 8, false },
}

local node_is_owned = function(pos, placer)
	local name = placer:get_player_name()
	local is_protected = minetest.is_protected(pos, name) and not minetest.check_player_privs(name, "protection_bypass")
	if is_protected then
		minetest.record_protection_violation(pos, name)
		return true
	else
		return false
	end
end

local generate_on_place = function(basename, plant_table)
	return function(itemstack, placer, pt)
		local place_pos = nil
		local top_pos = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
		local under_node = minetest.get_node(pt.under)
		local above_node = minetest.get_node(pt.above)
		local top_node   = minetest.get_node(top_pos)
		local udef = minetest.registered_nodes[under_node.name]
		local adef = minetest.registered_nodes[above_node.name]
		local tdef = minetest.registered_nodes[top_node.name]

		if udef and udef.on_rightclick and
			((not placer) or (placer and not placer:get_player_control().sneak)) then
			return udef.on_rightclick(pt.under, under_node, placer, itemstack,
				pt) or itemstack
		end

		if udef and udef.buildable_to then
			if under_node.name ~= "hades_core:water_source" then
				place_pos = pt.under
			elseif top_node.name ~= "hades_core:water_source" and tdef and tdef.buildable_to then
				place_pos = top_pos
			else
				return itemstack
			end
		elseif adef and adef.buildable_to then
			place_pos = pt.above
		end
		if not place_pos then
			return itemstack
		end
		local below_pos = {x=place_pos.x, y=place_pos.y-1, z=place_pos.z}
		local below_node = minetest.get_node(below_pos)
		local bdef = minetest.registered_nodes[below_node.name]
		if below_node.name ~= "hades_core:water_source" and (bdef and not bdef.walkable) then
			return itemstack
		end

		if not node_is_owned(place_pos, placer) then

			local nodename = basename

			local node = minetest.get_node(pt.under)
			local r = math.random(1, #plant_table)
			local append = plant_table[r][1]
			if append then
				nodename = basename .. "_" ..append
			end
			minetest.add_node(place_pos, {name = nodename, param2 = math.random(0,3) })
			minetest.check_single_for_falling(place_pos)
			local idef = itemstack:get_definition()
			if idef and idef.sounds and idef.sounds.place then
				minetest.sound_play(idef.sounds.place, {pos=place_pos, gain=1}, true)
			end

			if not minetest.is_creative_enabled(placer:get_player_name()) then
				itemstack:take_item()
			end
			return itemstack
		end
	end
end

local on_place_waterlily = generate_on_place("hades_waterplants:waterlily", lilies_list)

for i in ipairs(lilies_list) do
	local deg1 = ""
	local deg1_next = ""
	local deg2 = ""
	local is_classic = false
	local lily_groups = {snappy = 3,flammable=2,waterlily=1,falling_node=1,float=1}

	local ll1 = lilies_list[i][1]
	local is_classic = lilies_list[i][3]
	if ll1 ~= nil then
		deg1 = "_"..lilies_list[i][1]
		deg2 = "_"..lilies_list[i][2]
		lily_groups = { snappy = 3,flammable=2,waterlily=1, not_in_creative_inventory=1,falling_node=1,float=1 }
	end
	if i < #lilies_list then
		deg1_next = "_"..lilies_list[i+1][1]
	else
		deg1_next = ""
	end
	local mnext = "hades_waterplants:waterlily"..deg1_next

	local on_rotate = "simple"
	if is_classic and has_screwdriver then
		on_rotate = function(pos, node, user, mode, new_param2)
			if mode == screwdriver.ROTATE_FACE then
				local suffix = ""
				if ll1 == nil then
					suffix = "_225"
				elseif ll1 == "225" then
					suffix = "_45"
				elseif ll1 == "45" then
					suffix = "_675"
				elseif ll1 == "675" then
					suffix = ""
					node.param2 = (node.param2 + 1) % 4
				else
					return
				end
				node.name = "hades_waterplants:waterlily" .. suffix
				minetest.set_node(pos, node)
				return true
			end
			return false
		end
	end

	minetest.register_node("hades_waterplants:waterlily"..deg1, {
		description = S("Waterlily"),
		drawtype = "nodebox",
		tiles = { 
			"flowers_waterlily"..deg2..".png",
			"flowers_waterlily"..deg2..".png^[transformFY",
			"blank.png",
		},
		use_texture_alpha = "clip",
		inventory_image = "flowers_waterlily"..deg2..".png",
		wield_image  = "flowers_waterlily"..deg2..".png",
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
		floodable = true,
		liquids_pointable = true,
		drop = "hades_waterplants:waterlily",

		node_placement_prediction = "",
		on_place = on_place_waterlily,
		on_rotate = on_rotate,
		_hades_magic_next = mnext,
	})
end


local seaweed_list = { {nil}, {2}, {3}, {4} }

local on_place_seaweed = generate_on_place("hades_waterplants:seaweed", seaweed_list)

for i in ipairs(seaweed_list) do
	local num = ""
	local seaweed_groups = {snappy = 3,flammable=2,seaweed=1,falling_node=1,float=1}


	if seaweed_list[i][1] ~= nil then
		num = "_"..seaweed_list[i][1]
		seaweed_groups = { snappy = 3,flammable=2,seaweed=1, not_in_creative_inventory=1,falling_node=1,float=1 }
	end
	local mnext
	if i < #seaweed_list then
		mnext = "hades_waterplants:seaweed_"..seaweed_list[i+1][1]
	else
		mnext = "hades_waterplants:seaweed"
	end

	minetest.register_node("hades_waterplants:seaweed"..num, {
		description = S("Seaweed"),
		drawtype = "nodebox",
		tiles = { 
			"flowers_seaweed"..num..".png",
			"flowers_seaweed"..num..".png^[transformFY",
			"blank.png",
		},
		use_texture_alpha = "clip",
		inventory_image = "flowers_seaweed"..num..".png",
		wield_image  = "flowers_seaweed"..num..".png",
		sunlight_propagates = true,
		paramtype = "light",
		paramtype2 = "facedir",
		walkable = false,
		groups = seaweed_groups,
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
		floodable = true,
		liquids_pointable = true,
		drop = "hades_waterplants:seaweed",

		node_placement_prediction = "",
		on_place = on_place_seaweed,
		on_rotate = "simple",
		_hades_magic_next = mnext,
	})
end


plantslib:spawn_on_surfaces({
	label = "Spawn waterlilies",
	spawn_delay = SPAWN_DELAY/2,
	spawn_plants = {
		"hades_waterplants:waterlily",
		"hades_waterplants:waterlily_225",
		"hades_waterplants:waterlily_45",
		"hades_waterplants:waterlily_675",
		"hades_waterplants:waterlily_s1",
		"hades_waterplants:waterlily_s2",
		"hades_waterplants:waterlily_s3",
		"hades_waterplants:waterlily_s4"
	},
	avoid_radius = 2.5,
	spawn_chance = SPAWN_CHANCE*4,
	spawn_surfaces = {"hades_core:water_source"},
	avoid_nodes = {"group:flower", "group:flora" },
	seed_diff = WATERPLANTS_SEED_DIFF,
	light_min = 9,
	random_facedir = {0,3}
})


plantslib:spawn_on_surfaces({
	label = "Spawn seaweed on water",
	spawn_delay = SPAWN_DELAY*2,
	spawn_plants = {"hades_waterplants:seaweed"},
	spawn_chance = SPAWN_CHANCE*2,
	spawn_surfaces = {"hades_core:water_source"},
	avoid_nodes = {"group:flower", "group:flora"},
	seed_diff = WATERPLANTS_SEED_DIFF2,
	light_min = 4,
	light_max = 10,
	neighbors = {"hades_core:dirt_with_grass"},
	facedir = 1
})

plantslib:spawn_on_surfaces({
	label = "Spawn seaweed on dirt with grass",
	spawn_delay = SPAWN_DELAY*2,
	spawn_plants = {"hades_waterplants:seaweed"},
	spawn_chance = SPAWN_CHANCE*2,
	spawn_surfaces = {"hades_core:dirt_with_grass"},
	avoid_nodes = {"group:flower", "group:flora" },
	seed_diff = WATERPLANTS_SEED_DIFF2,
	light_min = 4,
	light_max = 10,
	neighbors = {"hades_core:water_source"},
	ncount = 1,
	facedir = 1
})

-- crafting recipes!


minetest.register_craft({
	output = 'hades_waterplants:seaweed 3',
	recipe = {{'hades_waterplants:waterlily'},}
})

minetest.register_abm({
	label = "Turn seaweed to waterlily",
	nodenames = {"hades_waterplants:seaweed"},
	interval = 500,
	chance = 75,
	action = function(pos, node)
		minetest.set_node(pos, {name="hades_waterplants:waterlily"})
	end,
})

minetest.log("action", "[hades_waterplants] loaded.")
