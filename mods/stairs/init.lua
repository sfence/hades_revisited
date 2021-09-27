-- Hades Stairs mod
-- See README.txt for licensing and other information.

stairs = {}

local get_images = function(def)
	local images = table.copy(def.tiles)
	if (def.paramtype2 == "wallmounted" or
			def.paramtype2 == "colorwallmounted" or
			def.paramtype2 == "facedir" or
			def.paramtype2 == "colorfacedir") then
		return images
	end
	for i=1, #images do
		local tile = images[i]
		if type(tile) == "table" and not tile.align_style then
			tile.align_style = "world"
		elseif type(tile) == "string" then
			tile = { name = tile, align_style = "world" }
		end
		images[i] = tile
	end
	return images
end

local function rotate_and_place(itemstack, placer, pointed_thing, rotate)
	local p0 = pointed_thing.under
	local p1 = pointed_thing.above
	local param2 = 0

	if placer then
		local placer_pos = placer:get_pos()
		if placer_pos and rotate then
			param2 = minetest.dir_to_facedir(vector.subtract(p1, placer_pos))
		end

		local finepos = minetest.pointed_thing_to_face_pos(placer, pointed_thing)
		local fpos = finepos.y % 1

		if p0.y - 1 == p1.y or (fpos > 0 and fpos < 0.5)
				or (fpos < -0.5 and fpos > -0.999999999) then
			param2 = param2 + 20
			if rotate then
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end
		end
	end
	return minetest.item_place(itemstack, placer, pointed_thing, param2)
end

