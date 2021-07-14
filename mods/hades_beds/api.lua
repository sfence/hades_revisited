local S = minetest.get_translator("hades_beds")

local bed_sounds = hades_sounds.node_sound_wood_defaults({
	footstep = hades_sounds.node_sound_cloth_defaults().footstep,
})

function hades_beds.register_bed(name, def)
	minetest.register_node(name .. "_bottom", {
		description = def.description,
		_tt_help = S("Lets you set your respawn position"),
		inventory_image = def.inventory_image,
		wield_image = def.wield_image,
		drawtype = "nodebox",
		tiles = def.tiles.bottom,
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		stack_max = 1,
		groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, bed = 1},
		sounds = bed_sounds,
		node_box = {
			type = "fixed",
			fixed = def.nodebox.bottom,
		},
		selection_box = {
			type = "fixed",
			fixed = def.selectionbox,
				
		},
		after_place_node = function(pos, placer, itemstack)
			local n = minetest.get_node_or_nil(pos)
			if not n or not n.param2 then
				minetest.remove_node(pos)
				return true
			end
			local dir = minetest.facedir_to_dir(n.param2)
			local p = {x=pos.x+dir.x,y=pos.y,z=pos.z+dir.z}
			local n2 = minetest.get_node_or_nil(p)
			local def = minetest.registered_items[n2.name] or nil
			if not n2 or not def or not def.buildable_to then
				minetest.remove_node(pos)
				return true
			end
			minetest.set_node(p, {name = n.name:gsub("%_bottom", "_top"), param2 = n.param2})
			return false
		end,	
		on_destruct = function(pos)
			local n = minetest.get_node_or_nil(pos)
			if not n then return end
			local dir = minetest.facedir_to_dir(n.param2)
			local p = {x=pos.x+dir.x,y=pos.y,z=pos.z+dir.z}
			local n2 = minetest.get_node(p)
			if minetest.get_item_group(n2.name, "bed") == 2 and n.param2 == n2.param2 then
				minetest.remove_node(p)
			end
		end,
		on_rightclick = function(pos, node, clicker)
			hades_beds.on_rightclick(pos, clicker)
		end,
		on_rotate = false,
	})

	minetest.register_node(name .. "_top", {
		drawtype = "nodebox",
		tiles = def.tiles.top,
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, bed = 2},
		sounds = bed_sounds,
		node_box = {
			type = "fixed",
			fixed = def.nodebox.top,
		},
		selection_box = {
			type = "fixed",
			fixed = {0, 0, 0, 0, 0, 0},
		},
		on_rotate = false,
	})

	minetest.register_alias(name, name .. "_bottom")

	-- register recipe
	minetest.register_craft({
		output = name,
		recipe = def.recipe
	}) 
end
