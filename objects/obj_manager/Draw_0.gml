//set introduction
if(ShowText == true){
	draw_sprite(spr_textbox, 0, global.xBox, global.yBox);
	draw_set_color(c_white);
	draw_set_font(fnt_title);
	draw_set_halign(fa_left);
	draw_text_ext_transformed(global.xBox, global.yBox, "Sward counters wand, wand counters shield, and shield counters sward. Press space to continue.", 30, 600, 0.6, 0.6, 0);
	
}