//draw scores
draw_set_font(fnt_score);

draw_set_halign(fa_left);
	draw_text_transformed_colour(30,680,global.player_score,3,3,0,c_white,c_white,c_white,c_white,1);
	draw_text_transformed_colour(30,20,global.comp_score,3,3,0,c_white,c_white,c_white,c_white,1);