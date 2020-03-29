-- this code is inspired by Nathan's "mylandscaping" mod
-- it makes carpets who melting with the underground, so you can build on it (works only on regristrated nodes)
-- image and code are WTFPL license
gluncarp = {}

---more wool
minetest.register_node("gluncarp:wool_blackgold", {
		description = "Black Wool with Gold",
		paramtype2 = "facedir",
		is_ground_content = false,
		tiles = {"gluncarp_wool_blackgold.png"},
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1},
		sounds = hades_sounds.node_sound_defaults(),
	})
	
	-- Crafting
	minetest.register_craft({
		type = "shapeless",
		output = 'gluncarp:wool_blackgold',
		recipe = {'wool:black','default:gold_ingot'},
	})
	

dofile(minetest.get_modpath("gluncarp").."/machines.lua")
dofile(minetest.get_modpath("gluncarp").."/carpets.lua")
