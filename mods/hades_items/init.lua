local old_item_drop = minetest.item_drop

function minetest.item_drop(itemstack, dropper, pos)
	minetest.sound_play("item_drop", {
		pos=pos,
		gain = 1.0,
		max_hear_distance = 32,
	}, true)
	return old_item_drop(itemstack, dropper, pos)
end

