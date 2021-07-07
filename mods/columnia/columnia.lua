local S = minetest.get_translator("columnia")

columnia.registered_materials = {}

function columnia.register_all(craft, desc, image, groups, sounds, mat)

if not mat then
	mat = string.gsub(craft, ":", "_")
end

if not desc then
	desc = minetest.registered_items[craft].description
end

if not image then
	image = minetest.registered_items[craft].tiles[1]
end

if not groups then
	groups = table.copy(minetest.registered_items[craft].groups)
end
groups.not_in_creative_inventory = 1
groups.wood = nil
groups.wool = nil
groups.stone = nil

if not sounds then
	sounds = minetest.registered_items[craft].sounds
end

local on_place = function(itemstack, placer, pointed_thing)
	if pointed_thing.type ~= "node" then
		return itemstack
	end

	local p0 = pointed_thing.under
	local p1 = pointed_thing.above
	local param2 = 0

	local placer_pos = placer:get_pos()
	if placer_pos then
		local dir = {
			x = p1.x - placer_pos.x,
			y = p1.y - placer_pos.y,
			z = p1.z - placer_pos.z
		}
		param2 = minetest.dir_to_facedir(dir)
	end

	if p0.y-1 == p1.y then
		param2 = param2 + 20
		if param2 == 21 then
			param2 = 23
		elseif param2 == 23 then
			param2 = 21
		end
	end

	return minetest.item_place(itemstack, placer, pointed_thing, param2)
end

columnia.registered_materials[craft] = mat

-- Make it a world-aligned tile if align_style is not set
local tile
if type(image) == "table" then
	tile = table.copy(image)
	if tile.align_style == nil then
		tile.align_style = "world"
	end
else
	tile = { name = image, align_style = "world" }
end
local tiles = {tile}

minetest.register_node("columnia:column_mid_"..mat, {
	description = S("@1 Column", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}, 
		}
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

local mod_screwdriver = minetest.get_modpath("screwdriver")
local on_rotate_column_top, on_rotate_column_bottom
if mod_screwdriver then
	on_rotate_column_top = function(pos, node, user, mode, new_param2)
		if mode == screwdriver.ROTATE_AXIS then
			node.name = "columnia:column_bottom_"..mat
			minetest.swap_node(pos, node)
			return false
		end
	end
	on_rotate_column_bottom = function(pos, node, user, mode, new_param2)
		if mode == screwdriver.ROTATE_AXIS then
			node.name = "columnia:column_top_"..mat
			minetest.swap_node(pos, node)
			return false
		end
	end
end

minetest.register_node("columnia:column_top_"..mat, {
	description = S("@1 Column Top", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			   {-0.25, -0.5, -0.25, 0.25, 0, 0.25},
			   {-0.375, 0, -0.375, 0.375, 0.25, 0.375},
			   {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5}, 
		},
	},
	on_place = on_place,
	on_rotate = on_rotate_column_top,
	sounds = sounds,
})

minetest.register_node("columnia:column_bottom_"..mat, {
	description = S("@1 Column Bottom", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			    {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
			    {-0.375, -0.25, -0.375, 0.375, 0, 0.375},
			    {-0.25, 0, -0.25, 0.25, 0.5, 0.25},
		},
	},
	on_place = on_place,
	on_rotate = on_rotate_column_bottom,
	sounds = sounds,
})

