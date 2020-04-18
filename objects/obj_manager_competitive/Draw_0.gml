//Set timer
draw_set_color(c_black);
draw_text_transformed(460, 30, "Time Left:" + string(myTime), 1.2, 1.2, 0);

//set introduction
if(ShowText == true){
	draw_sprite(spr_textbox, 0, global.xBox, global.yBox);
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_text_ext_transformed(global.xBox, global.yBox, "Sward counters wand, wand counters shield, and shield counters sward. Press space to continue.", 15, 270, 1.3, 1.3, 0);
	
}