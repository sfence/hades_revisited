local S = minetest.get_translator("hades_trees")

minetest.register_node("hades_trees:apple", {
	description = S("Apple (+@1)", 2),
	drawtype = "plantlike",
	visual_scale = 0.75,
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {dig_immediate=3,flammable=2,leafdecay=3,leafdecay_drop=1,food=2,eatable=2},
	on_use = minetest.item_eat(2),
	sounds = hades_sounds.node_sound_leaves_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="hades_trees:apple", param2=1})
		end
	end,
})

minetest.register_node("hades_trees:sapling", {
	description = S("Common Tree Sapling"),
	_tt_help = S("Needs Dirt and light to grow"),
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling.png"},
	inventory_image = "default_sapling.png",
	wield_image = "default_sapling.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1, sapling=1},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_node("hades_trees:tree", {
	description = S("Common Tree Trunk"),
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.35,-0.5,-0.4,0.35,0.5,0.4},
			{-0.4,-0.5,-0.35, 0.4,0.5,0.35},
			{-0.25,-0.5,-0.45,0.25,0.5,0.45},
			{-0.45,-0.5,-0.25, 0.45,0.5,0.25},
			{-0.15,-0.5,-0.5,0.15,0.5,0.5},
			{-0.5,-0.5,-0.15, 0.5,0.5,0.15},
		},
	},
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = hades_sounds.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("hades_trees:leaves", {
	description = S("Common Leaves"),
	drawtype = "allfaces_optional",
	tiles = {"default_leaves.png"},
	paramtype = "light",
	waving = 1,
	is_ground_content = true,
	place_param2 = 1,
	groups = {snappy=3, leafdecay=3, flammable=2, leaves=1, porous=1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'hades_trees:sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'hades_trees:leaves'},
			}
		}
	},
	sounds = hades_sounds.node_sound_leaves_defaults(),
})

minetest.register_node("hades_trees:bark", {
	description = S("Common Bark"),
	paramtype2 = "facedir",
	tiles = { "default_tree.png" },
	is_ground_content = false,
	groups = { choppy = 3, oddly_breakable_by_hand = 1, flammable = 2 },
	sounds = hades_sounds.node_sound_wood_defaults(),
})

local c_air = minetest.get_content_id("air")
local c_ignore = minetest.get_content_id("ignore")
local c_tree = minetest.get_content_id("hades_trees:tree")
local c_leaves = minetest.get_content_id("hades_trees:leaves")
local c_apple = minetest.get_content_id("hades_trees:apple")

function hades_trees.grow_apple_tree(data, a, pos, is_apple_tree, seed)
        local pr = PseudoRandom(seed)
        local th = pr:next(4, 6)
        local x, y, z = pos.x, pos.y, pos.z
        for yy = y, y+th-1 do
                local vi = a:index(x, yy, z)
                if a:contains(x, yy, z) and (data[vi] == c_air or yy == y) then
                        data[vi] = c_tree
                end
        end
        y = y+th-1 -- (x, y, z) is now last piece of trunk
        local leaves_a = VoxelArea:new{MinEdge={x=-2, y=-2, z=-2}, MaxEdge={x=2, y=2, z=2}}
        local leaves_buffer = {}
        
        -- Force leaves near the trunk
        local d = 1
        for xi = -d, d do
        for yi = -d, d do
        for zi = -d, d do
                leaves_buffer[leaves_a:index(xi, yi, zi)] = true
        end
        end
        end
        
        -- Add leaves randomly
        for iii = 1, 8 do
                local d = 1
                local xx = pr:next(leaves_a.MinEdge.x, leaves_a.MaxEdge.x - d)
                local yy = pr:next(leaves_a.MinEdge.y, leaves_a.MaxEdge.y - d)
                local zz = pr:next(leaves_a.MinEdge.z, leaves_a.MaxEdge.z - d)
                
                for xi = 0, d do
                for yi = 0, d do
                for zi = 0, d do
                        leaves_buffer[leaves_a:index(xx+xi, yy+yi, zz+zi)] = true
                end
                end
                end
        end
        
        -- Add the leaves
        for xi = leaves_a.MinEdge.x, leaves_a.MaxEdge.x do
        for yi = leaves_a.MinEdge.y, leaves_a.MaxEdge.y do
        for zi = leaves_a.MinEdge.z, leaves_a.MaxEdge.z do
                if a:contains(x+xi, y+yi, z+zi) then
                        local vi = a:index(x+xi, y+yi, z+zi)
                        if data[vi] == c_air or data[vi] == c_ignore then
                                if leaves_buffer[leaves_a:index(xi, yi, zi)] then
                                        if pr:next(1, 100) <=  3 then -- is_apple_tree and(zwischen if und pr:next)
                                                data[vi] = c_apple
                                        else
                                                data[vi] = c_leaves
                                        end
                                end
                        end
                end
        end
        end
        end
end

minetest.register_abm({
	label = "Grow sapling to apple tree",
	nodenames = {"hades_trees:sapling"},
	interval = 20,
	chance = 50,
	action = function(pos, node)
		local nu =  minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local is_soil = minetest.get_item_group(nu, "soil")
		if is_soil == 0 then
			return
		end


		minetest.log("action", "[hades_trees] A sapling grows into an apple tree at "..minetest.pos_to_string(pos))
		local vm = minetest.get_voxel_manip()
		local minp, maxp = vm:read_from_map({x=pos.x-16, y=pos.y, z=pos.z-16}, {x=pos.x+16, y=pos.y+16, z=pos.z+16})
		local a = VoxelArea:new{MinEdge=minp, MaxEdge=maxp}
		local data = vm:get_data()
		hades_trees.grow_apple_tree(data, a, pos, math.random(1, 4) == 1, math.random(1,100000))
		vm:set_data(data)
		vm:write_to_map(data)
		vm:update_map()
	end
})

