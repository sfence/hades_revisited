-- Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.

stairs = {}

-- Node will be called stairs:stair_<subname>
function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
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

			local placer_pos = placer:getpos()
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

	-- for replace ABM
	minetest.register_node(":stairs:stair_" .. subname.."upside_down", {
		replace_name = "stairs:stair_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- Flipped recipe for the silly minecrafters
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
function stairs.register_stair_out(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:stair_out_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
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

			local placer_pos = placer:getpos()
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

	-- for replace ABM
	minetest.register_node(":stairs:stair_out_" .. subname.."upside_down", {
		replace_name = "stairs:stair_out_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'stairs:stair_out_' .. subname .. ' 5',
		recipe = {
			{"", "", recipeitem},
			{"", "", recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:stair_in_<subname>
function stairs.register_stair_in(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:stair_in_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
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

			local placer_pos = placer:getpos()
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

	-- for replace ABM
	minetest.register_node(":stairs:stair_in_" .. subname.."upside_down", {
		replace_name = "stairs:stair_in_" .. subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'stairs:stair_in_' .. subname .. ' 5',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, "", ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Node will be called stairs:slab_<subname>
function stairs.register_slab(subname, recipeitem, groups, images, description, sounds)
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
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

	-- for replace ABM
	minetest.register_node(":stairs:slab_" .. subname.."upside_down", {
		replace_name = "stairs:slab_"..subname,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'stairs:slab_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})
end

-- Replace old "upside_down" nodes with new param2 versions
minetest.register_abm({
	nodenames = {"group:slabs_replace"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		node.name = minetest.registered_nodes[node.name].replace_name
		node.param2 = node.param2 + 20
		if node.param2 == 21 then
			node.param2 = 23
		elseif node.param2 == 23 then
			node.param2 = 21
		end
		minetest.set_node(pos, node)
	end,
})

-- Nodes will be called stairs:{stair,slab}_<subname>
function stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_stair_out, desc_stair_in, desc_slab, sounds)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_stair_out(subname, recipeitem, groups, images, desc_stair_out, sounds)
	stairs.register_stair_in(subname, recipeitem, groups, images, desc_stair_in, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end

stairs.register_stair_and_slab("wood", "default:wood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_wood.png"},
		"Common Wood Stair",
		"Outer Common Wood Stair",
		"Inner Common Wood Stair",
		"Common Wood Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("palewood", "default:palewood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_palewood.png"},
		"Pale Wood Stair",
		"Outer Pale Wood Stair",
		"Inner Pale Wood Stair",
		"Pale Wood Slab",
		default.node_sound_wood_defaults())		

-- Barks

stairs.register_stair_and_slab("bark", "default:bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"default_tree.png"},
		"Common Bark Stair",
		"Outer Common Bark Stair",
		"Inner Common Bark Stair",
		"Common Bark Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("jungle_bark", "default:jungle_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"default_jungletree.png"},
		"Jungle Bark Stair",
		"Outer Jungle Bark Stair",
		"Inner Jungle Bark Stair",
		"Jungle Bark Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("pale_bark", "default:pale_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"default_paletree.png"},
		"Pale Bark Stair",
		"Outer Pale Bark Stair",
		"Inner Pale Bark Stair",
		"Pale Bark Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("birch_bark", "default:birch_bark",
		{choppy=3,oddly_breakable_by_hand=1,flammable=3},
		{"default_tree_birch.png"},
		"Birch Bark Stair",
		"Outer Birch Bark Stair",
		"Inner Birch Bark Stair",
		"Birch Bark Slab",
		default.node_sound_wood_defaults())

-- Colored Woods

stairs.register_stair_and_slab("colwood_black", "default:colwood_black",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_black.png"},
		"Black Wood Stair",
		"Outer Black Wood Stair",
		"Inner Black Wood Stair",
		"Black Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_blue", "default:colwood_blue",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_blue.png"},
		"Blue Wood Stair",
		"Outer Blue Wood Stair",
		"Inner Blue Wood Stair",
		"Blue Wood Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("colwood_brown", "default:colwood_brown",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_brown.png"},
		"Brown Wood Stair",
		"Outer Brown Wood Stair",
		"Inner Brown Wood Stair",
		"Brown Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_cyan", "default:colwood_cyan",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_cyan.png"},
		"Cyan Wood Stair",
		"Outer Cyan Wood Stair",
		"Inner Cyan Wood Stair",
		"Cyan Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_dark_green", "default:colwood_dark_green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_dark_green.png"},
		"Dark Green Wood Stair",
		"Outer Dark Green Wood Stair",
		"Inner Dark Green Wood Stair",
		"Dark Green Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_dark_grey", "default:colwood_dark_grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_dark_grey.png"},
		"Dark Grey Wood Stair",
		"Outer Dark Grey Wood Stair",
		"Inner Dark Grey Wood Stair",
		"Dark Grey Wood Slab",
		default.node_sound_wood_defaults())	
		
stairs.register_stair_and_slab("colwood_green", "default:colwood_green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_green.png"},
		"Green Wood Stair",
		"Outer Green Wood Stair",
		"Inner Green Wood Stair",
		"Green Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_grey", "default:colwood_grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_grey.png"},
		"Grey Wood Stair",
		"Outer Grey Wood Stair",
		"Inner Grey Wood Stair",
		"Grey Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_magenta", "default:colwood_magenta",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_magenta.png"},
		"Magenta Wood Stair",
		"Outer Magenta Wood Stair",
		"Inner Magenta Wood Stair",
		"Magenta Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_orange", "default:colwood_orange",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_orange.png"},
		"Orange Wood Stair",
		"Outer Orange Wood Stair",
		"Inner Orange Wood Stair",
		"Orange Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_pink", "default:colwood_pink",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_pink.png"},
		"Pink Wood Stair",
		"Outer Pink Wood Stair",
		"Inner Pink Wood Stair",
		"Pink Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_red", "default:colwood_red",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_red.png"},
		"Red Wood Stair",
		"Outer Red Wood Stair",
		"Inner Red Wood Stair",
		"Red Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_violet", "default:colwood_violet",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_violet.png"},
		"Violet Wood Stair",
		"Outer Violet Wood Stair",
		"Inner Violet Wood Stair",
		"Violet Wood Slab",
		default.node_sound_wood_defaults())
	
stairs.register_stair_and_slab("colwood_white", "default:colwood_white",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_white.png"},
		"White Wood Stair",
		"Outer White Wood Stair",
		"Inner White Wood Stair",
		"White Wood Slab",
		default.node_sound_wood_defaults())
		
stairs.register_stair_and_slab("colwood_yellow", "default:colwood_yellow",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_colwood_yellow.png"},
		"Yellow Wood Stair",
		"Outer Yellow Wood Stair",
		"Inner Yellow Wood Stair",
		"Yellow Wood Slab",
		default.node_sound_wood_defaults())
		
		--		
stairs.register_stair_and_slab("steelblock", "default:steelblock",
		{cracky=1,level=2},
		{"default_steel_block.png"},
		"Steel Block Stair",
		"Outer Steel Block Stair",
		"Inner Steel Block Stair",
		"Steel Block Slab",
		default.node_sound_metal_defaults())

stairs.register_stair_and_slab("copperblock", "default:copperblock",
		{cracky=1,level=2},
		{"default_copper_block.png"},
		"Copper Block Stair",
		"Outer Copper Block Stair",
		"Inner Copper Block Stair",
		"Copper Block Slab",
		default.node_sound_metal_defaults())

stairs.register_stair_and_slab("bronzeblock", "default:bronzeblock",
		{cracky=1,level=2},
		{"default_bronze_block.png"},
		"Bronze Block Stair",
		"Outer Bronze Block Stair",
		"Inner Bronze Block Stair",
		"Bronze Block Slab",
		default.node_sound_metal_defaults())

stairs.register_stair_and_slab("goldblock", "default:goldblock",
		{cracky=1},
		{"default_gold_block.png"},
		"Gold Block Stair",
		"Outer Gold Block Stair",
		"Inner Gold Block Stair",
		"Gold Block Slab",
		default.node_sound_metal_defaults())

stairs.register_stair_and_slab("stone", "default:stone",
		{cracky=3},
		{"default_stone.png"},
		"Stone Stair",
		"Outer Stone Stair",
		"Inner Stone Stair",
		"Stone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("desert_stonebrick", "default:desert_stonebrick",
		{cracky=3},
		{"default_desert_stone_brick.png"},
		"Burned Stone Brick Stair",
		"Outer Burned Stone Brick Stair",
		"Inner Burned Stone Brick Stair",
		"Burned Stone Brick Slab",
		default.node_sound_stone_defaults())	

stairs.register_stair_and_slab("desert_stone", "default:desert_stone",
		{cracky=3},
		{"default_desert_stone.png"},
		"Burned Stone Stair",
		"Outer Burned Stone Stair",
		"Inner Burned Stone Stair",
		"Burned Stone Slab",
		default.node_sound_stone_defaults())		
		
stairs.register_stair_and_slab("cobble", "default:cobble",
		{cracky=3},
		{"default_cobble.png"},
		"Cobblestone Stair",
		"Outer Cobblestone Stair",
		"Inner Cobblestone Stair",
		"Cobblestone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("cobble_baked", "default:cobble_baked",
		{cracky=3},
		{"default_cobble_baked.png"},
		"Burned Cobblestone Stair",
		"Outer Burned Cobblestone Stair",
		"Inner Burned Cobblestone Stair",
		"Burned Cobblestone Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick", "default:brick",
		{cracky=3},
		{"default_brick.png"},
		"Uncolored Brick Stair",
		"Outer Uncolored Brick Stair",
		"Inner Uncolored Brick Stair",
		"Uncolored Brick Slab",
		default.node_sound_stone_defaults())
		
-- Colors... too mutch ColOrs...  EvErYwhere

stairs.register_stair_and_slab("brick_black", "default:brick_black",
		{cracky=3},
		{"default_brick_black.png"},
		"Black Brick Stair",
		"Outer Black Brick Stair",
		"Inner Black Brick Stair",
		"Black Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_blue", "default:brick_blue",
		{cracky=3},
		{"default_brick_blue.png"},
		"Blue Brick Stair",
		"Outer Blue Brick Stair",
		"Inner Blue Brick Stair",
		"Blue Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_brown", "default:brick_brown",
		{cracky=3},
		{"default_brick_brown.png"},
		"Brown Brick Stair",
		"Outer Brown Brick Stair",
		"Inner Brown Brick Stair",
		"Brown Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_cyan", "default:brick_cyan",
		{cracky=3},
		{"default_brick_cyan.png"},
		"Cyan Brick Stair",
		"Outer Cyan Brick Stair",
		"Inner Cyan Brick Stair",
		"Cyan Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_dark_green", "default:brick_dark_green",
		{cracky=3},
		{"default_brick_dark_green.png"},
		"Dark Green Brick Stair",
		"Outer Dark Green Brick Stair",
		"Inner Dark Green Brick Stair",
		"Dark Green Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_dark_grey", "default:brick_dark_grey",
		{cracky=3},
		{"default_brick_dark_grey.png"},
		"Dark Grey Brick Stair",
		"Outer Dark Grey Brick Stair",
		"Inner Dark Grey Brick Stair",
		"Dark Grey Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_green", "default:brick_green",
		{cracky=3},
		{"default_brick_green.png"},
		"Green Brick Stair",
		"Outer Green Brick Stair",
		"Inner Green Brick Stair",
		"Green Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_grey", "default:brick_grey",
		{cracky=3},
		{"default_brick_grey.png"},
		"Grey Brick Stair",
		"Outer Grey Brick Stair",
		"Inner Grey Brick Stair",
		"Grey Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_magenta", "default:brick_magenta",
		{cracky=3},
		{"default_brick_magenta.png"},
		"Magenta Brick Stair",
		"Outer Magenta Brick Stair",
		"Inner Magenta Brick Stair",
		"Magenta Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_orange", "default:brick_orange",
		{cracky=3},
		{"default_brick_orange.png"},
		"Orange Brick Stair",
		"Outer Orange Brick Stair",
		"Inner Orange Brick Stair",
		"Orange Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("brick_pink", "default:brick_pink",
		{cracky=3},
		{"default_brick_pink.png"},
		"Pink Brick Stair",
		"Outer Pink Brick Stair",
		"Inner Pink Brick Stair",
		"Pink Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_red", "default:brick_red",
		{cracky=3},
		{"default_brick_red.png"},
		"Red Brick Stair",
		"Outer Red Brick Stair",
		"Inner Red Brick Stair",
		"Red Brick Slab",
		default.node_sound_stone_defaults())		

stairs.register_stair_and_slab("brick_violet", "default:brick_violet",
		{cracky=3},
		{"default_brick_violet.png"},
		"Violet Brick Stair",
		"Outer Violet Brick Stair",
		"Inner Violet Brick Stair",
		"Violet Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_white", "default:brick_white",
		{cracky=3},
		{"default_brick_white.png"},
		"White Brick Stair",
		"Outer White Brick Stair",
		"Inner White Brick Stair",
		"White Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("brick_yellow", "default:brick_yellow",
		{cracky=3},
		{"default_brick_yellow.png"},
		"Yellow Brick Stair",
		"Outer Yellow Brick Stair",
		"Inner Yellow Brick Stair",
		"Yellow Brick Slab",
		default.node_sound_stone_defaults())		
		
	
stairs.register_stair_and_slab("sandstone", "default:sandstone",
		{crumbly=2,cracky=2},
		{"default_sandstone.png"},
		"Sandstone Stair",
		"Outer Sandstone Stair",
		"Inner Sandstone Stair",
		"Sandstone Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("sandstonebrick", "default:sandstonebrick",
		{crumbly=2,cracky=2},
		{"default_sandstone_brick.png"},
		"Sandstone Brick Stair",
		"Outer Sandstone Brick Stair",
		"Inner Sandstone Brick Stair",
		"Sandstone Brick Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("junglewood", "default:junglewood",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"default_junglewood.png"},
		"Jungle Wood Stair",
		"Outer Jungle Wood Stair",
		"Innter Jungle Wood Stair",
		"Jungle Wood Slab",
		default.node_sound_wood_defaults())

stairs.register_stair_and_slab("stonebrick", "default:stonebrick",
		{cracky=3},
		{"default_stone_brick.png"},
		"Stone Brick Stair",
		"Outer Stone Brick Stair",
		"Inner Stone Brick Stair",
		"Stone Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("chondrit_brick", "default:chondrit_brick",
		{cracky=2},
		{"default_chondrit_brick.png"},
		"Chondrite Brick Stair",
		"Outer Chondrite Brick Stair",
		"Inner Chondrite Brick Stair",
		"Chondrite Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("chondrit", "default:chondrit",
		{cracky=2},
		{"default_chondrit.png"},
		"Chondrite Stair",
		"Outer Chondrite Stair",
		"Inner Chondrite Stair",
		"Chondrite Slab",
		default.node_sound_stone_defaults())

stairs.register_stair_and_slab("marble_brick", "default:marble_brick",
		{cracky=3},
		{"default_marble_brick.png"},
		"Marble Brick Stair",
		"Outer Marble Brick Stair",
		"Inner Marble Brick Stair",
		"Marble Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("marble", "default:marble",
		{cracky=3},
		{"default_marble.png"},
		"Marble Stair",
		"Outer Marble Stair",
		"Inner Marble Stair",
		"Marble Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("tuff_brick", "default:tuff_brick",
		{cracky=3},
		{"default_tuff_brick.png"},
		"Tuff Brick Stair",
		"Outer Tuff Brick Stair",
		"Inner Tuff Brick Stair",
		"Tuff Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("tuff", "default:tuff",
		{cracky=3},
		{"default_tuff.png"},
		"Tuff Stair",
		"Outer Tuff Stair",
		"Inner Tuff Stair",
		"Tuff Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("tuff_baked_brick", "default:tuff_baked_brick",
		{cracky=3},
		{"default_tuff_baked_brick.png"},
		"Burned Tuff Brick Stair",
		"Outer Burned Tuff Brick Stair",
		"Inner Burned Tuff Brick Stair",
		"Burned Tuff Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("tuff_baked", "default:tuff_baked",
		{cracky=3},
		{"default_tuff_baked.png"},
		"Burned Tuff Stair",
		"Outer Burned Tuff Stair",
		"Inner Burned Tuff Stair",
		"Burned Tuff Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("essexit_brick", "default:essexit_brick",
		{cracky=1},
		{"default_essexit_brick.png"},
		"Essexite Brick Stair",
		"Outer Essexite Brick Stair",
		"Inner Essexite Brick Stair",
		"Essexite Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("essexit", "default:essexit",
		{cracky=1},
		{"default_essexit.png"},
		"Essexite Stair",
		"Outer Essexite Stair",
		"Inner Essexite Stair",
		"Essexite Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("rusty_block", "columnia:rusty_block",
		{cracky=1},
		{"columnia_rusty_block.png"},
		"Rusty Stair",
		"Outer Rusty Stair",
		"Inner Rusty Stair",
		"Rusty Slab",
		default.node_sound_metal_defaults())
		
stairs.register_stair_and_slab("cactus_brick", "default:cactus_brick",
		{cracky=1},
		{"default_cactus_brick.png"},
		"Cactus Brick Stair",
		"Outer Cactus Brick Stair",
		"Inner Cactus Brick Stair",
		"Cactus Brick Slab",
		default.node_sound_wood_defaults())	
		
stairs.register_stair_and_slab("obsidianbrick", "default:obsidianbrick",
		{cracky=1},
		{"default_obsidian_brick.png"},
		"Obsidian Brick Stair",
		"Outer Obsidian Brick Stair",
		"Inner Obsidian Brick Stair",
		"Obsidian Brick Slab",
		default.node_sound_stone_defaults())
		
stairs.register_stair_and_slab("straw", "farming:straw",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"farming_straw.png"},
		"Straw Stair",
		"Outer Straw Stair",
		"Inner Straw Stair",
		"Straw Slab",
		default.node_sound_leaves_defaults())
		
--wool

stairs.register_stair_and_slab("white", "wool:white",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_white.png"},
		"White Wool Stair",
		"Outer White Wool Stair",
		"Inner White Wool Stair",
		"White Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("grey", "wool:grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_grey.png"},
		"Grey Wool Stair",
		"Outer Grey Wool Stair",
		"Inner Grey Wool Stair",
		"Grey Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("black", "wool:black",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_black.png"},
		"Black Wool Stair",
		"Outer Black Wool Stair",
		"Inner Black Wool Stair",
		"Black Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("red", "wool:red",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_red.png"},
		"Red Wool Stair",
		"Outer Red Wool Stair",
		"Inner Red Wool Stair",
		"Red Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("yellow", "wool:yellow",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_yellow.png"},
		"Yellow Wool Stair",
		"Outer Yellow Wool Stair",
		"Inner Yellow Wool Stair",
		"Yellow Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("green", "wool:green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_green.png"},
		"Green Wool Stair",
		"Outer Green Wool Stair",
		"Inner Green Wool Stair",
		"Green Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("cyan", "wool:cyan",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_cyan.png"},
		"Cyan Wool Stair",
		"Outer Cyan Wool Stair",
		"Inner Cyan Wool Stair",
		"Cyan Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("blue", "wool:blue",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_blue.png"},
		"Blue Wool Stair",
		"Outer Blue Wool Stair",
		"Inner Blue Wool Stair",
		"Blue Wool Slab",
		default.node_sound_leaves_defaults())

