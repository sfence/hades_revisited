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
			if rotate == 1 then
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			elseif rotate == 2 then
				if param2 == 20 then
					param2 = 21
				elseif param2 == 21 then
					param2 = 20
				elseif param2 == 22 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 22
				end
			end
		end
	end
	return minetest.item_place(itemstack, placer, pointed_thing, param2)
end

local on_place_rotate_and_place = function(itemstack, placer, pointed_thing)
	if pointed_thing.type ~= "node" then
		return itemstack
	end
	return rotate_and_place(itemstack, placer, pointed_thing, 1)
end

local on_place_flip = function(itemstack, placer, pointed_thing)
	if pointed_thing.type ~= "node" then
		return itemstack
	end
	return rotate_and_place(itemstack, placer, pointed_thing, 2)
end

-- Node will be called stairs:stair_<subname>
function stairs.register_stair(subname, recipeitem, groups, images, description, sounds, use_shaper)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	local nshape
	if use_shaper then
		nshape = "stairs:stair_in_"..subname
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
		on_place = on_place_rotate_and_place,
		_hades_shaper_next = nshape,
	})

	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})
	-- Flipped recipe
	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 6',
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:stair_out_<subname>
function stairs.register_stair_out(subname, recipeitem, groups, images, description, sounds, use_shaper)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	local nshape
	if use_shaper then
		nshape = "stairs:stair_"..subname
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
		on_place = on_place_rotate_and_place,
		_hades_shaper_next = nshape,
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
function stairs.register_stair_in(subname, recipeitem, groups, images, description, sounds, use_shaper)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	local nshape
	if use_shaper then
		nshape = "stairs:stair_out_"..subname
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
		on_place = on_place_rotate_and_place,
		_hades_shaper_next = nshape,
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
			local n0_is_sideways = n0.param2 > 3 and n0.param2 < 20

			if n0.name == "stairs:slab_" .. subname and not n0_is_upside_down and not n0_is_sideways and p0.y+1 == p1.y then
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

			return rotate_and_place(itemstack, placer, pointed_thing, 0)
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

-- Node will be called stairs:step_in<subname>
function stairs.register_step_in(subname, recipeitem, groups, images, description, sounds, use_shaper)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	local nshape
	if use_shaper then
		nshape = "stairs:step_out_"..subname
	end
	minetest.register_node(":stairs:step_in_" .. subname, {
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
				{-0.5, -0.5, 0, 0.5, 0, 0.5},
				{-0.5, -0.5, -0.5, 0, 0, 0},
			}
		},
		on_place = on_place_flip,
		_hades_shaper_next = nshape,
	})

	minetest.register_craft({
		output = 'stairs:step_in_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem},
			{'', recipeitem},
		},
	})
	minetest.register_craft({
		output = 'stairs:step_in_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem},
			{recipeitem, ''},
		},
	})

end

-- Node will be called stairs:step_out_<subname>
function stairs.register_step_out(subname, recipeitem, groups, images, description, sounds, use_shaper)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	local nshape
	if use_shaper then
		nshape = "stairs:step_"..subname
	end
	minetest.register_node(":stairs:step_out_" .. subname, {
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
			fixed = {-0.5, -0.5, 0, 0, 0, 0.5},
		},
		on_place = on_place_flip,
		_hades_shaper_next = nshape,
	})

	minetest.register_craft({
		output = 'stairs:step_out_' .. subname .. ' 4',
		recipe = {
			{recipeitem},
			{''},
			{recipeitem},
		},
	})
end

-- Node will be called stairs:step_<subname>
function stairs.register_step(subname, recipeitem, groups, images, description, sounds, use_shaper)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = get_images(rdef)
		end
	end
	local nshape
	if use_shaper then
		nshape = "stairs:step_in_"..subname
	end
	minetest.register_node(":stairs:step_" .. subname, {
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
			fixed = {-0.5, -0.5, 0, 0.5, 0, 0.5},
		},
		on_place = on_place_rotate_and_place,
		_hades_shaper_next = nshape,
	})

	minetest.register_craft({
		output = 'stairs:step_' .. subname .. ' 4',
		recipe = {
			{recipeitem, recipeitem},
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
	if not sounds and recipeitem then
		sounds = minetest.registered_items[recipeitem].sounds
	end
	local has_double = desc_slab_double ~= nil
	stairs.register_stair(subname, recipeitem, groups, i_stair, desc_stair, sounds, true)
	stairs.register_stair_out(subname, recipeitem, groups, i_stair_out, desc_stair_out, sounds, true)
	stairs.register_stair_in(subname, recipeitem, groups, i_stair_in, desc_stair_in, sounds, true)
	stairs.register_slab(subname, recipeitem, groups, i_slab, desc_slab, sounds, has_double)
	if has_double then
		stairs.register_slab_double(subname, "stairs:slab_"..subname, groups, i_slab, desc_slab_double, sounds)
	end
end

function stairs.register_stair_and_slab_and_step(subname, recipeitem, groups, images, desc_stair, desc_stair_out, desc_stair_in, desc_slab, desc_step, desc_step_out, desc_step_in, sounds, desc_slab_double)
	local i_step, i_step_in, i_step_out
	if images and images[1] == "!CUSTOM" then
		i_step = images[6]
		i_step_in = images[7]
		i_step_out = images[8]
	else
		i_step = images
		i_step_in = images
		i_step_out = images
	end
	if not sounds and recipeitem then
		sounds = minetest.registered_items[recipeitem].sounds
	end
	stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_stair_out, desc_stair_in, desc_slab, sounds, desc_slab_double)
	stairs.register_step(subname, recipeitem, groups, i_step, desc_step, sounds, true)
	stairs.register_step_out(subname, recipeitem, groups, i_step_out, desc_step_out, sounds, true)
	stairs.register_step_in(subname, recipeitem, groups, i_step_in, desc_step_in, sounds, true)

end

dofile(minetest.get_modpath("stairs").."/register.lua")
