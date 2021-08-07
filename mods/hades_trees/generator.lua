local pr_a, pr_j -- PseudoRandom vars

local DEFAULT_UNDERGROUND = {
	"hades_core:dirt",
	"hades_core:dirt_with_grass_l1",
	"hades_core:dirt_with_grass_l2",
	"hades_core:dirt_with_grass_l3",
	"hades_core:dirt_with_grass"}
local DEFAULT_MIN_LIGHT

function hades_trees.grow_sapling(pos, check_light)
	local node = minetest.get_node(pos, check_light)
	local trunk, leaves, replacement
	-- Grow tree charred if sapling was close to lava
	local lava = minetest.find_node_near(pos, 1, "group:lava")
	if lava then
		trunk = "hades_trees:charred_tree"
		leaves = "hades_trees:burned_branches"
		replacement = {}
	end
	if node.name == "hades_trees:sapling" then
		hades_trees.generate_appletree(pos, check_light, trunk, leaves, nil, replacement)
	elseif node.name == "hades_trees:jungle_sapling" then
		hades_trees.generate_jungletree(pos, check_light, trunk, leaves)
	elseif node.name == "hades_trees:cultivated_jungle_sapling" then
		hades_trees.generate_cjtree(pos, check_light, trunk, leaves)
	elseif node.name == "hades_trees:olive_sapling" then
		hades_trees.generate_olivetree(pos, check_light, trunk, leaves, nil, replacement)
	elseif node.name == "hades_trees:birch_sapling" then
		hades_trees.generate_birchtree(pos, check_light, trunk, leaves)
	elseif node.name == "hades_trees:pale_sapling" then
		hades_trees.generate_paletree(pos, check_light, trunk, leaves, nil, replacement)
	elseif node.name == "hades_trees:banana_sapling" then
		hades_trees.generate_bananatree(pos, check_light, trunk, leaves, nil, replacement)
	elseif node.name == "hades_trees:orange_sapling" then
		hades_trees.generate_orangetree(pos, check_light, trunk, leaves, nil, replacement)
	elseif node.name == "hades_trees:cocoa_sapling" then
		hades_trees.generate_cocoatree(pos, check_light, trunk, leaves, nil, replacement)
	elseif node.name == "hades_trees:coconut_sapling" then
		hades_trees.generate_coconutpalm(pos, check_light, trunk, leaves, nil, replacement)
	elseif node.name == "hades_trees:canvas_sapling" then
		hades_trees.generate_canvastree(pos, check_light, trunk, leaves)
	end
end

local function check_node_light(pos, minlight, check)
	if check == false then
		return true
	end
	local l = minetest.get_node_light(pos)
	if not l or l < minlight then
		return false
	end
	return true
end

-- Apple Tree
function hades_trees.generate_tree(pos, check_light, trunk, leaves, underground, replacements)
	if not trunk then
		trunk = "hades_trees:tree"
	end
	if not leaves then
		leaves = "hades_trees:leaves"
	end
	if not underground then
		underground = DEFAULT_UNDERGROUND
	end
	pos.y = pos.y-1
	local nodename = minetest.get_node(pos).name
	local ret = false
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = true
			break
		end
	end
	if not ret then
		return
	end
	pos.y = pos.y+1
	if not check_node_light(pos, 8, check_light) then
		return
	end

	local node = {name = ""}
	for dy=1,3 do
		pos.y = pos.y+dy
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y-dy
	end
	node.name = trunk
	for dy=0,3 do
		pos.y = pos.y+dy
		minetest.set_node(pos, node)
		pos.y = pos.y-dy
	end


	if not replacements then
		replacements = {}
	end


	node.name = leaves
	pos.y = pos.y+4
	for dx=-2,2 do
		for dz=-2,2 do
			for dy=-1,2 do
				pos.x = pos.x+dx
				pos.y = pos.y+dy
				pos.z = pos.z+dz


				if dx == 0 and dz == 0 and dy==3 then
					if minetest.get_node(pos).name == "air" and math.random(1, 6) <= 4 then
						minetest.set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
							end
						end
					end
				elseif dx == 0 and dz == 0 and dy==4 then
					if minetest.get_node(pos).name == "air" and math.random(1, 6) <= 4 then
						minetest.set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
							end
						end
					end
				elseif math.abs(dx) ~= 2 and math.abs(dz) ~= 2 then
					if minetest.get_node(pos).name == "air" then
						minetest.set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
							end
						end
					end
				else
					if math.abs(dx) ~= 2 or math.abs(dz) ~= 2 then
						if minetest.get_node(pos).name == "air" and math.random(1, 6) <= 4 then
							minetest.set_node(pos, node)
							for name,rarity in pairs(replacements) do
								if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
								end
							end
						end
					end
				end


				pos.x = pos.x-dx
				pos.y = pos.y-dy
				pos.z = pos.z-dz
			end
		end
	end