stairs.register_stair_and_slab("magenta", "wool:magenta",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_magenta.png"},
		"Magenta Wool Stair",
		"Outer Magenta Wool Stair",
		"Inner Magenta Wool Stair",
		"Magenta Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("orange", "wool:orange",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_orange.png"},
		"Orange Wool Stair",
		"Outer Orange Wool Stair",
		"Inner Orange Wool Stair",
		"Orange Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("violet", "wool:violet",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_violet.png"},
		"Violet Wool Stair",
		"Outer Violet Wool Stair",
		"Inner Violet Wool Stair",
		"Violet Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("brown", "wool:brown",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_brown.png"},
		"Brown Wool Stair",
		"Outer Brown Wool Stair",
		"Inner Brown Wool Stair",
		"Brown Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("pink", "wool:pink",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_pink.png"},
		"Pink Wool Stair",
		"Outer Pink Wool Stair",
		"Inner Pink Wool Stair",
		"Pink Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("dark_grey", "wool:dark_grey",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_dark_grey.png"},
		"Dark Grey Wool Stair",
		"Outer Dark Grey Wool Stair",
		"Inner Dark Grey Wool Stair",
		"Dark Grey Wool Slab",
		default.node_sound_leaves_defaults())
		
stairs.register_stair_and_slab("dark_green", "wool:dark_green",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		{"wool_dark_green.png"},
		"Dark Green Wool Stair",
		"Outer Dark Green Wool Stair",
		"Inner Dark Green Wool Stair",
		"Dark Green Wool Slab",
		default.node_sound_leaves_defaults())


