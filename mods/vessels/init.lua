local S = minetest.get_translator("vessels")

vessels = {}

vessels.register_bottle = function(id, def)
	local on_use
	if def.eatable then
		on_use = minetest.item_eat(3, "vessels:glass_bottle")
	end
	minetest.register_node(id, {
		description = def.description,
		drawtype = "plantlike",
		tiles = def.tiles,
		inventory_image = def.inventory_image,
		wield_image = def.wield_image,
		paramtype = "light",
		walkable = false,
		is_ground_content = false,
		floodable = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 0.4, 0.25}
		},
		on_use = on_use,
		groups = {vessel=1,dig_immediate=3,attached_node=1,food=def.food,eatable=def.eatable},
		sounds = hades_sounds.node_sound_glass_defaults(),
	})
end

vessels.register_bottle("vessels:glass_bottle", {
	description = S("Empty Glass Bottle"),
	tiles = {"vessels_glass_bottle.png"},
	inventory_image = "vessels_glass_bottle_inv.png",
	wield_image = "vessels_glass_bottle.png",
})

minetest.register_craft( {
	output = "vessels:glass_bottle 10",
	recipe = {
		{ "hades_core:glass", "", "hades_core:glass" },
		{ "hades_core:glass", "", "hades_core:glass" },
		{ "", "hades_core:glass", "" }
	}
})

-- Make sure we can recycle them

minetest.register_craftitem("vessels:glass_fragments", {
	description = S("Pile of Glass Fragments"),
	inventory_image = "vessels_glass_fragments.png",
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:glass_bottle",
		"vessels:glass_bottle",
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:drinking_glass",
		"vessels:drinking_glass",
	},
})

minetest.register_craft({
	output = "vessels:glass_fragments 6",
	recipe = {{"doors:door_glass"}},
})

minetest.register_craft({
	type = "cooking",
	output = "hades_core:glass",
	recipe = "vessels:glass_fragments",
})

