function hades_trees:generate_tree(pos, trunk, leaves, underground, replacements)
	pos.y = pos.y-1
	local nodename = minetest.get_node(pos).name
	local ret = true
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = false
			break
		end
	end
	pos.y = pos.y+1
	if not minetest.get_node_light(pos) then
		return
	end
	if ret or minetest.get_node_light(pos) < 8 then
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

-- Pale Tree
function hades_trees:generate_paletree(pos, trunk, leaves, underground)
	pos.y = pos.y-1
	local nodename = minetest.get_node(pos).name
	local ret = true
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = false
			break
		end
	end
	pos.y = pos.y+1
	if not minetest.get_node_light(pos) then
		return
	end
	if ret or minetest.get_node_light(pos) < 8 then
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
function hades_trees:generate_birchtree(pos, trunk, leaves, underground)
	pos.y = pos.y-1
	local nodename = minetest.get_node(pos).name
	local ret = true
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = false
			break
		end
	end
	pos.y = pos.y+1
	if not minetest.get_node_light(pos) then
		return
	end
	if ret or minetest.get_node_light(pos) < 8 then
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
function hades_trees:generate_cjtree(pos, trunk, leaves, underground)
	pos.y = pos.y-1
	local nodename = minetest.get_node(pos).name
	local ret = true
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = false
			break
		end
	end
	pos.y = pos.y+1
	if not minetest.get_node_light(pos) then
		return
	end
	if ret or minetest.get_node_light(pos) < 8 then
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



-- Banana tree
function hades_trees:generate_tree_b(pos, trunk, leaves, underground, replacements)
	pos.y = pos.y-1
	local nodename = minetest.get_node(pos).name
	local ret = true
	for _,name in ipairs(underground) do
		if nodename == name then
			ret = false
			break
		end
	end
	pos.y = pos.y+1
	if not minetest.get_node_light(pos) then
		return
	end
	if ret or minetest.get_node_light(pos) < 8 then
		return
	end


	node = {name = ""}
	for dy=1,3 do
		pos.y = pos.y+dy
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y-dy
	end
	node.name = trunk
	for dy=0,2 do
		pos.y = pos.y+dy
		minetest.set_node(pos, node)
		pos.y = pos.y-dy
	end


	if not replacements then
		replacements = {}
	end


	node.name = leaves
	pos.y = pos.y+1
	for dx=-1,1 do
		for dz=-1,1 do
			for dy=0,2 do
				pos.x = pos.x+dx
				pos.y = pos.y+dy
				pos.z = pos.z+dz


				if dx == 0 and dz == 0 and dy==3 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
						minetest.set_node(pos, node)
						for name,rarity in pairs(replacements) do
							if math.random(1, rarity) == 1 then
								minetest.set_node(pos, {name=name})
							end
						end
					end
				elseif dx == 0 and dz == 0 and dy==4 then
					if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
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
						if minetest.get_node(pos).name == "air" and math.random(1, 5) <= 2 then
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
