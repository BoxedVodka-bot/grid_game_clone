/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_color(fnt_title);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed_color(x, y, Mytext, 0.5, 0.5, 1, c_black, c_black, c_black, c_black, 1);
if(position_meeting (mouse_x, mouse_y, id)){
	image_index = 1;
	
}else{
	image_index = 0;
}

if(position_meeting (mouse_x, mouse_y, id)&& mouse_check_button_pressed(mb_left)){
	room_goto(myRoom);
}