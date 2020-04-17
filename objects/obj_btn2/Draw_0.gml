/// @description Insert description here
// You can write your code in this editor
if(position_meeting (mouse_x, mouse_y, id)){
	draw_sprite(spr_textbox, 0, global.xBox, global.yBox);
	//if(layer == "textbox"){
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_text_ext_transformed(global.xBox, global.yBox, text1, 15, 250, 1.3, 1.3, 0);
	//}
}