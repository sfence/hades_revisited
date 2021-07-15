local S = minetest.get_translator("hades_core")

minetest.register_node("hades_core:dry_shrub", {
	description = S("Dry Shrub"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=3,attached_node=1},
	sounds = hades_sounds.node_sound_bush_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, 4/16, 6/16},
	},
})


minetest.register_node("hades_core:grass_1", {
	description = S("Grass"),
	drawtype = "plantlike",
	tiles = {"default_grass_1.png"},
	-- use a bigger inventory image
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	paramtype = "light",
	waving = 1,
	walkable = false,
	is_ground_content = true,
	buildable_to = true,
	floodable = true,
	groups = {snappy=3,flammable=3,flora=1,grass=1,attached_node=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, -5/16, 6/16},
	},
	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("hades_core:grass_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("hades_core:grass_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

for i=2,5 do
	minetest.register_node("hades_core:grass_"..i, {
		description = S("Grass"),
		drawtype = "plantlike",
		tiles = {"default_grass_"..i..".png"},
		inventory_image = "default_grass_"..i..".png",
		wield_image = "default_grass_"..i..".png",
		paramtype = "light",
		waving = 1,
		walkable = false,
		buildable_to = true,
		floodable = true,
		is_ground_content = true,
		drop = "hades_core:grass_1",
		groups = {snappy=3,flammable=3,flora=1,grass=1,attached_node=1,not_in_creative_inventory=1},
		sounds = hades_sounds.node_sound_grass_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6/16, -0.5, -6/16, 6/16, -3/16, 6/16},
		},
	})
end

minetest.register_node("hades_core:junglegrass", {
	description = S("Tropical Grass"),
	drawtype = "plantlike",
	tiles = {"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	waving = 1,
	paramtype = "light",
	walkable = false,
	buildable_to = true,
	floodable = true,
	is_ground_content = true,
	groups = {snappy=3,flammable=2,flora=1,grass=1,attached_node=1},
	sounds = hades_sounds.node_sound_grass_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6/16, -0.5, -6/16, 6/16, 0.5, 6/16},
	},
})

minetest.register_node("hades_core:cactus", {
	description = S("Cactus"),
	_tt_help = S("Grows on ash and sand"),
	tiles = {"default_cactus_top.png", "default_cactus_top.png", "default_cactus_side.png"},
	paramtype = "light",
	is_ground_content = true,
	drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5,-0.5,-3/16, 0.5,0.5,3/16},
				{-7/16,-0.5,-5/16, 7/16,0.5,5/16},
				{-6/16,-0.5,-6/16, 6/16,0.5,6/16},
				{-5/16,-0.5,-7/16, 5/16,0.5,7/16},
				{-3/16,-0.5,-0.5, 3/16,0.5,0.5},
			},
		},
	groups = {snappy=1,choppy=3,flammable=2},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_core:cactus_block", {
	description = S("Cactus Block"),
	tiles = {"hades_core_cactus_block.png"},
	is_ground_content = false,
	groups = {choppy=3,flammable=2},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_core:cactus_brick", {
	description = S("Cactus Brick"),
	tiles = {"hades_core_cactus_brick.png"},
	is_ground_content = false,
	groups = {choppy=3,flammable=2},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

minetest.register_node("hades_core:glowing_cactus_block", {
	description = S("Glowing Cactus Block"),
	tiles = {"hades_core_glowing_cactus_block.png"},
	is_ground_content = false,
	light_source = 5,
	groups = {choppy=3,flammable=2},
	sounds = hades_sounds.node_sound_wood_defaults(),
})

-- Dig nodes upwards from
local function dig_up(pos, node, digger)
	if digger == nil then
		return
	end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end

do
-- Papyrus

-- helper variables for nodebox
-- Papyrus stem, thickness
local a = 0
local b = 1/16

-- Papyrus bump, height
local d = 0
local f = 1/16

-- Papyrus bump, width
local c = -1/16
local e = 2/16

minetest.register_node("hades_core:papyrus", {
	description = S("Papyrus"),
	_tt_help = S("Grows on Dirt with Grass near water"),
	drawtype = "nodebox",
	tiles = {
		"hades_core_papyrus_3d.png",
		"hades_core_papyrus_3d.png",
		"hades_core_papyrus_3d_s1.png",
		"hades_core_papyrus_3d_s1.png",
		"hades_core_papyrus_3d_s2.png",
		"hades_core_papyrus_3d_s2.png",
	},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	paramtype = "light",
	is_ground_content = true,
	floodable = true,
	walkable = false,
	selection_box = {
		 type = "fixed",
		 fixed = {-0.4375, -0.5, -0.4375, 0.4375, 0.5, 0.4375}
	},
	node_box = {
		type = "fixed",
                 fixed = {
                         --papyrus 1
                         {a-2/16,-0.5,a-2/16, b-2/16,0.5,b-2/16},
                         {c-2/16,d-2/16,c-2/16, e-2/16,f-2/16,e-2/16},
                         --papyrus 2
                         {a-6/16,-0.5,a-5/16, b-6/16,0.5,b-5/16},
                         {c-6/16,d-3/16,c-5/16, e-6/16,f-3/16,e-5/16},
                         --papyrus 3
                         {a+6/16,-0.5,a-5/16,b+6/16,0.5,b-5/16},
                         {c+6/16,d+3/16,c-5/16, e+6/16,f+3/16,e-5/16},
                         --papyrus 4
                         {a-6/16,-0.5,a+6/16, b-6/16,0.5,b+6/16},
                         {c-6/16,d+6/16,c+6/16, e-6/16,f+6/16,e+6/16},
                         --papyrus 5
                         {a-3/16,-0.5,a+3/16, b-3/16,0.5,b+3/16},
                         {c-3/16,d-6/16,c+3/16, e-3/16,f-6/16,e+3/16},
                         --papyrus 6
                         {a+2/16,-0.5,a+3/16, b+2/16,0.5,b+3/16},
                         {c+2/16,d+5/16,c+3/16, e+2/16,f+5/16,e+3/16},
                 },
	},
	groups = {snappy = 3,flammable = 2},
	sounds = hades_sounds.node_sound_grass_defaults(),
	
	after_dig_node = function(pos, node, metadata, digger)
		dig_up(pos, node, digger)
	end,
})
end

minetest.register_node("hades_core:sugarcane", {
	description = S("Sugarcane"),
	_tt_help = S("Grows on Dirt with Grass near water"),
	drawtype = "plantlike",
	tiles = {"hades_core_sugarcane.png"},
	inventory_image = "hades_core_sugarcane.png",
	wield_image = "hades_core_sugarcane.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	floodable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy=3,flammable=2},
	sounds = hades_sounds.node_sound_bush_defaults(),
	
	after_dig_node = function(pos, node, metadata, digger)
		dig_up(pos, node, digger)
	end,
})

