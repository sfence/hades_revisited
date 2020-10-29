local pr_a, pr_j -- PseudoRandom vars

function hades_trees.grow_sapling(pos, check_light)
	local node = minetest.get_node(pos, check_light)
	if node.name == "hades_trees:sapling" then
		hades_trees.generate_appletree(pos, check_light)
	elseif node.name == "hades_trees:jungle_sapling" then
		hades_trees.generate_jungletree(pos, check_light)
	elseif node.name == "hades_trees:cultivated_jungle_sapling" then
		hades_trees.generate_cjtree(pos, check_light)
	elseif node.name == "hades_trees:olive_sapling" then
		hades_trees.generate_olivetree(pos, check_light)
	elseif node.name == "hades_trees:birch_sapling" then
		hades_trees.generate_birchtree(pos, check_light)
	elseif node.name == "hades_trees:pale_sapling" then
		hades_trees.generate_paletree(pos, check_light)
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

-- Common Tree
function hades_trees.generate_tree(pos, check_light, trunk, leaves, underground, replacements)
	if not trunk then
		trunk = "hades_trees:tree"
	end
	if not leaves then
		leaves = "hades_trees:leaves"
	end
	if not underground then
		underground = {"hades_core:dirt", "hades_core:dirt_with_grass"}
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
		underground = {"hades_core:dirt", "hades_core:dirt_with_grass"}
	end
	if not replacements then
		replacements = {["hades_trees:olive"]=10}
	end
	hades_trees.generate_tree(pos, check_light, trunk, leaves, underground, replacements)
end

-- Pale Tree
function hades_trees.generate_paletree(pos, check_light, trunk, leaves, underground)
	if not trunk then
		trunk = "hades_trees:pale_tree"
	end
	if not leaves then
		leaves = "hades_trees:pale_leaves"
	end
	if not underground then
		underground = {"hades_core:dirt", "hades_core:dirt_with_grass", "hades_core:ash", "hades_core:fertile_sand"}
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

	node = {name = ""}
	for dy=1,6 do
		pos.y = pos.y+dy
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y-dy
	end
	node.name = trunk
	for dy=0,6 do
		pos.y = pos.y+dy
		minetest.set_node(pos, node)
		pos.y = pos.y-dy
	end


	node.name = leaves
	pos.y = pos.y+3
	for dx=-1,1 do
		for dz=-1,1 do
			for dy=-1,5 do
				pos.x = pos.x+dx
				pos.y = pos.y+dy
				pos.z = pos.z+dz


				if dx == 0 and dz == 0 and dy==5 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
					end
				elseif dx == 0 and dz == 0 and dy==6 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 1 or math.abs(dz) ~= 1 and dy>=5 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 3 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 1 or math.abs(dz) ~= 1 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 2 or math.abs(dz) ~= 2 and dy==4 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 2 or math.abs(dz) ~= 2 and dy==3 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
					end

				end


				pos.x = pos.x-dx
				pos.y = pos.y-dy
				pos.z = pos.z-dz
			end
		end
	end
end

-- Birch Tree
function hades_trees.generate_birchtree(pos, check_light, trunk, leaves, underground)
	if not trunk then
		trunk = "hades_trees:birch_tree"
	end
	if not leaves then
		leaves = "hades_trees:birch_leaves"
	end
	if not underground then
		underground = {"hades_core:dirt", "hades_core:dirt_with_grass"}
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
	for dy=1,6 do
		pos.y = pos.y+dy
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y-dy
	end
	node.name = trunk
	for dy=0,6 do
		pos.y = pos.y+dy
		minetest.set_node(pos, node)
		pos.y = pos.y-dy
	end


	node.name = leaves
	pos.y = pos.y+4
	for dx=-2,2 do
		for dz=-2,2 do
			for dy=-1,5 do
				pos.x = pos.x+dx
				pos.y = pos.y+dy
				pos.z = pos.z+dz


				if dx == 0 and dz == 0 and dy==5 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
						minetest.set_node(pos, node)
					end
				elseif dx == 0 and dz == 0 and dy==6 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 1 or math.abs(dz) ~= 1 and dy>=5 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 3 then
						minetest.set_node(pos, node)
					end

				elseif math.abs(dx) ~= 1 or math.abs(dz) ~= 1 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
						minetest.set_node(pos, node)
					end

				elseif math.abs(dx) ~= 2 or math.abs(dz) ~= 2 and dy==4 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 2 or math.abs(dz) ~= 2 and dy==3 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 3 then
						minetest.set_node(pos, node)
					end

				end


				pos.x = pos.x-dx
				pos.y = pos.y-dy
				pos.z = pos.z-dz
			end
		end
	end
