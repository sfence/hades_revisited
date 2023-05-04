local S = minetest.get_translator("hades_gaia")

-- WTPFL Licenses
hades_gaia = {}

local conv = function(pos, pos_table)
	local nodename = minetest.get_node(pos).name
	if nodename == "hades_core:ash" or nodename == "hades_core:volcanic_sand" or nodename == "hades_core:fertile_sand" or nodename == "hades_core:stone_baked" or nodename == "hades_core:stone" or nodename == "hades_core:mossystone" or nodename == "hades_core:tuff" or nodename == "hades_core:tuff_baked" or nodename == "hades_core:mossytuff" then
		table.insert(pos_table, pos)
	end
end

local cotrig = function(pos, username)
	local pos_table = {}
	for dx=-4,4 do
	for dz=-4,4 do
	for dy=1,-1,-1 do
		pos.x = pos.x+dx
		pos.y = pos.y+dy
		pos.z = pos.z+dz

		if math.abs(dx)<4 and math.abs(dy)<1 and math.abs(dz)<4 then
			local newpos = table.copy(pos)
			if not (minetest.is_protected(newpos, username) and not minetest.check_player_privs(username, "protection_bypass")) then
				conv(table.copy(newpos), pos_table)
			end
		end
		pos.x = pos.x-dx
		pos.y = pos.y-dy
		pos.z = pos.z-dz
	end
	end
	end
	minetest.bulk_set_node(pos_table, {name="hades_core:dirt"})
	for p=1, #pos_table do
		minetest.check_for_falling(pos_table[p])
	end
end

function hades_gaia.staffgaia_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end

	if minetest.is_protected(pt.under, user:get_player_name()) and not minetest.check_player_privs(user:get_player_name(), "protection_bypass") then
		minetest.record_protection_violation(pt.under, user:get_player_name())
		return
	end

	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)


	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end


	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end


	cotrig(pt.under, user:get_player_name())
	if not minetest.is_creative_enabled(user:get_player_name()) then
		itemstack:add_wear_by_uses(uses)
	end
	return itemstack
end

minetest.register_tool("hades_gaia:staffgaia", {
	description = S("Staff of Gaia"),
	_tt_help = S("Turns ash, sand, stone and tuff to dirt"),
	inventory_image = "hades_gaia_staffgaia.png",


	on_use = function(itemstack, user, pointed_thing)
		return hades_gaia.staffgaia_on_use(itemstack, user, pointed_thing, 99)
	end,
})

minetest.register_craftitem("hades_gaia:staffgaia_head", {
	description = S("Head of the Staff of Gaia"),
	inventory_image = "hades_gaia_staffgaia_head.png",
})

minetest.register_craftitem("hades_gaia:staffgaia_shaft", {
	description = S("Shaft of the Staff of Gaia"),
	inventory_image = "hades_gaia_staffgaia_shaft.png",
})

minetest.register_craft({
	output = "hades_gaia:staffgaia_head",
	recipe = {
		{"hades_core:sapphire", "hades_core:mese_crystal", "hades_core:sapphire"},
		{"hades_core:mese_crystal", "hades_core:diamond", "hades_core:mese_crystal"},
        {"hades_core:emerald", "hades_core:mese_crystal", "hades_core:emerald"},
	}
})

minetest.register_craft({
	output = "hades_gaia:staffgaia_shaft",
	recipe = {
		{"", "hades_core:ruby", ""},
		{"", "hades_core:ruby", ""},
		{"", "hades_trees:tree", ""},
	}
})
minetest.register_craft({
	output = "hades_gaia:staffgaia",
	recipe = {
		{"", "hades_gaia:staffgaia_head", ""},
		{"", "hades_gaia:staffgaia_shaft", ""},
	}
})

