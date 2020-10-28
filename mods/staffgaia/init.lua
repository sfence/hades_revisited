local S = minetest.get_translator("staffgaia")

-- WTPFL Licenses
staffgaia = {}

local conv = function(pos)
	local nodename = minetest.get_node(pos).name
	if nodename == "hades_core:ash" or nodename == "hades_core:fertile_sand" or nodename == "hades_core:stone_baked" or nodename == "hades_core:stone" or nodename == "hades_core:cobble" or nodename == "hades_core:mossystone" or nodename == "hades_core:tuff" or nodename == "hades_core:tuff_baked" or nodename == "hades_core:mossytuff" or nodename == "hades_core:mossycobble" then
		-- minetest.remove_node(pos)
        minetest.set_node(pos, {name="hades_core:dirt"})
		minetest.check_for_falling(pos)
	end
end

local cotrig = function(pos)
    for dx=-4,4 do
	for dz=-4,4 do
		for dy=1,-1,-1 do
		    pos.x = pos.x+dx
			pos.y = pos.y+dy
			pos.z = pos.z+dz
					
			if math.abs(dx)<4 and math.abs(dy)<1 and math.abs(dz)<4 then
			   conv(pos)
			end
			pos.x = pos.x-dx
			pos.y = pos.y-dy
			pos.z = pos.z-dz
		end
	end
   end
end

function staffgaia.staff_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
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


	cotrig(pt.under)
	if not minetest.settings:get_bool("creative_mode") then
		itemstack:add_wear(65535/(uses-1))
	end
	return itemstack
end

minetest.register_tool("staffgaia:staff", {
	description = S("Staff of Gaia"),
	_tt_help = S("Turns ash, sand, stone, tuff and cobblestone to dirt"),
	inventory_image = "staff_of_gaia.png",


	on_use = function(itemstack, user, pointed_thing)
		return staffgaia.staff_on_use(itemstack, user, pointed_thing, 99)
	end,
})

minetest.register_craftitem("staffgaia:head", {
	description = S("Head of the Staff of Gaia"),
	inventory_image = "staffgaia_head.png",
})

minetest.register_craftitem("staffgaia:shaft", {
	description = S("Shaft of the Staff of Gaia"),
	inventory_image = "staffgaia_shaft.png",
})

minetest.register_craft({
	output = "staffgaia:head",
	recipe = {
		{"hades_core:sapphire", "hades_core:mese_crystal", "hades_core:sapphire"},
		{"hades_core:mese_crystal", "hades_core:diamond", "hades_core:mese_crystal"},
        {"hades_core:emerald", "hades_core:mese_crystal", "hades_core:emerald"},
	}
})

minetest.register_craft({
	output = "staffgaia:shaft",
	recipe = {
		{"", "hades_core:ruby", ""},
		{"", "hades_core:ruby", ""},
		{"", "hades_trees:tree", ""},
	}
})
minetest.register_craft({
	output = "staffgaia:staff",
	recipe = {
		{"", "staffgaia:head", ""},
		{"", "staffgaia:shaft", ""},
	}
})

