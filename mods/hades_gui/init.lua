hades_gui = {}

hades_gui.gui_inventory_bg_img = "background9[0,0;8,8.5;hades_gui_inventory.png;true;3]"

hades_gui.gui_survival_form = "size[10,8.5]"..
	hades_gui.gui_inventory_bg_img..
	"list[current_player;main;0,4.25;10,1;]"..
	"list[current_player;main;0,5.5;10,3;10]"..
	"list[current_player;craft;4,0.5;3,3;]"..
	"list[current_player;craftpreview;8,1.5;1,1;]"..
	"image[7,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]]"..
	"listring[current_player;main]"..
	"listring[current_player;craft]"
