local S = minetest.get_translator("stairs")

-- Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.

stairs = {}

-- Node will be called stairs:stair_<subname>
function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	local light_source
	if recipeitem and minetest.registered_nodes[recipeitem] then
		local rdef = minetest.registered_nodes[recipeitem]
		light_source = rdef.light_source
		if not images then
			images = rdef.tiles
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
		end,
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
			images = rdef.tiles
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
		end,
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
			images = rdef.tiles
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
		end,
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
			images = rdef.tiles
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

			-- If pointing at the side of a upside down slab
			if n0_is_upside_down and p0.y+1 ~= p1.y then
				param2 = 20
			end

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
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

local custom_textures = function(block, stair_l, stair_r, outstair, slab)
	return {"!CUSTOM",
		{slab, block, stair_l, stair_r, block, slab},
		{stair_l.."^[transformR180", block, stair_l, block, block, stair_r},
		{stair_l, block, outstair, stair_r, stair_l, outstair},
		{block, block, slab},
	}
end

stairs.register_stair_and_slab("wood", "hades_trees:wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"default_wood.png"},
		S("Temperate Wood Stair"),
		S("Outer Temperate Wood Stair"),
		S("Inner Temperate Wood Stair"),
		S("Temperate Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("pale_wood", "hades_trees:pale_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_pale_wood.png"},
		S("Pale Wood Stair"),
		S("Outer Pale Wood Stair"),
		S("Inner Pale Wood Stair"),
		S("Pale Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("jungle_wood", "hades_trees:jungle_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"default_junglewood.png"},
		S("Tropical Wood Stair"),
		S("Outer Tropical Wood Stair"),
		S("Innter Tropical Wood Stair"),
		S("Tropical Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("lush_wood", "hades_trees:lush_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_lush_wood.png"},
		S("Lush Wood Stair"),
		S("Outer Lush Wood Stair"),
		S("Inner Lush Wood Stair"),
		S("Lush Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("cream_wood", "hades_trees:cream_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_cream_wood.png"},
		S("Cream Wood Stair"),
		S("Outer Cream Wood Stair"),
		S("Inner Cream Wood Stair"),
		S("Cream Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

-- Barks

stairs.register_stair_and_slab("bark", "hades_trees:bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"default_tree.png"},
		S("Common Bark Stair"),
		S("Outer Common Bark Stair"),
		S("Inner Common Bark Stair"),
		S("Common Bark Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("jungle_bark", "hades_trees:jungle_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"default_jungletree.png"},
		S("Tropical Bark Stair"),
		S("Outer Tropical Bark Stair"),
		S("Inner Tropical Bark Stair"),
		S("Tropical Bark Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("pale_bark", "hades_trees:pale_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"hades_trees_pale_tree.png"},
		S("Pale Bark Stair"),
		S("Outer Pale Bark Stair"),
		S("Inner Pale Bark Stair"),
		S("Pale Bark Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("birch_bark", "hades_trees:birch_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"default_tree_birch.png"},
		S("Birch Bark Stair"),
		S("Outer Birch Bark Stair"),
		S("Inner Birch Bark Stair"),
		S("Birch Bark Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("lush_bark", "hades_trees:lush_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"hades_trees_lush_tree.png"},
		S("Lush Bark Stair"),
		S("Outer Lush Bark Stair"),
		S("Inner Lush Bark Stair"),
		S("Lush Bark Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("canvas_bark", "hades_trees:canvas_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"hades_trees_canvas_tree.png"},
		S("Canvas Bark Stair"),
		S("Outer Canvas Bark Stair"),
		S("Inner Canvas Bark Stair"),
		S("Canvas Bark Slab"),
		hades_sounds.node_sound_wood_defaults())

-- Canvas Wood

stairs.register_stair_and_slab("colwood_uncolored", "hades_trees:colwood_uncolored",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_uncolored.png"},
		S("Uncolored Canvas Wood Stair"),
		S("Outer Uncolored Canvas Wood Stair"),
		S("Inner Uncolored Canvas Wood Stair"),
		S("Uncolored Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_black", "hades_trees:colwood_black",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_black.png"},
		S("Black Canvas Wood Stair"),
		S("Outer Black Canvas Wood Stair"),
		S("Inner Black Canvas Wood Stair"),
		S("Black Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_blue", "hades_trees:colwood_blue",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_blue.png"},
		S("Blue Canvas Wood Stair"),
		S("Outer Blue Canvas Wood Stair"),
		S("Inner Blue Canvas Wood Stair"),
		S("Blue Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_brown", "hades_trees:colwood_brown",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_brown.png"},
		S("Brown Canvas Wood Stair"),
		S("Outer Brown Canvas Wood Stair"),
		S("Inner Brown Canvas Wood Stair"),
		S("Brown Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_cyan", "hades_trees:colwood_cyan",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_cyan.png"},
		S("Cyan Canvas Wood Stair"),
		S("Outer Cyan Canvas Wood Stair"),
		S("Inner Cyan Canvas Wood Stair"),
		S("Cyan Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_dark_green", "hades_trees:colwood_dark_green",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_dark_green.png"},
		S("Dark Green Canvas Wood Stair"),
		S("Outer Dark Green Canvas Wood Stair"),
		S("Inner Dark Green Canvas Wood Stair"),
		S("Dark Green Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_dark_grey", "hades_trees:colwood_dark_grey",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_dark_grey.png"},
		S("Dark Grey Canvas Wood Stair"),
		S("Outer Dark Grey Canvas Wood Stair"),
		S("Inner Dark Grey Canvas Wood Stair"),
		S("Dark Grey Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_green", "hades_trees:colwood_green",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_green.png"},
		S("Green Canvas Wood Stair"),
		S("Outer Green Canvas Wood Stair"),
		S("Inner Green Canvas Wood Stair"),
		S("Green Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_grey", "hades_trees:colwood_grey",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_grey.png"},
		S("Grey Canvas Wood Stair"),
		S("Outer Grey Canvas Wood Stair"),
		S("Inner Grey Canvas Wood Stair"),
		S("Grey Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_magenta", "hades_trees:colwood_magenta",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_magenta.png"},
		S("Magenta Canvas Wood Stair"),
		S("Outer Magenta Canvas Wood Stair"),
		S("Inner Magenta Canvas Wood Stair"),
		S("Magenta Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_orange", "hades_trees:colwood_orange",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_orange.png"},
		S("Orange Canvas Wood Stair"),
		S("Outer Orange Canvas Wood Stair"),
		S("Inner Orange Canvas Wood Stair"),
		S("Orange Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_pink", "hades_trees:colwood_pink",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_pink.png"},
		S("Pink Canvas Wood Stair"),
		S("Outer Pink Canvas Wood Stair"),
		S("Inner Pink Canvas Wood Stair"),
		S("Pink Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_red", "hades_trees:colwood_red",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_red.png"},
		S("Red Canvas Wood Stair"),
		S("Outer Red Canvas Wood Stair"),
		S("Inner Red Canvas Wood Stair"),
		S("Red Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_violet", "hades_trees:colwood_violet",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_violet.png"},
		S("Violet Canvas Wood Stair"),
		S("Outer Violet Canvas Wood Stair"),
		S("Inner Violet Canvas Wood Stair"),
		S("Violet Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_white", "hades_trees:colwood_white",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_white.png"},
		S("White Canvas Wood Stair"),
		S("Outer White Canvas Wood Stair"),
		S("Inner White Canvas Wood Stair"),
		S("White Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_yellow", "hades_trees:colwood_yellow",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_yellow.png"},
		S("Yellow Canvas Wood Stair"),
		S("Outer Yellow Canvas Wood Stair"),
		S("Inner Yellow Canvas Wood Stair"),
		S("Yellow Canvas Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

		--

local metals = {
	{"steel", S("Steel Stair"), S("Outer Steel Stair"), S("Inner Steel Stair"), S("Steel Slab"), S("Double Steel Slab")},
	{"copper", S("Copper Stair"), S("Outer Copper Stair"), S("Inner Copper Stair"), S("Copper Slab"), S("Double Copper Slab")},
	{"bronze", S("Bronze Stair"), S("Outer Bronze Stair"), S("Inner Bronze Stair"), S("Bronze Slab"), S("Double Bronze Slab")},
	{"tin", S("Tin Stair"), S("Outer Tin Stair"), S("Inner Tin Stair"), S("Tin Slab"), S("Double Tin Slab")},
	{"gold", S("Gold Stair"), S("Outer Gold Stair"), S("Inner Gold Stair"), S("Gold Slab"), S("Double Gold Slab")},
}
for m=1, #metals do
	local name = metals[m][1].."block"
	local tex = metals[m][1].."_block"
	stairs.register_stair_and_slab(name, "hades_core:"..name,
		{cracky=1,level=2},
		custom_textures("default_"..tex..".png", "stairs_"..tex.."_stair_l.png", "stairs_"..tex.."_stair_r.png", "stairs_"..tex.."_stair_out.png", "stairs_"..tex.."_slab.png"),
		metals[m][2],
		metals[m][3],
		metals[m][4],
		metals[m][5],
		hades_sounds.node_sound_metal_defaults(),
		metals[m][6]
	)
end

stairs.register_stair_and_slab("stone", "hades_core:stone",
		{cracky=3},
		{"default_stone.png"},
		S("Stone Stair"),
		S("Outer Stone Stair"),
		S("Inner Stone Stair"),
		S("Stone Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("stonebrick_baked", "hades_core:stonebrick_baked",
		{cracky=3},
		{"default_stone_brick_baked.png"},
		S("Burned Stone Brick Stair"),
		S("Outer Burned Stone Brick Stair"),
		S("Inner Burned Stone Brick Stair"),
		S("Burned Stone Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("stone_baked", "hades_core:stone_baked",
		{cracky=3},
		{"default_stone_baked.png"},
		S("Burned Stone Stair"),
		S("Outer Burned Stone Stair"),
		S("Inner Burned Stone Stair"),
		S("Burned Stone Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("cobble", "hades_core:cobble",
		{cracky=3},
		{"default_cobble.png"},
		S("Cobblestone Stair"),
		S("Outer Cobblestone Stair"),
		S("Inner Cobblestone Stair"),
		S("Cobblestone Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("cobble_baked", "hades_core:cobble_baked",
		{cracky=3},
		{"default_cobble_baked.png"},
		S("Burned Cobblestone Stair"),
		S("Outer Burned Cobblestone Stair"),
		S("Inner Burned Cobblestone Stair"),
		S("Burned Cobblestone Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick", "hades_core:brick",
		{cracky=3},
		{"default_brick.png"},
		S("Uncolored Brick Stair"),
		S("Outer Uncolored Brick Stair"),
		S("Inner Uncolored Brick Stair"),
		S("Uncolored Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

-- Colors... too mutch ColOrs...  EvErYwhere

stairs.register_stair_and_slab("brick_black", "hades_core:brick_black",
		{cracky=3},
		{"default_brick_black.png"},
		S("Black Brick Stair"),
		S("Outer Black Brick Stair"),
		S("Inner Black Brick Stair"),
		S("Black Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_blue", "hades_core:brick_blue",
		{cracky=3},
		{"default_brick_blue.png"},
		S("Blue Brick Stair"),
		S("Outer Blue Brick Stair"),
		S("Inner Blue Brick Stair"),
		S("Blue Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_brown", "hades_core:brick_brown",
		{cracky=3},
		{"default_brick_brown.png"},
		S("Brown Brick Stair"),
		S("Outer Brown Brick Stair"),
		S("Inner Brown Brick Stair"),
		S("Brown Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_cyan", "hades_core:brick_cyan",
		{cracky=3},
		{"default_brick_cyan.png"},
		S("Cyan Brick Stair"),
		S("Outer Cyan Brick Stair"),
		S("Inner Cyan Brick Stair"),
		S("Cyan Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_dark_green", "hades_core:brick_dark_green",
		{cracky=3},
		{"default_brick_dark_green.png"},
		S("Dark Green Brick Stair"),
		S("Outer Dark Green Brick Stair"),
		S("Inner Dark Green Brick Stair"),
		S("Dark Green Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_dark_grey", "hades_core:brick_dark_grey",
		{cracky=3},
		{"default_brick_dark_grey.png"},
		S("Dark Grey Brick Stair"),
		S("Outer Dark Grey Brick Stair"),
		S("Inner Dark Grey Brick Stair"),
		S("Dark Grey Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_green", "hades_core:brick_green",
		{cracky=3},
		{"default_brick_green.png"},
		S("Green Brick Stair"),
		S("Outer Green Brick Stair"),
		S("Inner Green Brick Stair"),
		S("Green Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_grey", "hades_core:brick_grey",
		{cracky=3},
		{"default_brick_grey.png"},
		S("Grey Brick Stair"),
		S("Outer Grey Brick Stair"),
		S("Inner Grey Brick Stair"),
		S("Grey Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_magenta", "hades_core:brick_magenta",
		{cracky=3},
		{"default_brick_magenta.png"},
		S("Magenta Brick Stair"),
		S("Outer Magenta Brick Stair"),
		S("Inner Magenta Brick Stair"),
		S("Magenta Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_orange", "hades_core:brick_orange",
		{cracky=3},
		{"default_brick_orange.png"},
		S("Orange Brick Stair"),
		S("Outer Orange Brick Stair"),
		S("Inner Orange Brick Stair"),
		S("Orange Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_pink", "hades_core:brick_pink",
		{cracky=3},
		{"default_brick_pink.png"},
		S("Pink Brick Stair"),
		S("Outer Pink Brick Stair"),
		S("Inner Pink Brick Stair"),
		S("Pink Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_red", "hades_core:brick_red",
		{cracky=3},
		{"default_brick_red.png"},
		S("Red Brick Stair"),
		S("Outer Red Brick Stair"),
		S("Inner Red Brick Stair"),
		S("Red Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_violet", "hades_core:brick_violet",
		{cracky=3},
		{"default_brick_violet.png"},
		S("Violet Brick Stair"),
		S("Outer Violet Brick Stair"),
		S("Inner Violet Brick Stair"),
		S("Violet Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_white", "hades_core:brick_white",
		{cracky=3},
		{"default_brick_white.png"},
		S("White Brick Stair"),
		S("Outer White Brick Stair"),
		S("Inner White Brick Stair"),
		S("White Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_yellow", "hades_core:brick_yellow",
		{cracky=3},
		{"default_brick_yellow.png"},
		S("Yellow Brick Stair"),
		S("Outer Yellow Brick Stair"),
		S("Inner Yellow Brick Stair"),
		S("Yellow Brick Slab"),
		hades_sounds.node_sound_stone_defaults())


stairs.register_stair_and_slab("sandstone", "hades_core:sandstone",
		{crumbly=2,cracky=3},
		{"default_sandstone.png"},
		S("Fine Sandstone Stair"),
		S("Outer Fine Sandstone Stair"),
		S("Inner Fine Sandstone Stair"),
		S("Fine Sandstone Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("sandstonebrick", "hades_core:sandstonebrick",
		{cracky=2},
		{"default_sandstone_brick.png"},
		S("Fine Sandstone Brick Stair"),
		S("Outer Fine Sandstone Brick Stair"),
		S("Inner Fine Sandstone Brick Stair"),
		S("Fine Sandstone Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("sandstone_volcanic", "hades_core:sandstone_volcanic",
		{crumbly=2,cracky=3},
		{"default_sandstone_volcanic.png"},
		S("Volcanic Sandstone Stair"),
		S("Outer Volcanic Sandstone Stair"),
		S("Inner Volcanic Sandstone Stair"),
		S("Volcanic Sandstone Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("sandstone_volcanic_brick", "hades_core:sandstone_volcanic_brick",
		{cracky=2},
		{"default_sandstone_volcanic_brick.png"},
		S("Volcanic Sandstone Brick Stair"),
		S("Outer Volcanic Sandstone Brick Stair"),
		S("Inner Volcanic Sandstone Brick Stair"),
		S("Volcanic Sandstone Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("stonebrick", "hades_core:stonebrick",
		{cracky=3},
		{"default_stone_brick.png"},
		S("Stone Brick Stair"),
		S("Outer Stone Brick Stair"),
		S("Inner Stone Brick Stair"),
		S("Stone Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("chondrite_brick", "hades_core:chondrite_brick",
		{cracky=2},
		{"default_chondrite_brick.png"},
		S("Chondrite Brick Stair"),
		S("Outer Chondrite Brick Stair"),
		S("Inner Chondrite Brick Stair"),
		S("Chondrite Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("chondrite", "hades_core:chondrite",
		{cracky=2},
		{"default_chondrite.png"},
		S("Chondrite Stair"),
		S("Outer Chondrite Stair"),
		S("Inner Chondrite Stair"),
		S("Chondrite Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("marble_brick", "hades_core:marble_brick",
		{cracky=3},
		{"default_marble_brick.png"},
		S("Marble Brick Stair"),
		S("Outer Marble Brick Stair"),
		S("Inner Marble Brick Stair"),
		S("Marble Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("marble", "hades_core:marble",
		{cracky=3},
		{"default_marble.png"},
		S("Marble Stair"),
		S("Outer Marble Stair"),
		S("Inner Marble Stair"),
		S("Marble Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("tuff_brick", "hades_core:tuff_brick",
		{cracky=3},
		{"default_tuff_brick.png"},
		S("Tuff Brick Stair"),
		S("Outer Tuff Brick Stair"),
		S("Inner Tuff Brick Stair"),
		S("Tuff Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("tuff", "hades_core:tuff",
		{cracky=3},
		{"default_tuff.png"},
		S("Tuff Stair"),
		S("Outer Tuff Stair"),
		S("Inner Tuff Stair"),
		S("Tuff Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("tuff_baked_brick", "hades_core:tuff_baked_brick",
		{cracky=3},
		{"default_tuff_baked_brick.png"},
		S("Burned Tuff Brick Stair"),
		S("Outer Burned Tuff Brick Stair"),
		S("Inner Burned Tuff Brick Stair"),
		S("Burned Tuff Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("tuff_baked", "hades_core:tuff_baked",
		{cracky=3},
		{"default_tuff_baked.png"},
		S("Burned Tuff Stair"),
		S("Outer Burned Tuff Stair"),
		S("Inner Burned Tuff Stair"),
		S("Burned Tuff Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("essexite_brick", "hades_core:essexite_brick",
		{cracky=1},
		{"default_essexite_brick.png"},
		S("Essexite Brick Stair"),
		S("Outer Essexite Brick Stair"),
		S("Inner Essexite Brick Stair"),
		S("Essexite Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("essexite", "hades_core:essexite",
		{cracky=1},
		{"default_essexite.png"},
		S("Essexite Stair"),
		S("Outer Essexite Stair"),
		S("Inner Essexite Stair"),
		S("Essexite Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("rusty_block", "columnia:rusty_block",
		{cracky=1},
		{"columnia_rusty_block.png"},
		S("Rusty Stair"),
		S("Outer Rusty Stair"),
		S("Inner Rusty Stair"),
		S("Rusty Slab"),
		hades_sounds.node_sound_metal_defaults())

stairs.register_stair_and_slab("cactus_brick", "hades_core:cactus_brick",
		{choppy=3,flammable=2},
		{"default_cactus_brick.png"},
		S("Cactus Brick Stair"),
		S("Outer Cactus Brick Stair"),
		S("Inner Cactus Brick Stair"),
		S("Cactus Brick Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("obsidianbrick", "hades_core:obsidianbrick",
		{cracky=1},
		{"default_obsidian_brick.png"},
		S("Obsidian Brick Stair"),
		S("Outer Obsidian Brick Stair"),
		S("Inner Obsidian Brick Stair"),
		S("Obsidian Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("straw", "hades_farming:straw",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_farming_straw.png"},
		S("Straw Stair"),
		S("Outer Straw Stair"),
		S("Inner Straw Stair"),
		S("Straw Slab"),
		hades_sounds.node_sound_leaves_defaults())

--wool

stairs.register_stair_and_slab("white", "wool:white",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_white.png"},
		S("White Wool Stair"),
		S("Outer White Wool Stair"),
		S("Inner White Wool Stair"),
		S("White Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("grey", "wool:grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_grey.png"},
		S("Grey Wool Stair"),
		S("Outer Grey Wool Stair"),
		S("Inner Grey Wool Stair"),
		S("Grey Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("black", "wool:black",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_black.png"},
		S("Black Wool Stair"),
		S("Outer Black Wool Stair"),
		S("Inner Black Wool Stair"),
		S("Black Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("red", "wool:red",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_red.png"},
		S("Red Wool Stair"),
		S("Outer Red Wool Stair"),
		S("Inner Red Wool Stair"),
		S("Red Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("yellow", "wool:yellow",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_yellow.png"},
		S("Yellow Wool Stair"),
		S("Outer Yellow Wool Stair"),
		S("Inner Yellow Wool Stair"),
		S("Yellow Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("green", "wool:green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_green.png"},
		S("Green Wool Stair"),
		S("Outer Green Wool Stair"),
		S("Inner Green Wool Stair"),
		S("Green Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("cyan", "wool:cyan",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_cyan.png"},
		S("Cyan Wool Stair"),
		S("Outer Cyan Wool Stair"),
		S("Inner Cyan Wool Stair"),
		S("Cyan Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("blue", "wool:blue",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_blue.png"},
		S("Blue Wool Stair"),
		S("Outer Blue Wool Stair"),
		S("Inner Blue Wool Stair"),
		S("Blue Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("magenta", "wool:magenta",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_magenta.png"},
		S("Magenta Wool Stair"),
		S("Outer Magenta Wool Stair"),
		S("Inner Magenta Wool Stair"),
		S("Magenta Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("orange", "wool:orange",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_orange.png"},
		S("Orange Wool Stair"),
		S("Outer Orange Wool Stair"),
		S("Inner Orange Wool Stair"),
		S("Orange Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("violet", "wool:violet",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_violet.png"},
		S("Violet Wool Stair"),
		S("Outer Violet Wool Stair"),
		S("Inner Violet Wool Stair"),
		S("Violet Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("brown", "wool:brown",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_brown.png"},
		S("Brown Wool Stair"),
		S("Outer Brown Wool Stair"),
		S("Inner Brown Wool Stair"),
		S("Brown Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("pink", "wool:pink",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_pink.png"},
		S("Pink Wool Stair"),
		S("Outer Pink Wool Stair"),
		S("Inner Pink Wool Stair"),
		S("Pink Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("dark_grey", "wool:dark_grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_dark_grey.png"},
		S("Dark Grey Wool Stair"),
		S("Outer Dark Grey Wool Stair"),
		S("Inner Dark Grey Wool Stair"),
		S("Dark Grey Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("dark_green", "wool:dark_green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_dark_green.png"},
		S("Dark Green Wool Stair"),
		S("Outer Dark Green Wool Stair"),
		S("Inner Dark Green Wool Stair"),
		S("Dark Green Wool Slab"),
		hades_sounds.node_sound_defaults())

stairs.register_stair_and_slab("glowcrystal_block", "glowcrystals:glowcrystal_block",
		{cracky=3},
		{"glowcrystals_block_glowcrystal.png"},
		S("Glowing Crystal Stair"),
		S("Outer Glowing Crystal Stair"),
		S("Inner Glowing Crystal Stair"),
		S("Glowing Crystal Slab"),
		hades_sounds.node_sound_stone_defaults())


-- Tiles

stairs.register_stair_and_slab("floor_wood_wood", "hades_tiles:floor_wood_wood",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_tiles_floor_wood.png"},
		S("Temperate Wood Tile Stair"),
		S("Outer Temperate Wood Tile Stair"),
		S("Inner Temperate Wood Tile Stair"),
		S("Temperate Wood Tile Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("floor_lush_lush", "hades_tiles:floor_lush_lush",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_tiles_floor_lush.png"},
		S("Lush Wood Tile Stair"),
		S("Outer Lush Wood Tile Stair"),
		S("Inner Lush Wood Tile Stair"),
		S("Lush Wood Tile Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("floor_pale_pale", "hades_tiles:floor_pale_pale",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_tiles_floor_pale.png"},
		S("Pale Wood Tile Stair"),
		S("Outer Pale Wood Tile Stair"),
		S("Inner Pale Wood Tile Stair"),
		S("Pale Wood Tile Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("floor_cream_cream", "hades_tiles:floor_cream_cream",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_tiles_floor_cream.png"},
		S("Cream Wood Tile Stair"),
		S("Outer Cream Wood Tile Stair"),
		S("Inner Cream Wood Tile Stair"),
		S("Temperate Cream Tile Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("floor_jungle_jungle", "hades_tiles:floor_jungle_jungle",
		{choppy=3,oddly_breakable_by_hand=2,flammable=3},
		{"hades_tiles_floor_jungle.png"},
		S("Tropical Tile Stair"),
		S("Outer Tropical Wood Tile Stair"),
		S("Inner Tropical Wood Tile Stair"),
		S("Tropical Wood Tile Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("floor_stone_stone", "hades_tiles:floor_stone_stone",
		{cracky=3},
		{"hades_tiles_floor_stone.png"},
		S("Stone Tile Stair"),
		S("Outer Stone Tile Stair"),
		S("Inner Stone Tile Stair"),
		S("Stone Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_stonebaked_stonebaked", "hades_tiles:floor_stonebaked_stonebaked",
		{cracky=3},
		{"hades_tiles_floor_stonebaked.png"},
		S("Burned Stone Tile Stair"),
		S("Outer Burned Stone Tile Stair"),
		S("Inner Burned Stone Tile Stair"),
		S("Burned Stone Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_tuff_tuff", "hades_tiles:floor_tuff_tuff",
		{cracky=3},
		{"hades_tiles_floor_tuff.png"},
		S("Tuff Tile Stair"),
		S("Outer Tuff Tile Stair"),
		S("Inner Tuff Tile Stair"),
		S("Tuff Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_tuffbaked_tuffbaked", "hades_tiles:floor_tuffbaked_tuffbaked",
		{cracky=3},
		{"hades_tiles_floor_tuffbaked.png"},
		S("Burned Tuff Tile Stair"),
		S("Outer Burned Tuff Tile Stair"),
		S("Inner Burned Tuff Tile Stair"),
		S("Burned Tuff Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_sandstone_sandstone", "hades_tiles:floor_sandstone_sandstone",
		{cracky=3},
		{"hades_tiles_floor_sandstone.png"},
		S("Fine Sandstone Tile Stair"),
		S("Outer Fine Sandstone Tile Stair"),
		S("Inner Fine Sandstone Tile Stair"),
		S("Fine Sandstone Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_sandstonevolcanic_sandstonevolcanic", "hades_tiles:floor_sandstonevolcanic_sandstonevolcanic",
		{cracky=3},
		{"hades_tiles_floor_sandstonevolcanic.png"},
		S("Volcanic Sandstone Tile Stair"),
		S("Outer Volcanic Sandstone Tile Stair"),
		S("Inner Volcanic Sandstone Tile Stair"),
		S("Volcanic Sandstone Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_chondrite_chondrite", "hades_tiles:floor_chondrite_chondrite",
		{cracky=3},
		{"hades_tiles_floor_chondrite.png"},
		S("Chondrite Tile Stair"),
		S("Outer Chondrite Tile Stair"),
		S("Inner Chondrite Tile Stair"),
		S("Chondrite Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_essexite_essexite", "hades_tiles:floor_essexite_essexite",
		{cracky=2},
		{"hades_tiles_floor_essexite.png"},
		S("Essexite Tile Stair"),
		S("Outer Essexite Tile Stair"),
		S("Inner Essexite Tile Stair"),
		S("Essexite Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_essexitegold_essexitegold", "hades_tiles:floor_essexitegold_essexitegold",
		{cracky=2},
		{"hades_tiles_floor_essexitegold.png"},
		S("Golden Essexite Tile Stair"),
		S("Outer Golden Essexite Tile Stair"),
		S("Inner Golden Essexite Tile Stair"),
		S("Golden Essexite Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("floor_marble_marble", "hades_tiles:floor_marble_marble",
		{cracky=2},
		{"hades_tiles_floor_marble.png"},
		S("Marble Tile Stair"),
		S("Outer Marble Tile Stair"),
		S("Inner Marble Tile Stair"),
		S("Marble Tile Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_slab_with_double("floorblock_essexite_gold_block", "hades_core:floor_essexite_gold",
		{cracky=2},
		{"default_floor_essexite_gold.png", "default_floor_essexite_gold.png", "stairs_floorblock_essexite_gold_slab.png"},
		S("Golden Essexite Slab"),
		S("Double Golden Essexite Slab"),
		hades_sounds.node_sound_stone_defaults())
stairs.register_slab_with_double("floorblock_marble_essexite2", "hades_core:floor_marble_essexite2",
		{cracky=2},
		{"default_floor_marble_essexite2.png", "default_floor_marble_essexite2.png", "stairs_floorblock_marble_essexite2_slab.png"},
		S("Marble/Essexite Slab"),
		S("Double Marble/Essexite Slab"),
		hades_sounds.node_sound_stone_defaults())
stairs.register_slab_with_double("floorblock_bstone_sandstone", "hades_core:floor_bstone_sandstone",
		{cracky=3},
		{"default_floor_bstone_sandstone.png", "default_floor_bstone_sandstone.png", "stairs_floorblock_bstone_sandstone_slab.png"},
		S("Baked Stone/Sandstone Slab"),
		S("Double Baked Stone/Sandstone Slab"),
		hades_sounds.node_sound_stone_defaults())
stairs.register_slab_with_double("floorblock_chondrite_stone", "hades_core:floor_chondrite_stone",
		{cracky=2},
		{"default_floor_chondrite_stone.png", "default_floor_chondrite_stone.png", "stairs_floorblock_chondrite_stone_slab.png"},
		S("Chondrite/Stone Slab"),
		S("Double Chondrite/Stone Slab"),
		hades_sounds.node_sound_stone_defaults())