-- Glowing crystal

-- Node will be called stairs:stair_<subname>

	minetest.register_node("stairs:stair_glowcrystal_block", {
		description = "Glowing Stair",
		drawtype = "nodebox",
		tiles = {"default_block_glowcrystal.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
	    light_source = 14,
		is_ground_content = false,
		groups = {crumbly=2,cracky=2, glowing=1},
		sounds = default.node_sound_stone_defaults(),
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

			local placer_pos = placer:getpos()
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

	-- for replace ABM
	minetest.register_node("stairs:stair_glowcrystal_block_upside_down", {
		replace_name = "stairs:stair_glowcrystal_block" ,
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'stairs:stair_glowcrystal_block 6',
		recipe = {
			{"glowcrystals:glowcrystal_block", "", ""},
			{"glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block", ""},
			{"glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block"},
		},
	})

	-- Flipped recipe for the silly minecrafters
	minetest.register_craft({
		output = 'stairs:stair_glowcrystal_block 6',
		recipe = {
			{"", "", "glowcrystals:glowcrystal_block"},
			{"", "glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block"},
			{"glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block"},
		},
	})


-- Node will be called stairs:stair_out_<subname>
	minetest.register_node("stairs:stair_out_glowcrystal_block", {
		description = "Outer Glowing Stair",
		drawtype = "nodebox",
		tiles = {"glowcrystals_block_glowcrystal.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
	    light_source = 14,
		is_ground_content = false,
		groups = {crumbly=2,cracky=2, glowing=1},
		sounds = default.node_sound_stone_defaults(),
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

			local placer_pos = placer:getpos()
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

	-- for replace ABM
	minetest.register_node("stairs:stair_out_glowcrystal_block_upside_down", {
		replace_name = "stairs:stair_out_glowcrystal_block",
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'stairs:stair_out_glowcrystal_block 5',
		recipe = {
			{"", "", "glowcrystals:glowcrystal_block"},
			{"", "", "glowcrystals:glowcrystal_block"},
			{"glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block"},
		},
	})

-- Node will be called stairs:stair_in_<subname>
	minetest.register_node("stairs:stair_in_glowcrystal_block", {
		description = "Inner Glowing Stair",
		drawtype = "nodebox",
		tiles = {"glowcrystals_block_glowcrystal.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
	    light_source = 14,
		is_ground_content = false,
		groups = {crumbly=2,cracky=2, glowing=1},
		sounds = default.node_sound_stone_defaults(),
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

			local placer_pos = placer:getpos()
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

	-- for replace ABM
	minetest.register_node("stairs:stair_in_glowcrystal_block_upside_down", {
		replace_name = "stairs:stair_in_glowcrystal_block",
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'stairs:stair_in_glowcrystal_block 5',
		recipe = {
			{"glowcrystals:glowcrystal_block", "", ""},
			{"glowcrystals:glowcrystal_block", "", ""},
			{"glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block"},
		},
	})


-- Node will be called stairs:slab_<subname>

	minetest.register_node("stairs:slab_glowcrystal_block", {
		description = "Glowing Slab",
		drawtype = "nodebox",
		tiles = {"glowcrystals_block_glowcrystal.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
	    light_source = 14,
		is_ground_content = false,
		groups = {crumbly=2,cracky=2, glowing=1},
		sounds = default.node_sound_stone_defaults(),
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

			local n0_is_upside_down = (n0.name == "stairs:slab_glowcrystal_block" and
					n0.param2 >= 20)

			if n0.name == "stairs:slab_glowcrystal_block" and not n0_is_upside_down and p0.y+1 == p1.y then
				slabpos = p0
				slabnode = n0
			elseif n1.name == "stairs:slab_glowcrystal_block" then
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
					local fakestack = ItemStack("glowcrystals:glowcrystal_block")
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

	-- for replace ABM
	minetest.register_node("stairs:slab_glowcrystal_block_upside_down", {
		replace_name = "stairs:slab_glowcrystal_block",
		groups = {slabs_replace=1},
	})

	minetest.register_craft({
		output = 'stairs:slab_glowcrystal_block 6',
		recipe = {
			{"glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block", "glowcrystals:glowcrystal_block"},
		},
	})

		
