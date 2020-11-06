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
function stairs.register_slab(subname, recipeitem, groups, images, description, sounds)
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
				local fakestack = ItemStack(recipeitem)
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
					local fakestack = ItemStack(recipeitem)
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

-- Nodes will be called stairs:{stair,slab}_<subname>
function stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_stair_out, desc_stair_in, desc_slab, sounds)
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
	stairs.register_stair(subname, recipeitem, groups, i_stair, desc_stair, sounds)
	stairs.register_stair_out(subname, recipeitem, groups, i_stair_out, desc_stair_out, sounds)
	stairs.register_stair_in(subname, recipeitem, groups, i_stair_in, desc_stair_in, sounds)
	stairs.register_slab(subname, recipeitem, groups, i_slab, desc_slab, sounds)
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
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_wood.png"},
		S("Common Wood Stair"),
		S("Outer Common Wood Stair"),
		S("Inner Common Wood Stair"),
		S("Common Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("pale_wood", "hades_trees:pale_wood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_pale_wood.png"},
		S("Pale Wood Stair"),
		S("Outer Pale Wood Stair"),
		S("Inner Pale Wood Stair"),
		S("Pale Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("birch_wood", "hades_trees:birch_wood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_birchwood.png"},
		S("Birch Wood Stair"),
		S("Outer Birch Wood Stair"),
		S("Inner Birch Wood Stair"),
		S("Birch Wood Slab"),
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
		S("Jungle Bark Stair"),
		S("Outer Jungle Bark Stair"),
		S("Inner Jungle Bark Stair"),
		S("Jungle Bark Slab"),
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

-- Colored Woods

stairs.register_stair_and_slab("colwood_black", "hades_trees:colwood_black",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_black.png"},
		S("Black Wood Stair"),
		S("Outer Black Wood Stair"),
		S("Inner Black Wood Stair"),
		S("Black Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_blue", "hades_trees:colwood_blue",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_blue.png"},
		S("Blue Wood Stair"),
		S("Outer Blue Wood Stair"),
		S("Inner Blue Wood Stair"),
		S("Blue Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_brown", "hades_trees:colwood_brown",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_brown.png"},
		S("Brown Wood Stair"),
		S("Outer Brown Wood Stair"),
		S("Inner Brown Wood Stair"),
		S("Brown Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_cyan", "hades_trees:colwood_cyan",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_cyan.png"},
		S("Cyan Wood Stair"),
		S("Outer Cyan Wood Stair"),
		S("Inner Cyan Wood Stair"),
		S("Cyan Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_dark_green", "hades_trees:colwood_dark_green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_dark_green.png"},
		S("Dark Green Wood Stair"),
		S("Outer Dark Green Wood Stair"),
		S("Inner Dark Green Wood Stair"),
		S("Dark Green Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_dark_grey", "hades_trees:colwood_dark_grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_dark_grey.png"},
		S("Dark Grey Wood Stair"),
		S("Outer Dark Grey Wood Stair"),
		S("Inner Dark Grey Wood Stair"),
		S("Dark Grey Wood Slab"),
		hades_sounds.node_sound_wood_defaults())	
		
stairs.register_stair_and_slab("colwood_green", "hades_trees:colwood_green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_green.png"},
		S("Green Wood Stair"),
		S("Outer Green Wood Stair"),
		S("Inner Green Wood Stair"),
		S("Green Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_grey", "hades_trees:colwood_grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_grey.png"},
		S("Grey Wood Stair"),
		S("Outer Grey Wood Stair"),
		S("Inner Grey Wood Stair"),
		S("Grey Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_magenta", "hades_trees:colwood_magenta",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_magenta.png"},
		S("Magenta Wood Stair"),
		S("Outer Magenta Wood Stair"),
		S("Inner Magenta Wood Stair"),
		S("Magenta Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_orange", "hades_trees:colwood_orange",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_orange.png"},
		S("Orange Wood Stair"),
		S("Outer Orange Wood Stair"),
		S("Inner Orange Wood Stair"),
		S("Orange Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_pink", "hades_trees:colwood_pink",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_pink.png"},
		S("Pink Wood Stair"),
		S("Outer Pink Wood Stair"),
		S("Inner Pink Wood Stair"),
		S("Pink Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_red", "hades_trees:colwood_red",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_red.png"},
		S("Red Wood Stair"),
		S("Outer Red Wood Stair"),
		S("Inner Red Wood Stair"),
		S("Red Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_violet", "hades_trees:colwood_violet",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_violet.png"},
		S("Violet Wood Stair"),
		S("Outer Violet Wood Stair"),
		S("Inner Violet Wood Stair"),
		S("Violet Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
	
stairs.register_stair_and_slab("colwood_white", "hades_trees:colwood_white",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_white.png"},
		S("White Wood Stair"),
		S("Outer White Wood Stair"),
		S("Inner White Wood Stair"),
		S("White Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_yellow", "hades_trees:colwood_yellow",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"hades_trees_colwood_yellow.png"},
		S("Yellow Wood Stair"),
		S("Outer Yellow Wood Stair"),
		S("Inner Yellow Wood Stair"),
		S("Yellow Wood Slab"),
		hades_sounds.node_sound_wood_defaults())
		
		--

local metals = {
	{"steel", S("Steel Stair"), S("Outer Steel Stair"), S("Inner Steel Stair"), S("Steel Slab")},
	{"copper", S("Copper Stair"), S("Outer Copper Stair"), S("Inner Copper Stair"), S("Copper Slab")},
	{"bronze", S("Bronze Stair"), S("Outer Bronze Stair"), S("Inner Bronze Stair"), S("Bronze Slab")},
	{"tin", S("Tin Stair"), S("Outer Tin Stair"), S("Inner Tin Stair"), S("Tin Slab")},
	{"gold", S("Gold Stair"), S("Outer Gold Stair"), S("Inner Gold Stair"), S("Gold Slab")},
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
		hades_sounds.node_sound_metal_defaults()
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
		{crumbly=2,cracky=2},
		{"default_sandstone.png"},
		S("Sandstone Stair"),
		S("Outer Sandstone Stair"),
		S("Inner Sandstone Stair"),
		S("Sandstone Slab"),
		hades_sounds.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("sandstonebrick", "hades_core:sandstonebrick",
		{crumbly=2,cracky=2},
		{"default_sandstone_brick.png"},
		S("Sandstone Brick Stair"),
		S("Outer Sandstone Brick Stair"),
		S("Inner Sandstone Brick Stair"),
		S("Sandstone Brick Slab"),
		hades_sounds.node_sound_stone_defaults())

stairs.register_stair_and_slab("jungle_wood", "hades_trees:jungle_wood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_junglewood.png"},
		S("Jungle Wood Stair"),
		S("Outer Jungle Wood Stair"),
		S("Innter Jungle Wood Stair"),
		S("Jungle Wood Slab"),
		hades_sounds.node_sound_wood_defaults())

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
		
stairs.register_stair_and_slab("straw", "farming:straw",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"farming_straw.png"},
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
