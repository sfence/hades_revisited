--
-- Leafdecay
--

-- To enable leaf decay for a node, add it to the "leafdecay" group.
--
-- The rating of the group determines how far from a node in the group "tree"
-- the node can be without decaying.
--
-- If param2 of the node is ~= 0, the node will always be preserved. Thus, if
-- the player places a node of that kind, you will want to set param2=1 or so.
--
-- If the node is in the leafdecay_drop group then the it will always be dropped
-- as an item


hades_trees.leafdecay_trunk_cache = {}
hades_trees.leafdecay_enable_cache = true
-- Spread the load of finding trunks
hades_trees.leafdecay_trunk_find_allow_accumulator = 0

minetest.register_globalstep(function(dtime)
	local finds_per_second = 5000
	hades_trees.leafdecay_trunk_find_allow_accumulator =
			math.floor(dtime * finds_per_second)
end)

minetest.register_abm({
	label = "Leaf decay",
	nodenames = {"group:leafdecay"},
	neighbors = {"air", "group:liquid"},
	-- A low interval and a high inverse chance spreads the load
	interval = 2,
	chance = 5,

	action = function(p0, node, _, _)
		minetest.log("verbose", "[hades_trees] leafdecay ABM at "..p0.x..", "..p0.y..", "..p0.z..")")
		local do_preserve = false
		local d = minetest.registered_nodes[node.name].groups.leafdecay
		if not d or d == 0 then
			minetest.log("verbose", "[hades_trees] not groups.leafdecay")
			return
		end
		local n0 = minetest.get_node(p0)
		if n0.param2 ~= 0 then
			-- Prevent decay
			return
		end
		local p0_hash = nil
		if hades_trees.leafdecay_enable_cache then
			p0_hash = minetest.hash_node_position(p0)
			local trunkp = hades_trees.leafdecay_trunk_cache[p0_hash]
			if trunkp then
				local n = minetest.get_node(trunkp)
				local reg = minetest.registered_nodes[n.name]
				-- Assume ignore is a trunk, to make the thing work at the border of the active area
				if n.name == "ignore" or (reg and reg.groups.tree and reg.groups.tree ~= 0) then
					minetest.log("verbose", "[hades_trees] leafdecay: cached trunk still exists")
					return
				end
				minetest.log("verbose", "[hades_trees] leafdecay: cached trunk is invalid")
				-- Cache is invalid
				table.remove(hades_trees.leafdecay_trunk_cache, p0_hash)
			end
		end
		if hades_trees.leafdecay_trunk_find_allow_accumulator <= 0 then
			return
		end
		hades_trees.leafdecay_trunk_find_allow_accumulator =
				hades_trees.leafdecay_trunk_find_allow_accumulator - 1
		-- Assume ignore is a trunk, to make the thing work at the border of the active area
		local p1 = minetest.find_node_near(p0, d, {"ignore", "group:tree"})
		if p1 then
			do_preserve = true
			if hades_trees.leafdecay_enable_cache then
				minetest.log("verbose", "[hades_trees] leafdecay: caching trunk")
				-- Cache the trunk
				hades_trees.leafdecay_trunk_cache[p0_hash] = p1
			end
		end
		if not do_preserve then
			-- Drop stuff other than the node itself
			local itemstacks = minetest.get_node_drops(n0.name)
			for _, itemname in ipairs(itemstacks) do
				if minetest.get_item_group(n0.name, "leafdecay_drop") ~= 0 or
						itemname ~= n0.name then
					local p_drop = {
						x = p0.x - 0.5 + math.random(),
						y = p0.y - 0.5 + math.random(),
						z = p0.z - 0.5 + math.random(),
					}
					minetest.add_item(p_drop, itemname)
				end
			end
			-- Remove node
			minetest.remove_node(p0)
			minetest.check_for_falling(p0)
		end
	end
})
