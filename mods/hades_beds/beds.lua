local S = minetest.get_translator("hades_beds")

-- fancy shaped bed
hades_beds.register_bed("hades_beds:fancy_bed", {
	description = S("Fancy Bed"),
	inventory_image = "beds_bed_fancy.png",
	wield_image = "beds_bed_fancy.png",
	tiles = {
	    bottom = {
		"beds_bed_top1.png",
		"default_wood.png",
		"beds_bed_side1.png",
		"beds_bed_side1.png^[transformFX",
		"default_wood.png",
		"beds_bed_foot.png",
	    },
	    top = {
		"beds_bed_top2.png",
		"default_wood.png",
		"beds_bed_side2.png",
		"beds_bed_side2.png^[transformFX",
		"beds_bed_head.png",
		"default_wood.png",
	    }
	},
	nodebox = {
	    bottom = {
		{-0.5, -0.5, -0.5, -0.375, -0.065, -0.4375},
		{0.375, -0.5, -0.5, 0.5, -0.065, -0.4375},
		{-0.5, -0.375, -0.5, 0.5, -0.125, -0.4375},
		{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
		{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
		{-0.4375, -0.3125, -0.4375, 0.4375, -0.0625, 0.5},
	      },
	      top = {
		{-0.5, -0.5, 0.4375, -0.375, 0.1875, 0.5},
		{0.375, -0.5, 0.4375, 0.5, 0.1875, 0.5},
		{-0.5, 0, 0.4375, 0.5, 0.125, 0.5},
		{-0.5, -0.375, 0.4375, 0.5, -0.125, 0.5},
		{-0.5, -0.375, -0.5, -0.4375, -0.125, 0.5},
		{0.4375, -0.375, -0.5, 0.5, -0.125, 0.5},
		{-0.4375, -0.3125, -0.5, 0.4375, -0.0625, 0.4375},
	      }
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"", "", "group:stick"},
		{"cloth:red", "cloth:red", "cloth:white"},
		{"group:wood", "group:wood", "group:wood"},
	}, 
})

-- simple shaped bed
hades_beds.register_bed("hades_beds:bed", {
	description = S("Simple Bed"),
	inventory_image = "beds_bed.png",
	wield_image = "beds_bed.png",
	tiles = {
	    bottom = {
		"beds_bed_top_bottom.png^[transformR90",
		"default_wood.png",
		"beds_bed_side_bottom_r.png",
		"beds_bed_side_bottom_r.png^[transformfx",
		"blank.png",
		"beds_bed_side_bottom.png"
	    },
	    top = {
		"beds_bed_top_top.png^[transformR90",
		"default_wood.png", 
		"beds_bed_side_top_r.png",
		"beds_bed_side_top_r.png^[transformfx",
		"beds_bed_side_top.png",
		"blank.png",
	    }
	},
	nodebox = {
	    bottom = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	    top = {-0.5, -0.5, -0.5, 0.5, 0.06, 0.5},
	},
	selectionbox = {-0.5, -0.5, -0.5, 0.5, 0.06, 1.5},
	recipe = {
		{"group:cloth", "group:cloth", "group:cloth"},
		{"group:wood", "group:wood", "group:wood"}
	}, 

})


-- aliases for PA's beds mod
minetest.register_alias("beds:bed_bottom_red", "beds:bed_bottom")
minetest.register_alias("beds:bed_top_red", "beds:bed_top")

minetest.register_alias("beds:bed_bottom", "hades_beds:bed_bottom")
minetest.register_alias("beds:bed_top", "hades_beds:bed_top")
minetest.register_alias("beds:fancy_bed_bottom", "hades_beds:fancy_bed_bottom")
minetest.register_alias("beds:fancy_bed_top", "hades_beds:fancy_bed_top")

