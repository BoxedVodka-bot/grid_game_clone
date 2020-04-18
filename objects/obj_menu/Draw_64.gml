//set botton
draw_self();

draw_set_color(fnt_title);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed_color(900, 100, Mytext, 0.8, 0.8, 0, c_black, c_black, c_black, c_black, 1);

if(position_meeting (mouse_x, mouse_y, id)){
	image_index = 1;
}else{
	image_index = 0;
}


if(position_meeting (mouse_x, mouse_y, id)&& mouse_check_button_pressed(mb_left)){
	room_goto(rm_start);
	audio_stop_sound(snd_classic);
	audio_stop_sound(snd_competitive);
		if(!audio_is_playing(snd_button)){
		audio_play_sound(snd_button, 90, false);
		}
}
