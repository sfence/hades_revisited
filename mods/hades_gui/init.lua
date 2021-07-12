hades_gui = {}

hades_gui.gui_inventory_bg_img = "background9[0,0;8,9.1;hades_gui_inventory.png;true;3]"

hades_gui.gui_survival_form_header = "size[10,9.1]" ..
	hades_gui.gui_inventory_bg_img

hades_gui.gui_survival_form_inv = "list[current_player;main;0,4.25;10,1;]"..
	"list[current_player;main;0,5.5;10,3;10]"

hades_gui.gui_survival_form_crafting =
	"list[current_player;craft;3,0.5;3,3;]"..
	"image[6,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]]"..
	"list[current_player;craftpreview;7,1.5;1,1;]"..
	"listring[current_player;main]"..
	"listring[current_player;craft]"

hades_gui.gui_survival_form =
	hades_gui.gui_survival_form_header ..
	hades_gui.gui_survival_form_inv ..
	hades_gui.gui_survival_form_crafting
