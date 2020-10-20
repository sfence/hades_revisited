local raillike_group = minetest.raillike_group("rail")

local S = minetest.get_translator("boost_cart")

minetest.register_node(":carts:rail", {
	description = S("Steel Rail"),
	drawtype = "raillike",
	tiles = {"default_rail.png", "default_rail_curved.png", "default_rail_t_junction.png", "default_rail_crossing.png"},
	inventory_image = "default_rail.png",
	wield_image = "default_rail.png",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {dig_immediate = 2, attached_node = 1, rail = 1, connect_to_raillike = raillike_group},
	sounds = hades_sounds.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = 'carts:rail 18',
	recipe = {
		{'hades_core:steel_ingot', '', 'hades_core:steel_ingot'},
		{'hades_core:steel_ingot', 'group:stick', 'hades_core:steel_ingot'},
		{'hades_core:steel_ingot', '', 'hades_core:steel_ingot'},
	}
})

-- Copper rail
minetest.register_node(":carts:copperrail", {
	description = S("Bronze Rail"),
	drawtype = "raillike",
	tiles = {"carts_rail_cp.png", "carts_rail_curved_cp.png", "carts_rail_t_junction_cp.png", "carts_rail_crossing_cp.png"},
	inventory_image = "carts_rail_cp.png",
	wield_image = "carts_rail_cp.png",
	paramtype = "light",
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {dig_immediate = 2, attached_node = 1, rail = 1, connect_to_raillike = raillike_group},
	sounds = hades_sounds.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "carts:copperrail 12",
	recipe = {
		{"hades_core:bronze_ingot", "group:stick", "hades_core:bronze_ingot"},
		{"hades_core:bronze_ingot", "group:stick", "hades_core:bronze_ingot"},
		{"hades_core:bronze_ingot", "group:stick", "hades_core:bronze_ingot"},
	}
})

-- Speed up

minetest.register_node(":carts:powerrail", {
	description = S("Powered Rail"),
	drawtype = "raillike",
	tiles = {"carts_rail_pwr.png", "carts_rail_curved_pwr.png", "carts_rail_t_junction_pwr.png", "carts_rail_crossing_pwr.png"},
	inventory_image = "carts_rail_pwr.png",
	wield_image = "carts_rail_pwr.png",
	paramtype = "light",
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {dig_immediate = 2, attached_node = 1, rail = 1, connect_to_raillike = raillike_group},
	
	after_place_node = function(pos, placer, itemstack)
		if not mesecon then
			minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
		end
	end,
	
	mesecons = {
		effector = {
			action_on = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
			end,
			
			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
	sounds = hades_sounds.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "carts:powerrail 6",
	recipe = {
		{"hades_core:steel_ingot", "hades_core:mese_crystal_fragment", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "group:stick", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "hades_core:mese_crystal_fragment", "hades_core:steel_ingot"},
	}
})

minetest.register_node(":carts:brakerail", {
	description = S("Brake Rail"),
	drawtype = "raillike",
	tiles = {"carts_rail_brk.png", "carts_rail_curved_brk.png", "carts_rail_t_junction_brk.png", "carts_rail_crossing_brk.png"},
	inventory_image = "carts_rail_brk.png",
	wield_image = "carts_rail_brk.png",
	paramtype = "light",
	is_ground_content = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		-- but how to specify the dimensions for curved and sideways rails?
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {dig_immediate = 2, attached_node = 1, rail = 1, connect_to_raillike = raillike_group},
	
	after_place_node = function(pos, placer, itemstack)
		if not mesecon then
			minetest.get_meta(pos):set_string("cart_acceleration", "-0.2")
		end
	end,
	
	mesecons = {
		effector = {
			action_on = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "-0.2")
			end,
			
			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
	sounds = hades_sounds.node_sound_metal_defaults(),
})

minetest.register_craft({
	output = "carts:brakerail 6",
	recipe = {
		{"hades_core:steel_ingot", "hades_core:coal_lump", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "group:stick", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "hades_core:coal_lump", "hades_core:steel_ingot"},
	}
})
