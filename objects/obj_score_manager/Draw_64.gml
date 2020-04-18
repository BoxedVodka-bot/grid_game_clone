//draw scores
draw_set_font(fnt_score);

draw_set_halign(fa_left);
	draw_text_transformed_colour(60,670,global.player_score,3,3,0,c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_colour(60,40,global.comp_score,3,3,0, c_black, c_black, c_black, c_black,1);