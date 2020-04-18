/// @description Insert description here
// You can write your code in this editor
draw_self();

if(position_meeting (mouse_x, mouse_y, id)){
	image_index = 1;
	global.xBox = obj_btn.x-150;
	global.yBox = obj_btn.y+250;
	
}else{
	image_index = 0;
}


	draw_set_color(fnt_title);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_transformed_color(x, y, Mytext, 0.8, 0.8, 0, c_white, c_white, c_white, c_white, 1);

if(position_meeting (mouse_x, mouse_y, id)&& mouse_check_button_pressed(mb_left)){
	room_goto(myRoom);
	if(!audio_is_playing(snd_flip)){
		audio_play_sound(snd_flip, 90, false);
		}
}