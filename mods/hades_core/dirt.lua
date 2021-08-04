local S = minetest.get_translator("hades_core")

-- This registers the grass node and the grass-covered versions of it.
-- There are also intermediate grass groth levels between
-- naked dirt and dirt with grass to have a sense of 'progress'.
-- Param2 is used for the grass color. hades_core:dirt
-- should keep this param2 value

-- Basic dirt node
minetest.register_node("hades_core:dirt", {
	description = S("Dirt"),
	_tt_help = S("Becomes grassy when exposed to light"),
	tiles = {"default_dirt.png"},
	is_ground_content = true,
	groups = {crumbly=3,soil=1,dirt=1, porous=1},
	sounds = hades_sounds.node_sound_dirt_defaults(),
	_hades_magic_next = "hades_core:dirt_with_grass_l1",
})

-- ... with grass cover
minetest.register_node("hades_core:dirt_with_grass", {
	description = S("Dirt with Grass"),
	paramtype2 = "color",
	tiles = {
		"hades_core_grass_cover_colorable.png",
		{name="default_dirt.png", color="white"},
	},
	overlay_tiles = {
		"hades_core_grass_cover_colorable.png",
		"",
		{name="hades_core_grass_side_cover_colorable.png", tileable_vertical=false}
	},
	palette_index = 0,
	color = "#acef6a",
	palette = "hades_core_palette_grass.png",
	is_ground_content = true,
	groups = {crumbly=3,soil=1,dirt=1,dirt_with_grass=1, porous=1},
	drop = 'hades_core:dirt',
	sounds = hades_sounds.node_sound_dirt_defaults({
		footstep = {name="default_grass_footstep", gain=0.25},
	}),
	on_place = function(itemstack, placer, pointed_thing)
		-- pick the correct grass color
		local param2 = hades_core.get_seasonal_grass_color_param2()
		local ret = minetest.item_place(itemstack, placer, pointed_thing, param2)
		return ret
	end,
	_hades_magic_next = "hades_core:dirt",
})

-- Intermediate grass growth levels
for l=1, 3 do
	local sounds
	if l > 1 then
		sounds = hades_sounds.node_sound_dirt_defaults({
			footstep = {name="default_grass_footstep", gain=0.25},
		})
	else
		sounds = hades_sounds.node_sound_dirt_defaults()
	end
	local mnext
	if l < 3 then
		mnext = "hades_core:dirt_with_grass_l"..(l+1)
	else
		mnext = "hades_core:dirt_with_grass"
	end
	minetest.register_node("hades_core:dirt_with_grass_l"..l, {
		description = S("Dirt with Growing Grass (Stage @1)", l),
		tiles = {{name="default_dirt.png", color="white"}},
		overlay_tiles = {
			"hades_core_grass_cover_colorable.png^[mask:hades_core_grass_mask_l"..l..".png",
			"",
			-- Individual textures for each sides, needed so the grassy pixels "connect"
			-- nicely with the top face.
			{name="hades_core_grass_side_cover_colorable.png^[mask:hades_core_grass_side_mask_l"..l.."_xm.png", tileable_vertical=false},
			{name="hades_core_grass_side_cover_colorable.png^[mask:hades_core_grass_side_mask_l"..l.."_xp.png", tileable_vertical=false},
			{name="hades_core_grass_side_cover_colorable.png^[mask:hades_core_grass_side_mask_l"..l.."_zm.png", tileable_vertical=false},
			{name="hades_core_grass_side_cover_colorable.png^[mask:hades_core_grass_side_mask_l"..l.."_zp.png", tileable_vertical=false},
		},
		paramtype2 = "color",
		color = "#acef6a",
		palette = "hades_core_palette_grass.png",
		is_ground_content = true,
		groups = {crumbly=3,soil=1,dirt=1,dirt_with_grass=l+1, porous=1},
		drop = 'hades_core:dirt',
		sounds = sounds,
		on_place = function(itemstack, placer, pointed_thing)
			-- pick the correct grass color
			local param2 = hades_core.get_seasonal_grass_color_param2()
			local ret = minetest.item_place(itemstack, placer, pointed_thing, param2)
			return ret
		end,
		_hades_magic_next = mnext,
	})
end

