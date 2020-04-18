//Set text
if(room == rm_end){
	draw_set_color(c_white);
	draw_set_font(fnt_title);
	draw_set_halign(fa_left);
	draw_text_ext_transformed(320, 230, "Oh no! It seems like luck was not on your side. Try again!", 40, 600, 0.7, 0.7, 0);
}

if(room == rm_win){
	draw_set_color(c_white);
	draw_set_font(fnt_title);
	draw_set_halign(fa_left);
	draw_text_ext_transformed(320, 230, "Congratulation! You indeed proved your skills and luck. Want another round?", 40, 600, 0.7, 0.7, 0);	
}