end

-- Olive Tree
function hades_trees.generate_olivetree(pos, check_light, trunk, leaves, underground, replacements)
	if not trunk then
		trunk = "hades_trees:tree"
	end
	if not leaves then
		leaves = "hades_trees:olive_leaves"
	end
	if not underground then
		underground = DEFAULT_UNDERGROUND
	end
	if not replacements then
		replacements = {["hades_trees:olive"]=10}
	end
	hades_trees.generate_tree(pos, check_light, trunk, leaves, underground, replacements)
end

-- Orange Tree
function hades_trees.generate_orangetree(pos, check_light, trunk, leaves, underground, replacements)
	if not trunk then
		trunk = "hades_trees:orange_tree"
	end
	if not leaves then
		leaves = "hades_trees:orange_leaves"
	end
	if not underground then
		underground = DEFAULT_UNDERGROUND
	end
	if not replacements then
		replacements = {["hades_trees:orange"]=20}
	end
	hades_trees.generate_tree(pos, check_light, trunk, leaves, underground, replacements)
end

-- Cocoa Tree
-- TODO: Customize cocoa tree
function hades_trees.generate_cocoatree(pos, check_light, trunk, leaves, underground, replacements)
	if not trunk then
		trunk = "hades_trees:jungle_tree"
	end
	if not leaves then
		leaves = "hades_trees:jungle_leaves"
	end
	if not underground then
		underground = DEFAULT_UNDERGROUND
	end
	if not replacements then
		replacements = {["hades_trees:cocoa_pod"]=12}
	end
	hades_trees.generate_tree(pos, check_light, trunk, leaves, underground, replacements)
end

-- Coconut Palm
function hades_trees.generate_coconutpalm(pos, check_light, trunk, leaves, underground, replacements)
	if not trunk then
		trunk = "hades_trees:tree"
	end
	if not leaves then
		leaves = "hades_trees:jungle_leaves"
	end
	if not underground then
		underground = DEFAULT_UNDERGROUND
	end
	if not replacements then
		replacements = {["hades_trees:coconut"]=20}
	end
	hades_trees.generate_tree(pos, check_light, trunk, leaves, underground, replacements)
end

--[[
Generate a tree with a cuboid shape.

pos: Position of tree base
check_light: whether to check light
trunk: tree trunk node name (optional)
leaves: leaves node name (optional)
replacement: {
	name = --node name of node to replace leaves,
	chance = -- 1 divided by this is the chance to replace leaves,
}
underground: List of node names on which this tree can grow

config:
* min_light: min light level to grow
* trunk_height: height of trunk nodes
* leaves_start_height: height above base at which leaves appear
* leaves_height: total height of leaves
* leaves_outwards: how much leaves spread on the X/Z plane
* leaves_chance_denominator: chance of a leaves node to generate is this devided by the number below
* leaves_chance_numerator: chance of a leaves node to generate is the number above divided by this
]]

function hades_trees.generate_cuboid_tree(pos, check_light, trunk, leaves, underground, replacement, config)
	if not trunk then
		trunk = "hades_trees:tree"
	end
	if not leaves then
		leaves = "hades_trees:leaves"
	end
	if not underground then
		underground = table.copy(DEFAULT_UNDERGROUND)
	end
	if not config then
		config = {}
	end
	if not config.min_light then
		config.min_light = 8
	end

	pos.y = pos.y-1
	-- Check underground
	local nodename = minetest.get_node(pos).name
	local ret = false
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = true
			break
		end
	end
	if not ret then
		return
	end

	-- Check light
	pos.y = pos.y+1
	if not check_node_light(pos, config.min_light, check_light) then
		return
	end

	-- Check if enough space to grow
	local node = {name = ""}
	for dy=1,config.trunk_height  do
		pos.y = pos.y+dy
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y-dy
	end
	local trunknodes = {}
	for dy=0,config.trunk_height-1 do
		pos.y = pos.y+dy
		local tnode = minetest.get_node(pos)
		table.insert(trunknodes, table.copy(pos))
		pos.y = pos.y-dy
	end



	local leafnodes = {}
	local replacementnodes = {}
	for dx=-config.leaves_outwards, config.leaves_outwards do
		for dz=-config.leaves_outwards, config.leaves_outwards do
			for dy=config.leaves_start_height, config.leaves_start_height + config.leaves_height - 1 do
				pos.x = pos.x+dx
				pos.y = pos.y+dy
				pos.z = pos.z+dz
				if dx ~= 0 or dz ~= 0 or dy > config.trunk_height then
					local tnode = minetest.get_node(pos)
					if tnode.name == "air" and math.random(1, config.leaves_chance_denominator) <= config.leaves_chance_numerator then
						local replaced = false
						if replacement and replacement.name then
							if math.random(1, replacement.chance) == 1 then
								table.insert(replacementnodes, table.copy(pos))
								replaced = true
							end
						end
						if not replaced then
							table.insert(leafnodes, table.copy(pos))
						end
					end
				end
				pos.x = pos.x-dx
				pos.y = pos.y-dy
				pos.z = pos.z-dz
			end
		end
	end

	node.name = trunk
	minetest.bulk_set_node(trunknodes, node)
	node.name = leaves
	minetest.bulk_set_node(leafnodes, node)
	if #replacementnodes > 0 then
		node.name = replacement.name
		minetest.bulk_set_node(replacementnodes, node)
	end

