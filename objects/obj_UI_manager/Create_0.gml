/// @description Insert description here
// You can write your code in this editor

if (room == rm_start){
	//draw_set_font(fnt_score);
	global.start_btn = instance_create_layer(330, 352, "UI_Instances", obj_btn);
	global.start_btn.Mytext = "Start";
	global.start_btn.myRoom = 1;
	
	global.start_btn = instance_create_layer(500, 352, "UI_Instances", obj_btn);
	global.start_btn.Mytext = "Extra";
	global.start_btn.myRoom = 2;
	//draw_set_font(fnt_title);
	global.gametitle = instance_create_layer(room_width/2, room_height/4, "UI_Instances", obj_titletext);
	global.gametitle.Mytext = "Rock, Paper, Scissor!";
}