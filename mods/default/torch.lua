
--[[

Torch mod - formerly mod "Torches"
======================

(c) Copyright BlockMen (2013-2015)
(C) Copyright sofar <sofar@foo-projects.org> (2016)

This mod changes the default torch drawtype from "torchlike" to "mesh",
giving the torch a three dimensional appearance. The mesh contains the
proper pixel mapping to make the animation appear as a particle above
the torch, while in fact the animation is just the texture of the mesh.


License:
~~~~~~~~
(c) Copyright BlockMen (2013-2015)

Textures and Meshes/Models:
CC-BY 3.0 BlockMen
Note that the models were entirely done from scratch by sofar.

Code:
Licensed under the GNU LGPL version 2.1 or higher.
You can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License
as published by the Free Software Foundation;

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

See LICENSE.txt and http://www.gnu.org/licenses/lgpl-2.1.txt

--]]

default.register_torch = function(id, def)
	local light = def.light_source
	if not light then
		light = minetest.LIGHT_MAX - 1
	end
	
	minetest.register_node("default:"..id, {
		description = def.description,
		drawtype = "mesh",
		mesh = "torch_floor.obj",
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
		drop = "default:torch",
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
				fakestack:set_name("default:"..id.."_ceiling")
			elseif wdir == 1 then
				fakestack:set_name("default:"..id)
			else
				fakestack:set_name("default:"..id.."_wall")
			end

			itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
			itemstack:set_name("default:"..id)

			return itemstack
		end
	})

	minetest.register_node("default:"..id.."_wall", {
		drawtype = "mesh",
		mesh = "torch_wall.obj",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		light_source = light,
		groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
		drop = "default:torch",
		selection_box = {
			type = "wallmounted",
			wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
		},
		sounds = default.node_sound_wood_defaults(),
	})

	minetest.register_node("default:"..id.."_ceiling", {
		drawtype = "mesh",
		mesh = "torch_ceiling.obj",
		tiles = def.tiles,
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		light_source = light,
		groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
		drop = "default:"..id,
		selection_box = {
			type = "wallmounted",
			wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
		},
		sounds = default.node_sound_wood_defaults(),
	})

end

default.register_torch("torch", {
	description = "Bright Torch",
	light_source = minetest.LIGHT_MAX - 1,
	inventory_image = "default_torch_on_floor.png",
	wield_image = "default_torch_on_floor.png",
	tiles = {{
		name = "default_torch_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
})

default.register_torch("torch_low", {
	description = "Weak Torch",
	light_source = 8,
	inventory_image = "default_torchlow_on_floor.png",
	wield_image = "default_torchlow_on_floor.png",
	tiles = {{
		name = "default_torchlow_on_floor_animated.png",
		animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
})


-- Replace legacy torches

minetest.register_lbm({
	name = "default:3dtorch",
	nodenames = {"default:torch",},
	action = function(pos, node)
		if node.param2 == 0 then
			minetest.set_node(pos, {name = "default:torch_ceiling",
				param2 = node.param2})
		elseif node.param2 == 1 then
			minetest.set_node(pos, {name = "default:torch",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "default:torch_wall",
				param2 = node.param2})
		end
	end,
})

minetest.register_lbm({
	name = "default:3dtorch_low",
	nodenames = {"default:torch_low",},
	action = function(pos, node)
		if node.param2 == 0 then
			minetest.set_node(pos, {name = "default:torch_low_ceiling",
				param2 = node.param2})
		elseif node.param2 == 1 then
			minetest.set_node(pos, {name = "default:torch_low",
				param2 = node.param2})
		else
			minetest.set_node(pos, {name = "default:torch_low_wall",
				param2 = node.param2})
		end
	end,
})