end

function hades_trees.generate_paletree(pos, check_light, trunk, leaves, underground)
	trunk = trunk or "hades_trees:pale_tree"
	leaves = leaves or "hades_trees:pale_leaves"
	underground = underground or table.copy(DEFAULT_UNDERGROUND)
	table.insert(underground, "hades_core:ash")
	table.insert(underground, "hades_core:volcanic_sand")
	table.insert(underground, "hades_core:fertile_sand")
	local config = {
		trunk_height = 8,
		leaves_start_height = 2,
		leaves_height = 7,
		leaves_outwards = 1,
		leaves_chance_numerator = 2,
		leaves_chance_denominator = 5,
	}
	hades_trees.generate_cuboid_tree(pos, check_light, trunk, leaves, underground, nil, config)
end

function hades_trees.generate_birchtree(pos, check_light, trunk, leaves, underground)
	trunk = trunk or "hades_trees:birch_tree"
	leaves = leaves or "hades_trees:birch_leaves"
	underground = underground or DEFAULT_UNDERGROUND
	local config = {
		trunk_height = 7,
		leaves_start_height = 3,
		leaves_height = 7,
		leaves_outwards = 2,
		leaves_chance_numerator = 4,
		leaves_chance_denominator = 5,
	}
	hades_trees.generate_cuboid_tree(pos, check_light, trunk, leaves, underground, nil, config)
end

function hades_trees.generate_canvastree(pos, check_light, trunk, leaves, underground)
	trunk = trunk or "hades_trees:canvas_tree"
	leaves = leaves or "hades_trees:canvas_leaves"
	underground = underground or DEFAULT_UNDERGROUND
	local config = {
		trunk_height = 7,
		leaves_start_height = 3,
		leaves_height = 7,
		leaves_outwards = 2,
		leaves_chance_numerator = 4,
		leaves_chance_denominator = 5,
	}
	hades_trees.generate_cuboid_tree(pos, check_light, trunk, leaves, underground, nil, config)
end

function hades_trees.generate_cjtree(pos, check_light, trunk, leaves, underground)
	trunk = trunk or "hades_trees:jungle_tree"
	leaves = leaves or "hades_trees:cultivated_jungle_leaves"
	underground = underground or DEFAULT_UNDERGROUND
	local config = {
		trunk_height = 13,
		leaves_start_height = 10,
		leaves_height = 5,
		leaves_outwards = 3,
		leaves_chance_numerator = 4,
		leaves_chance_denominator = 5,
	}
	hades_trees.generate_cuboid_tree(pos, check_light, trunk, leaves, underground, nil, config)
end

function hades_trees.generate_bananatree(pos, check_light, trunk, leaves, underground, replacement)
	trunk = trunk or "hades_trees:tree"
	leaves = leaves or "hades_trees:banana_leaves"
	underground = underground or DEFAULT_UNDERGROUND
	replacement = replacement or {name="hades_trees:banana", chance=9}
	local config = {
		trunk_height = 3,
		leaves_start_height = 1,
		leaves_height = 3,
		leaves_outwards = 1,
		leaves_chance_numerator = 1,
		leaves_chance_denominator = 1,
	}
	hades_trees.generate_cuboid_tree(pos, check_light, trunk, leaves, underground, replacement, config)
end



