-- This is a fake item to render unknown items in hypertext.
-- This item should never be used for any actual gameplay stuff.

minetest.register_craftitem("hades_info:unknown", {
	inventory_image = "hades_info_unknown_item.png",
	wield_image = "hades_info_unknown_item.png",
	groups = { not_in_creative_inventory = 1 },
})
