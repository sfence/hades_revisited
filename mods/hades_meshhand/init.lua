hades_meshhand = {}

local handdef = minetest.registered_items[""]

-- This is a fake node that should never be placed in the world
minetest.register_node("hades_meshhand:hand", {
	description = "",
	tiles = {"hades_skins_skin_base.png"},
	use_texture_alpha = "opaque",
	visual_scale = 1,
	wield_scale = {x=1,y=1,z=1},
	paramtype = "light",
	drawtype = "mesh",
	mesh = "hades_meshhand.b3d",
	-- Prevent construction
	node_placement_prediction = "",
	on_construct = function(pos)
		minetest.log("error", "[hades_meshhand] Trying to construct hades_meshhand:hand at "..minetest.pos_to_string(pos))
		minetest.remove_node(pos)
	end,
	drop = "",
	on_drop = function()
		return ""
	end,
	-- Allow to get rid of the node if it somehow ended up in world
	buildable_to = true,
	groups = { dig_immediate = 3, not_in_creative_inventory = 1 },
	range = handdef.range,
})

minetest.register_on_joinplayer(function(player)
	player:get_inventory():set_size("hand", 1)
end)

function hades_meshhand.set_skin_color(player, colorstring)
	local hand = ItemStack("hades_meshhand:hand")
	local handmeta = hand:get_meta()
	handmeta:set_string("color", colorstring)
	player:get_inventory():set_stack("hand", 1, hand)
end

