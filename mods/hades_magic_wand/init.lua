local S = minetest.get_translator("hades_magic_wand")

minetest.register_craftitem("hades_magic_wand:magic_wand", {
	description = S("Magic Wand"),
	_tt_help = S("Changes block variant"),
	inventory_image = "default_stick.png^[colorize:#940EFE:127",
	wield_image = "default_stick.png^[colorize:#940EFE:127",
	groups = { tool = 1, disable_repair = 1 },
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			local pos = pointed_thing.under
			local name = user:get_player_name()
			if minetest.is_protected(pos, name) then
				minetest.record_protection_violation(pos, name)
				return itemstack
			end
			local node = minetest.get_node(pointed_thing.under)
			local def = minetest.registered_items[node.name]
			if def and def._hades_magic_next then
				node.name = def._hades_magic_next
				minetest.swap_node(pos, node)
			end
		end
		return itemstack
	end,
})

minetest.register_craftitem("hades_magic_wand:magic_shaper", {
	description = S("Magic Shaper"),
	_tt_help = S("Changes a block shape"),
	inventory_image = "default_stick.png^[colorize:#0F0EFF:127",
	wield_image = "default_stick.png^[colorize:#0F0EFF:127",
	groups = { tool = 1, disable_repair = 1 },
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			local pos = pointed_thing.under
			local name = user:get_player_name()
			if minetest.is_protected(pos, name) then
				minetest.record_protection_violation(pos, name)
				return itemstack
			end
			local node = minetest.get_node(pointed_thing.under)
			local def = minetest.registered_items[node.name]
			if def and def._hades_shaper_next then
				node.name = def._hades_shaper_next
				minetest.swap_node(pos, node)
			end
		end
		return itemstack
	end,
})

