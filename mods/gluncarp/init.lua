local S = minetest.get_translator("gluncarp")

gluncarp = {}

---more cloth
minetest.register_node("gluncarp:wool_blackgold", {
	description = S("Black Cloth with Gold"),
	paramtype2 = "facedir",
	is_ground_content = false,
	tiles = {"gluncarp_wool_blackgold.png"},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,cloth=1},
	sounds = hades_sounds.node_sound_cloth_defaults(),
})
	
-- Crafting
minetest.register_craft({
	type = "shapeless",
	output = 'gluncarp:wool_blackgold',
	recipe = {'hades_cloth:black','hades_core:gold_ingot'},
})

dofile(minetest.get_modpath("gluncarp").."/machines.lua")
dofile(minetest.get_modpath("gluncarp").."/carpets.lua")
