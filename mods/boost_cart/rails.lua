-- Common rail registrations

local S = minetest.get_translator("boost_cart")

boost_cart:register_rail(":carts:rail", {
  description = S("Steel Rail"),
 _tt_help = S("Track for cart"),
	tiles = {
		"carts_rail_straight.png", "carts_rail_curved.png",
		"carts_rail_t_junction.png", "carts_rail_crossing.png"
	},
	groups = boost_cart:get_rail_groups()
})

-- Bronze rail
boost_cart:register_rail(":carts:copperrail", {
  description = S("Bronze rail"),
  __tt_help = S("Tracks for cart"),
  tiles = {
    "carts_rail_straight_cp.png", "carts_rail_curved_cp.png",
    "carts_rail_t_junction_cp.png", "carts_rail_crossing_cp.png"
  },
  groups = boost_cart:get_rail_groups()
})

minetest.register_craft({
  output = "carts:copperrail 12",
  recipe = {
    {"hades_core:copper_ingot", "", "hades_core:copper_ingot"},
    {"hades_core:copper_ingot", "group:stick", "hades_core:copper_ingot"},
    {"hades_core:copper_ingot", "", "hades_core:copper_ingot"},
  }
})


-- Power rail
boost_cart:register_rail(":carts:powerrail", {
  description = S("Powered Rail"),
  _tt_help = S("Track for cart, accelerates"),
	tiles = {
		"carts_rail_straight_pwr.png", "carts_rail_curved_pwr.png",
		"carts_rail_t_junction_pwr.png", "carts_rail_crossing_pwr.png"
	},
	groups = boost_cart:get_rail_groups(),
	after_place_node = function(pos, placer, itemstack)
		if not mesecon then
			minetest.get_meta(pos):set_string("cart_acceleration", "0.5")
		end
	end,
	mesecons = {
		effector = {
			action_on = function(pos, node)
				boost_cart:boost_rail(pos, 0.5)
			end,
			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
})

minetest.register_craft({
	output = "carts:powerrail 6",
	recipe = {
		{"hades_core:steel_ingot", "hades_core:mese_crystal_fragment", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "group:stick", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "hades_core:mese_crystal_fragment", "hades_core:steel_ingot"},
	}
})

-- Brake rail
boost_cart:register_rail(":carts:brakerail", {
  description = S("Brake Rail"),
  _tt_help = S("Track for cart, slows down"),
	tiles = {
		"carts_rail_straight_brk.png", "carts_rail_curved_brk.png",
		"carts_rail_t_junction_brk.png", "carts_rail_crossing_brk.png"
	},
	groups = boost_cart:get_rail_groups(),
	after_place_node = function(pos, placer, itemstack)
		if not mesecon then
			minetest.get_meta(pos):set_string("cart_acceleration", "-0.3")
		end
	end,
	mesecons = {
		effector = {
			action_on = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "-0.3")
			end,
			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "0")
			end,
		},
	},
})

minetest.register_craft({
	output = "carts:brakerail 6",
	recipe = {
		{"hades_core:steel_ingot", "hades_core:coal_lump", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "group:stick", "hades_core:steel_ingot"},
		{"hades_core:steel_ingot", "hades_core:coal_lump", "hades_core:steel_ingot"},
	}
})

boost_cart:register_rail("boost_cart:startstoprail", {
  description = S("Start-stop Rail"),
  _tt_help = S("Track for cart to start or stop"),
	tiles = {
		"carts_rail_straight_ss.png", "carts_rail_curved_ss.png",
		"carts_rail_t_junction_ss.png", "carts_rail_crossing_ss.png"
	},
	groups = boost_cart:get_rail_groups(),
	after_place_node = function(pos, placer, itemstack)
		if not mesecon then
			minetest.get_meta(pos):set_string("cart_acceleration", "halt")
		end
	end,
	mesecons = {
		effector = {
			action_on = function(pos, node)
				boost_cart:boost_rail(pos, 0.5)
			end,
			action_off = function(pos, node)
				minetest.get_meta(pos):set_string("cart_acceleration", "halt")
			end,
		},
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "boost_cart:startstoprail 2",
	recipe = {"carts:powerrail", "carts:brakerail"},
})
