-- some functions to compatiblity with Hades

-- fake some functions


pipeworks.gui_bg     = ""
pipeworks.gui_bg_img = ""
pipeworks.gui_slots  = ""

function pipeworks.get_hotbar_bg(x,y)
 local out = ""
 for i=0,7,1 do
  out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
 end
 return out
end

pipeworks.gui_survival_form = "size[10,8.5]"..
   "list[current_player;main;0,4.25;10,1;]"..
   "list[current_player;main;0,5.5;10,3;10]"..
   "list[current_player;craft;1.75,0.5;3,3;]"..
   "list[current_player;craftpreview;5.75,1.5;1,1;]"..
   "image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
   "listring[current_player;main]"..
   "listring[current_player;craft]"..
   pipeworks.get_hotbar_bg(0,4.25)

--
-- Optimized helper to put all items in an inventory into a drops list
--

function pipeworks.get_inventory_drops(pos, inventory, drops)
 local inv = minetest.get_meta(pos):get_inventory()
 local n = #drops
 for i = 1, inv:get_size(inventory) do
  local stack = inv:get_stack(inventory, i)
  if stack:get_count() > 0 then
   drops[n+1] = stack:to_table()
   n = n + 1
  end
 end
end

--
-- NOTICE: This method is not an official part of the API yet.
-- This method may change in future.
--

function pipeworks.can_interact_with_node(player, pos)
 if player and player:is_player() then
  if minetest.check_player_privs(player, "protection_bypass") then
   return true
  end
 else
  return false
 end

 local meta = minetest.get_meta(pos)
 local owner = meta:get_string("owner")

 if not owner or owner == "" or owner == player:get_player_name() then
  return true
 end
 
 -- no key support

 return false
end