end


-- Cultivated Jungle Tree
function hades_trees.generate_cjtree(pos, check_light, trunk, leaves, underground)
	if not trunk then
		trunk = "hades_trees:jungle_tree"
	end
	if not leaves then
		leaves = "hades_trees:cultivated_jungle_leaves"
	end
	if not underground then
		underground = {"hades_core:dirt", "hades_core:dirt_with_grass"}
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

	node = {name = ""}
	for dy=1,12 do
		pos.y = pos.y+dy
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y-dy
	end
	node.name = trunk
	for dy=0,12 do
		pos.y = pos.y+dy
		minetest.set_node(pos, node)
		pos.y = pos.y-dy
	end


	node.name = leaves
	pos.y = pos.y+10
	for dx=-3,3 do
		for dz=-3,3 do
			for dy=0,3 do
				pos.x = pos.x+dx
				pos.y = pos.y+dy
				pos.z = pos.z+dz


				if dx == 0 and dz == 0 and dy==1 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
					end
				elseif dx == 0 and dz == 0 and dy==2 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 1 or math.abs(dz) ~= 1 and dy>=3 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 3 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 1 or math.abs(dz) ~= 1 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 2 or math.abs(dz) ~= 2 and dy==2 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
						minetest.set_node(pos, node)
					end
				elseif math.abs(dx) ~= 3 or math.abs(dz) ~= 3 and dy==3 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 4 then
						minetest.set_node(pos, node)
					end

				end


				pos.x = pos.x-dx
				pos.y = pos.y-dy
				pos.z = pos.z-dz
			end
		end
	end
end

--------
local c_air = minetest.CONTENT_AIR
local c_ignore = minetest.CONTENT_IGNORE
local c_jungletree = minetest.get_content_id("hades_trees:jungle_tree")
local c_jungleleaves = minetest.get_content_id("hades_trees:jungle_leaves")
local c_tree = minetest.get_content_id("hades_trees:tree")
local c_leaves = minetest.get_content_id("hades_trees:leaves")
local c_apple = minetest.get_content_id("hades_trees:apple")

function hades_trees.generate_jungletree(pos, check_light)
	local nu =  minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

	local ret = false
	for _,name in ipairs({"hades_core:dirt", "hades_core:dirt_with_grass"}) do
		if nu == name then
			ret = true
			break
		end
	end
	if not ret then
		return
	end

	minetest.log("action", "[action] A jungle sapling grows into a tree at "..minetest.pos_to_string(pos))
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

function hades_trees.generate_appletree(pos, check_light, is_apple_tree)
	local nu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name

	local ret = false
	for _,name in ipairs({"hades_core:dirt", "hades_core:dirt_with_grass"}) do
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
	local vm = minetest.get_voxel_manip()
	local minp, maxp = vm:read_from_map({x=pos.x-16, y=pos.y, z=pos.z-16}, {x=pos.x+16, y=pos.y+16, z=pos.z+16})
	local a = VoxelArea:new{MinEdge=minp, MaxEdge=maxp}
	local data = vm:get_data()
	if is_apple_tree == nil then
		is_apple_tree = math.random(1, 4) == 1
	end

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
                                        if pr_a:next(1, 100) <=  3 then -- is_apple_tree and(zwischen if und pr:next)
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

	vm:set_data(data)
	vm:write_to_map(data)
	vm:update_map()
end