--------
local c_air = minetest.CONTENT_AIR
local c_ignore = minetest.CONTENT_IGNORE

function hades_trees.generate_jungletree(pos, check_light, trunk, leaves)
	local nu =  minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
	local ret = false
	for _,name in ipairs(DEFAULT_UNDERGROUND) do
		if nu == name then
			ret = true
			break
		end
	end
	if not ret then
		return
	end

	minetest.log("action", "[action] A jungle sapling grows into a tree at "..minetest.pos_to_string(pos))
	trunk = trunk or "hades_trees:jungle_tree"
	leaves = leaves or "hades_trees:jungle_leaves"
	local c_jungletree = minetest.get_content_id(trunk)
	local c_jungleleaves = minetest.get_content_id(leaves)

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map({x=pos.x-16, y=pos.y-1, z=pos.z-16}, {x=pos.x+16, y=pos.y+16, z=pos.z+16})
	local a = VoxelArea:new{MinEdge=minp, MaxEdge=maxp}
	local data = vm:get_data()

	if not pr_j then
		local seed = math.random(1,100000)
		pr_j = PseudoRandom(seed)
	end
        local x, y, z = pos.x, pos.y, pos.z

	local lpos = {x=pos.x, y=pos.y+1, z=pos.z}
	if not check_node_light(lpos, 8, check_light) then
		return
	end

        local th = pr_j:next(10, 14)
        for yy = y, y+th-1 do
                local vi = a:index(x, yy, z)
                if a:contains(x, yy, z) and (data[vi] == c_air or yy == y) then
                        data[vi] = c_jungletree
                end
        end
        y = y+th-1 -- (x, y, z) is now last piece of trunk
        local leaves_a = VoxelArea:new{MinEdge={x=-3, y=-4, z=-3}, MaxEdge={x=3, y=2, z=3}}
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
        for iii = 1, 30 do
                local d = 1
                local xx = pr_j:next(leaves_a.MinEdge.x, leaves_a.MaxEdge.x - d)
                local yy = pr_j:next(leaves_a.MinEdge.y, leaves_a.MaxEdge.y - d)
                local zz = pr_j:next(leaves_a.MinEdge.z, leaves_a.MaxEdge.z - d)

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
                                        data[vi] = c_jungleleaves
                                end
                        end
                end
        end
        end
        end

	vm:set_data(data)
	vm:write_to_map(data)
	vm:update_map()
end

local c_apple = minetest.get_content_id("hades_trees:apple")

function hades_trees.generate_appletree(pos, check_light, trunk, leaves, underground, replacement)
	local nu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

	local ret = false
	for _,name in ipairs(DEFAULT_UNDERGROUND) do
		if nu == name then
			ret = true
			break
		end
	end
	if not ret then
		return
	end

	local lpos = {x=pos.x, y=pos.y+1, z=pos.z}
	if not check_node_light(lpos, 8, check_light) then
		return
	end

	minetest.log("action", "[hades_trees] A sapling grows into an apple tree at "..minetest.pos_to_string(pos))
	trunk = trunk or "hades_trees:tree"
	leaves = leaves or "hades_trees:leaves"
	underground = underground or DEFAULT_UNDERGROUND
	replacement = replacement or {name="hades_trees:apple", chance=9}
	local c_tree = minetest.get_content_id(trunk)
	local c_leaves = minetest.get_content_id(leaves)
	local c_replacement
	if replacement.name then
		c_replacement = minetest.get_content_id(replacement.name)
	end

	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map({x=pos.x-16, y=pos.y, z=pos.z-16}, {x=pos.x+16, y=pos.y+16, z=pos.z+16})
	local a = VoxelArea:new{MinEdge=minp, MaxEdge=maxp}
	local data = vm:get_data()

	if not pr_a then
		local seed = math.random(1,100000)
		pr_a = PseudoRandom(seed)
	end
        local th = pr_a:next(4, 6)
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
                local xx = pr_a:next(leaves_a.MinEdge.x, leaves_a.MaxEdge.x - d)
                local yy = pr_a:next(leaves_a.MinEdge.y, leaves_a.MaxEdge.y - d)
                local zz = pr_a:next(leaves_a.MinEdge.z, leaves_a.MaxEdge.z - d)

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
                                        if c_replacement and pr_a:next(1, replacement.chance) == 1 then
                                                data[vi] = c_replacement
                                        else
                                                data[vi] = c_leaves
                                        end
                                end
                        end
                end
        end
        end
        end

	vm:set_data(data)
	vm:write_to_map(data)
	vm:update_map()
end

