local S = minetest.get_translator("hades_trees")

hades_trees.register_trunk = function(id, def)
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		tiles = def.tiles,
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.35,-0.5,-0.4,0.35,0.5,0.4},
				{-0.4,-0.5,-0.35, 0.4,0.5,0.35},
				{-0.25,-0.5,-0.45,0.25,0.5,0.45},
				{-0.45,-0.5,-0.25, 0.45,0.5,0.25},
				{-0.15,-0.5,-0.5,0.15,0.5,0.5},
				{-0.5,-0.5,-0.15, 0.5,0.5,0.15},
			},
		},
		is_ground_content = false,
		groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
		sounds = hades_sounds.node_sound_wood_defaults(),
	})
end

hades_trees.register_bark = function(id, def)
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		paramtype2 = "facedir",
		tiles = { def.image },
		is_ground_content = false,
		groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
		sounds = hades_sounds.node_sound_wood_defaults(),
	})
end

hades_trees.register_sapling = function(id, def)
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		_tt_help = S("Needs Dirt and light to grow"),
		drawtype = "plantlike",
		tiles = {def.image},
		inventory_image = def.image,
		wield_image = def.image,
		paramtype = "light",
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = def.selbox,
		},
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1, sapling=1},
		sounds = hades_sounds.node_sound_leaves_defaults(),
	})
end

hades_trees.register_leaves = function(id, def)
	local drop = {
		max_items = 1,
		items = {
		{
				-- player will get sapling with chance of (1/def.drop_rarity)
				items = {def.drop_item},
				rarity = def.drop_rarity,
			},
			{
				-- player will get leaves only if they get no def.drop_item,
				-- this is because max_items is 1
				items = {'hades_trees:leaves'},
			}
		}
	}
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		drawtype = "allfaces_optional",
		tiles = {def.image},
		paramtype = "light",
		waving = 1,
		is_ground_content = false,
		place_param2 = 1,
		groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, ash_fertilizer=def.ash_fertilizer, porous=1},
		drop = drop,
		sounds = hades_sounds.node_sound_leaves_defaults(),
	})
end

hades_trees.register_fruit = function(id, def)
	minetest.register_node("hades_trees:"..id, {
		description = def.description,
		drawtype = def.drawtype,
		tiles = {def.image},
		inventory_image = def.image,
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		is_ground_content = false,
		selection_box = {
			type = "fixed",
			fixed = def.selbox,
		},
		groups = {dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,food=2,eatable=def.satiation},
		on_use = minetest.item_eat(def.satiation),
		sounds = hades_sounds.node_sound_leaves_defaults(),
		place_param2 = 1,
	})
end
