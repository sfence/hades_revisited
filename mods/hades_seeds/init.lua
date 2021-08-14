local S = minetest.get_translator("hades_seeds")

local DEFAULT_MINLIGHT = 8
local DEFAULT_MAXLIGHT = minetest.LIGHT_MAX

hades_seeds = {}

--[[ Seed placement.
* `itemstack`, `placer`, `pointed_thing`: Same as node's `on_place` function
* `nodename`: Name of seed node to place
* `surface_check`: Function that takes the node on which the seed is placed as argument,
                   must return true if seed is allowed to be placed here
]]
local place_seed = function(itemstack, placer, pointed_thing, nodename, surface_check)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local name = placer:get_player_name()

	local under = minetest.get_node(pt.under)
	local above = minetest.get_node(pt.above)

	local udef = minetest.registered_nodes[under.name]
	if udef and udef.on_rightclick and
		((not placer) or (placer and not placer:get_player_control().sneak)) then
		return udef.on_rightclick(pt.under, under, placer, itemstack,
			pt) or itemstack
	end

	if minetest.is_protected(pt.under, name) then
		minetest.record_protection_violation(pt.under, name)
		return itemstack
	end
	
	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	
	-- check if pointing at the top of the node
	if pt.above.y ~= pt.under.y+1 then
		return
	end
	
	-- check if you can replace the node above the pointed node
	if not minetest.registered_nodes[above.name].buildable_to then
		return
	end
	
	-- check if placed on correct surface
	if not surface_check(under) then
		return
	end

	minetest.sound_play({name="hades_seeds_seed_place", gain=1.0}, {pos=pt.above}, true)
	
	-- add the node and remove 1 item from the itemstack
	local pdef = minetest.registered_nodes[nodename]
	minetest.add_node(pt.above, {name = nodename, param2 = pdef.place_param2})
	if not minetest.is_creative_enabled(name) then
		itemstack:take_item()
	end
	return itemstack
end

-- Register seed node.
hades_seeds.register_seed = function(name, def)
	local placename = name
	if string.sub(name, 1, 1) == ":" then
		placename = string.sub(name, 2)
	end
	-- Check def table
	if not def.image then
		def.image = "unknown_item.png"
	end
	if def.meshoptions then
		def.place_param2 = def.meshoptions
	end
	if not def.extra_groups then
		def.extra_groups = {}
	end

	-- Register seed
	local g = {seed = 1, snappy = 3, attached_node = 1}
	for k, v in pairs(def.extra_groups) do
		g[k] = v
	end
	minetest.register_node(name, {
		description = def.description,
		_tt_help = def._tt_help,
		tiles = {def.image, def.image, "blank.png"},
		use_texture_alpha = "clip",
		inventory_image = def.image,
		wield_image = def.image,
		drawtype = "nodebox",
		groups = g,
		fertility = def.fertility,
		paramtype = "light",
		place_param2 = def.place_param2,
		walkable = false,
		floodable = true,
		sunlight_propagates = true,
		node_placement_prediction = "",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -31/64, 0.5},
		},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		sounds = {
			dig = { name = "hades_seeds_seed_dig", gain = 0.1 },
			dug = { name = "hades_seeds_seed_dug", gain = 0.5 },
			-- place sound is done in place_seed
		},
		on_place = function(itemstack, placer, pointed_thing)
			return place_seed(itemstack, placer, pointed_thing, placename, def.surface_check)
		end
	})

end