minetest.register_node("columnia:column_crosslink_"..mat, {
	description = S("@1 Column Crosslink", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
			   {-0.25, 0, -0.5, 0.25, 0.5, 0.5},
			   {-0.4375, 0.0625, -0.4375, 0.4375, 0.4375, 0.4375},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_link_"..mat, {
	description = S("@1 Column Link", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_linkdown_"..mat, {
	description = S("@1 Column Link Down", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			   {-0.5, 0, -0.25, 0.5, 0.5, 0.25},
			   {-0.125, -0.5, -0.125, 0.125, 0, 0.125},
			   {-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
			   {-0.1875, -0.125, -0.1875, 0.1875, 0, 0.1875},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_linkcross_"..mat, {
	description = S("@1 Column Link Cross", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5}, 
			{-0.5, 0, -0.25, 0.5, 0.5, 0.25},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_linkcrossdown_"..mat, {
	description = S("@1 Column Link Cross Down", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.5, 0.25, 0.5, 0.5}, 
			{-0.5, 0, -0.25, 0.5, 0.5, 0.25}, 
			{-0.1875, -0.125, -0.1875, 0.1875, 0, 0.1875},
			{-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875}, 
			{-0.125, -0.375, -0.125, 0.125, -0.125, 0.125},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_linkvertical_"..mat, {
	description = S("@1 Column Link Vertical", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			   {-0.1875, 0.375, -0.1875, 0.1875, 0.5, 0.1875}, 
			{-0.125, -0.375, -0.125, 0.125, -0.125, 0.125}, 
			{-0.1875, -0.125, -0.1875, 0.1875, 0.125, 0.1875},
			{-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
			{-0.125, 0.125, -0.125, 0.125, 0.375, 0.125},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_linkangle_"..mat, {
	description = S("@1 Column Link Corner", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.25, 0.5, 0.5, 0.25},
			{-0.25, 0, -0.5, 0.25, 0.5, -0.25},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_linkangle_down_"..mat, {
	description = S("@1 Column Link Corner Down", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, 0, -0.25, 0.5, 0.5, 0.25},
			{-0.25, 0, -0.5, 0.25, 0.5, -0.25},
			{-0.1875, -0.125, -0.1875, 0.1875, 0, 0.1875},
			{-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875},
			{-0.125, -0.375, -0.125, 0.125, -0.125, 0.125},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_linktee_"..mat, {
	description = S("@1 Column Link T-Form", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.25, 0.5, 0.5, 0.25},
			{-0.25, 0, -0.5, 0.25, 0.5, -0.25},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_linktee_down_"..mat, {
	description = S("@1 Column Link T-Form Down", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.25, 0.5, 0.5, 0.25},
			{-0.25, 0, -0.5, 0.25, 0.5, -0.25},
			{-0.1875, -0.125, -0.1875, 0.1875, 0, 0.1875}, 
			{-0.1875, -0.5, -0.1875, 0.1875, -0.375, 0.1875}, 
			{-0.125, -0.375, -0.125, 0.125, -0.125, 0.125},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_stairsub_"..mat, {
	description = S("@1 Stair Substructure", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	--sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, 0.4375, 0.5, 0.4375, 0.5},
			{-0.5, -0.4375, 0.375, 0.5, 0.4375, 0.4375},
			{-0.5, -0.375, 0.3125, 0.5, 0.4375, 0.375},
			{-0.5, -0.3125, 0.25, 0.5, 0.4375, 0.3125},
			{-0.5, -0.25, 0.1875, 0.5, 0.4375, 0.25},
			{-0.5, -0.1875, 0.125, 0.5, 0.4375, 0.1875},
			{-0.5, -0.125, 0.0625, 0.5, 0.4375, 0.125},
			{-0.5, -0.0625, 0, 0.5, 0.4375, 0.0625},
			{-0.5, 0, -0.0625, 0.5, 0.4375, 0}, 
			{-0.5, 0.0625, -0.125, 0.5, 0.4375, -0.0625}, 
			{-0.5, 0.125, -0.1875, 0.5, 0.4375, -0.125}, 
			{-0.5, 0.1875, -0.25, 0.5, 0.4375, -0.1875}, 
			{-0.5, 0.25, -0.3125, 0.5, 0.4375, -0.25}, 
			{-0.5, 0.3125, -0.375, 0.5, 0.4375, -0.3125}, 
			{-0.5, 0.375, -0.4375, 0.5, 0.4375, -0.375},
		},
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

minetest.register_node("columnia:column_stairsubpillar_"..mat, {
	description = S("@1 Stair Substructure Pillar", desc),
	drawtype = "nodebox",
	tiles = tiles,
	paramtype = "light",
	paramtype2 = "facedir",
	--sunlight_propagates = true,
	is_ground_content = false,
	groups = groups,
	node_box = {
		type = "fixed",
		fixed = {
			    {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, 
				{-0.5, -0.5, 0.4375, 0.5, 0.4375, 0.5}, 
				{-0.5, -0.4375, 0.375, 0.5, 0.4375, 0.4375},
				{-0.5, -0.375, 0.3125, 0.5, 0.4375, 0.375},
				{-0.5, -0.3125, 0.25, 0.5, 0.4375, 0.3125},
				{-0.5, -0.25, 0.1875, 0.5, 0.4375, 0.25},
				{-0.5, -0.1875, 0.125, 0.5, 0.4375, 0.1875},
				{-0.5, -0.125, 0.0625, 0.5, 0.4375, 0.125},
				{-0.5, -0.0625, 0, 0.5, 0.4375, 0.0625},
				{-0.5, 0, -0.0625, 0.5, 0.4375, 0},
				{-0.5, 0.0625, -0.125, 0.5, 0.4375, -0.0625},
				{-0.5, 0.125, -0.1875, 0.5, 0.4375, -0.125}, 
				{-0.5, 0.1875, -0.25, 0.5, 0.4375, -0.1875}, 
				{-0.5, 0.25, -0.3125, 0.5, 0.4375, -0.25},
				{-0.5, 0.3125, -0.375, 0.5, 0.4375, -0.3125},
				{-0.5, 0.375, -0.4375, 0.5, 0.4375, -0.375},
				{-0.25, -0.5, -0.25, 0.25, 0.4375, 0.25},
		    },
	},
	on_place = on_place,
	on_rotate = "simple",
	sounds = sounds,
})

end

