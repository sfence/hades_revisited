local S = minetest.get_translator("hades_torches")

hades_torches = {}

hades_torches.register_torch = function(id, def)
	local light = def.light_source
	if not light then
		light = minetest.LIGHT_MAX - 1
	end
	
	minetest.register_node("hades_torches:"..id, {
		description = def.description,
		drawtype = "mesh",
		mesh = "hades_torches_torch_floor.obj",
		inventory_image = def.inventory_image,
		wield_image = def.wield_image,
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		liquids_pointable = false,
		light_source = light,
		groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1},
		selection_box = {
			type = "wallmounted",
			wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
		},
		sounds = default.node_sound_wood_defaults(),
		on_place = function(itemstack, placer, pointed_thing)
			local under = pointed_thing.under
			local node = minetest.get_node(under)
			local def = minetest.registered_nodes[node.name]
			if def and def.on_rightclick and
				((not placer) or (placer and not placer:get_player_control().sneak)) then
				return def.on_rightclick(under, node, placer, itemstack,
					pointed_thing) or itemstack
			end

			local above = pointed_thing.above
			local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
			local fakestack = itemstack
			if wdir == 0 then
				fakestack:set_name("hades_torches:"..id.."_ceiling")
			elseif wdir == 1 then
				fakestack:set_name("hades_torches:"..id)
			else
				fakestack:set_name("hades_torches:"..id.."_wall")
			end

			itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
			itemstack:set_name("hades_torches:"..id)

			return itemstack
		end
	})

	minetest.register_node("hades_torches:"..id.."_wall", {
		drawtype = "mesh",
		mesh = "hades_torches_torch_wall.obj",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		light_source = light,
		groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
		drop = "hades_torches:"..id,
		selection_box = {
			type = "wallmounted",
			wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
		},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_node("hades_torches:"..id.."_ceiling", {
		drawtype = "mesh",
		mesh = "hades_torches_torch_ceiling.obj",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		light_source = light,
		groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
		drop = "hades_torches:"..id,
		selection_box = {
			type = "wallmounted",
			wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
		},
		sounds = default.node_sound_wood_defaults(),
	})

end

hades_torches.register_torch("torch", {
	description = S("Bright Torch"),
	light_source = minetest.LIGHT_MAX - 1,
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	tiles = {{
		name = "default_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
})

hades_torches.register_torch("torch_low", {
	description = S("Weak Torch"),
	light_source = 8,
	inventory_image = "default_torchlow_on_floor.png",
	wield_image = "default_torchlow_on_floor.png",
	tiles = {{
		name = "default_torchlow_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
})

minetest.register_craft({
	output = 'hades_torches:torch_low 4',
	recipe = {
		{'default:coal_lump'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'hades_torches:torch',
	recipe = {
		{'farming:string'},
		{'hades_torches:torch_low'},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "hades_torches:torch",
	burntime = 4,
})

