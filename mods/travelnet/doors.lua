-- Doors that are especially useful for travelnet elevators but can also be used in other situations.
-- All doors (not only these here) in front of a travelnet or elevator are opened automaticly when a player arrives
-- and are closed when a player departs from the travelnet or elevator.
-- Autor: Sokomine

minetest.register_node("travelnet:elevator_door_steel_open", {
		description = "Stone Elevator Door (open)",
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"default_stone.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {cracky=2,oddly_breakable_by_hand=2,not_in_creative_inventory=1},
                -- larger than one node but slightly smaller than a half node so that wallmounted torches pose no problem
		node_box = {
			type = "fixed",
			fixed = {
				{-0.90, -0.5,  0.4, -0.49, 1.5,  0.5},
				{ 0.49, -0.5,  0.4,  0.9, 1.5,  0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.9, -0.5,  0.4,  0.9, 1.5,  0.5},
			},
		},
		drop = "travelnet:elevator_door_steel_closed",
                on_rightclick = function(pos, node, puncher)
                    minetest.env:add_node(pos, {name = "travelnet:elevator_door_steel_closed", param2 = node.param2})
                end,
})

minetest.register_node("travelnet:elevator_door_steel_closed", {
		description = "Stone Elevator Door",
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"default_stone.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {cracky=2,oddly_breakable_by_hand=2},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5,  -0.5,  0.4, -0.01, 1.5,  0.5},
				{ 0.01, -0.5,  0.4,  0.5,  1.5,  0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5,  0.4,  0.5, 1.5,  0.5},
			},
		},
                on_rightclick = function(pos, node, puncher)
                    minetest.env:add_node(pos, {name = "travelnet:elevator_door_steel_open", param2 = node.param2})
                end,
})




minetest.register_node("travelnet:elevator_door_glass_open", {
		description = "Glass Elevator Door (open)",
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"travelnet_elevator_door_glass.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
                -- larger than one node but slightly smaller than a half node so that wallmounted torches pose no problem
		node_box = {
			type = "fixed",
			fixed = {
				{-0.99, -0.5,  0.4, -0.49, 1.5,  0.5},
				{ 0.49, -0.5,  0.4,  0.99, 1.5,  0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.9, -0.5,  0.4,  0.9, 1.5,  0.5},
			},
		},
		drop = "travelnet:elevator_door_glass_closed",
                on_rightclick = function(pos, node, puncher)
                    minetest.env:add_node(pos, {name = "travelnet:elevator_door_glass_closed", param2 = node.param2})
                end,
})

minetest.register_node("travelnet:elevator_door_glass_closed", {
		description = "Glass Elevator Door",
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"travelnet_elevator_door_glass.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {cracky=3,oddly_breakable_by_hand=3},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5,  -0.5,  0.4, -0.01, 1.5,  0.5},
				{ 0.01, -0.5,  0.4,  0.5,  1.5,  0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5,  0.4,  0.5, 1.5,  0.5},
			},
		},
                on_rightclick = function(pos, node, puncher)
                    minetest.env:add_node(pos, {name = "travelnet:elevator_door_glass_open", param2 = node.param2})
                end,
})

minetest.register_craft({
	        output = "travelnet:elevator_door_glass_closed",
	        recipe = {
		        {"default:glass", "", "default:glass", },
			{"default:glass", "", "default:glass", },
			{"default:glass", "", "default:glass", }
		        }
	})

minetest.register_craft({
	        output = "travelnet:elevator_door_steel_closed",
	        recipe = {
		        {"default:stone", "", "default:stone", },
			{"default:stone", "", "default:stone", },
			{"default:stone", "", "default:stone", }
		        }
	})
--      local old_node = minetest.env:get_node( pos );
--      minetest.env:add_node(pos, {name = "travelnet:elevator_door_glass_closed", param2 = old_node.param2})



