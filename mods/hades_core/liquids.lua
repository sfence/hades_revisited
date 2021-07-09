local S = minetest.get_translator("hades_core")

local WATER_VISC = 1
local LAVA_VISC = 7
local LIGHT_MAX = minetest.LIGHT_MAX - 1

-- Liquids

minetest.register_node("hades_core:water_flowing", {
	description = S("Flowing Water"),
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			image="default_water_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
		{
			image="default_water_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=0.8}
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "hades_core:water_flowing",
	liquid_alternative_source = "hades_core:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_water_defaults(),
})


minetest.register_node("hades_core:water_source", {
	description = S("Water Source"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png",
			backface_culling = false,
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		},
		{
			name = "default_water_source_animated.png",
			backface_culling = true,
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "hades_core:water_flowing",
	liquid_alternative_source = "hades_core:water_source",
	liquid_viscosity = WATER_VISC,
	post_effect_color = {a=64, r=100, g=100, b=200},
	groups = {water=3, liquid=3, puts_out_fire=1},
	sounds = hades_sounds.node_sound_water_defaults(),
})


minetest.register_node("hades_core:lava_flowing", {
	description = S("Flowing Lava"),
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			image="default_lava_flowing_animated.png",
			backface_culling=false,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
		{
			image="default_lava_flowing_animated.png",
			backface_culling=true,
			animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.3}
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = minetest.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "hades_core:lava_flowing",
	liquid_alternative_source = "hades_core:lava_source",
	liquid_viscosity = LAVA_VISC,
	liquid_renewable = true,
	damage_per_second = 2*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, igniter=1, not_in_creative_inventory=1},
	sounds = hades_sounds.node_sound_lava_defaults(),
})


minetest.register_node("hades_core:lava_source", {
	description = S("Lava Source"),
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			backface_culling = false,
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=4.0},
		},
		{
			name = "default_lava_source_animated.png",
			backface_culling = true,
			animation = {type="vertical_frames", aspect_w=16, aspect_h=16, length=4.0},
		}
	},
	paramtype = "light",
	light_source = minetest.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "hades_core:lava_flowing",
	liquid_alternative_source = "hades_core:lava_source",
	liquid_viscosity = LAVA_VISC,
	liquid_renewable = true,
	damage_per_second = 2*2,
	post_effect_color = {a=192, r=255, g=64, b=0},
	groups = {lava=3, liquid=2, igniter=1},
	sounds = hades_sounds.node_sound_lava_defaults(),
})