-- Node will be called stairs:stair_<subname>
function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = light_source,
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointed_thing, true)
		end,
		_hades_shaper_next = "stairs:stair_in_"..subname,
	})

	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 8',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})
	-- Flipped recipe
	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 8',
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:stair_out_<subname>
function stairs.register_stair_out(subname, recipeitem, groups, images, description, sounds)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	minetest.register_node(":stairs:stair_out_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = light_source,
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			   {-0.5, -0.5, -0.5, 0.5, 0, 0},
			   {-0.5, -0.5, 0, 0, 0.5, 0.5},
			   {0, -0.5, 0, 0.5, 0, 0.5},
		    },
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointed_thing, true)
		end,
		_hades_shaper_next = "stairs:stair_"..subname,
	})

	minetest.register_craft({
		output = 'stairs:stair_out_' .. subname .. ' 4',
		recipe = {
			{"", recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:stair_in_<subname>
function stairs.register_stair_in(subname, recipeitem, groups, images, description, sounds)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	minetest.register_node(":stairs:stair_in_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = light_source,
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			  {-0.5, -0.5, 0, 0.5, 0.5, 0.5},
			  {-0.5, -0.5, -0.5, 0, 0.5, 0},
			  {0, -0.5, -0.5, 0.5, 0, 0},
		    },
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointed_thing, true)
		end,
		_hades_shaper_next = "stairs:stair_out_"..subname,
	})

	minetest.register_craft({
		output = 'stairs:stair_in_' .. subname .. ' 6',
		recipe = {
			{"", recipeitem, ""},
			{recipeitem, "", recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:slab_<subname>
function stairs.register_slab(subname, recipeitem, groups, images, description, sounds, has_double)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		light_source = light_source,
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			-- If it's being placed on an another similar one, replace it with
			-- a full block
			local slabpos = nil
			local slabnode = nil
			local p0 = pointed_thing.under
			local p1 = pointed_thing.above
			local n0 = minetest.get_node(p0)
			local n1 = minetest.get_node(p1)
			local param2 = 0

			local n0_is_upside_down = (n0.name == "stairs:slab_" .. subname and
					n0.param2 >= 20)

			if n0.name == "stairs:slab_" .. subname and not n0_is_upside_down and p0.y+1 == p1.y then
				slabpos = p0
				slabnode = n0
			elseif n1.name == "stairs:slab_" .. subname then
				slabpos = p1
				slabnode = n1
			end
			if slabpos then
				-- Remove the slab at slabpos
				minetest.remove_node(slabpos)
				-- Make a fake stack of a single item and try to place it
				local fakeitem
				if has_double then
					fakeitem = "stairs:slab_double_" .. subname
				else
					fakeitem = recipeitem
				end
				local fakestack = ItemStack(fakeitem)
				fakestack:set_count(itemstack:get_count())

				pointed_thing.above = slabpos
				local success
				fakestack, success = minetest.item_place(fakestack, placer, pointed_thing)
				-- If the item was taken from the fake stack, decrement original
				if success then
					itemstack:set_count(fakestack:get_count())
				-- Else put old node back
				else
					minetest.set_node(slabpos, slabnode)
				end
				return itemstack
			end

			-- Upside down slabs
			if p0.y-1 == p1.y then
				-- Turn into full block if pointing at a existing slab
				if n0_is_upside_down  then
					-- Remove the slab at the position of the slab
					minetest.remove_node(p0)
					-- Make a fake stack of a single item and try to place it
					local fakeitem
					if has_double then
						fakeitem = "stairs:slab_double_" .. subname
					else
						fakeitem = recipeitem
					end
					local fakestack = ItemStack(fakeitem)
					fakestack:set_count(itemstack:get_count())

					pointed_thing.above = p0
					local success
					fakestack, success = minetest.item_place(fakestack, placer, pointed_thing)
					-- If the item was taken from the fake stack, decrement original
					if success then
						itemstack:set_count(fakestack:get_count())
					-- Else put old node back
					else
						minetest.set_node(p0, n0)
					end
					return itemstack
				end

				-- Place upside down slab
				param2 = 20
			end

			return rotate_and_place(itemstack, placer, pointed_thing, false)
		end,
	})

	minetest.register_craft({
		output = 'stairs:slab_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Nodes will be called stairs:slab_double_<subname>
function stairs.register_slab_double(subname, recipeitem, groups, images, description, sounds)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = rdef.tiles
		end
	end
	minetest.register_node(":stairs:slab_double_" .. subname, {
		description = description,
		drawtype = "normal",
		tiles = images,
		paramtype2 = "facedir",
		light_source = light_source,
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
	})

	minetest.register_craft({
		output = 'stairs:slab_double_' .. subname,
		recipe = {
			{recipeitem},
			{recipeitem},
		},
	})
	-- Reverse craft
	minetest.register_craft({
		output = recipeitem .. ' 2',
		recipe = {
			{'stairs:slab_double_' .. subname},
		},
	})

end

-- Nodes will be called stairs:slab_<subname>, stairs:slab_double_<subname>
function stairs.register_slab_with_double(subname, recipeitem, groups, images, desc_slab, desc_slab_double, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds, true)
	stairs.register_slab_double(subname, "stairs:slab_"..subname, groups, images, desc_slab_double, sounds)
end

-- Nodes will be called stairs:{stair,slab}_<subname> and optionally stairs:slab_double_<subname>
function stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_stair_out, desc_stair_in, desc_slab, sounds, desc_slab_double)
	local i_stair, i_stair_out, i_stair_in, i_slab
	if images and images[1] == "!CUSTOM" then
		i_stair = images[2]
		i_stair_in = images[3]
		i_stair_out = images[4]
		i_slab = images[5]
	else
		i_stair = images
		i_stair_in = images
		i_stair_out = images
		i_slab = images
	end
	local has_double = desc_slab_double ~= nil
	stairs.register_stair(subname, recipeitem, groups, i_stair, desc_stair, sounds)
	stairs.register_stair_out(subname, recipeitem, groups, i_stair_out, desc_stair_out, sounds)
	stairs.register_stair_in(subname, recipeitem, groups, i_stair_in, desc_stair_in, sounds)
	stairs.register_slab(subname, recipeitem, groups, i_slab, desc_slab, sounds, has_double)
	if has_double then
		stairs.register_slab_double(subname, "stairs:slab_"..subname, groups, i_slab, desc_slab_double, sounds)
	end
end

dofile(minetest.get_modpath("stairs").."/register.lua")
