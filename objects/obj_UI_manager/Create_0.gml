/// @description Insert description here
// You can write your code in this editor

if (room == rm_start){
	draw_set_font(fnt_title);
	global.start_btn = instance_create_layer(330, 400, "UI_Instances", obj_btn);
	global.start_btn.Mytext = "Infinite";
	global.start_btn.myRoom = 1;
	
	global.start_btn = instance_create_layer(700, 400, "UI_Instances", obj_btn2);
	global.start_btn.Mytext = "Competitive";
	global.start_btn.myRoom = 2;
	//draw_set_font(fnt_title);
	//global.gametitle = instance_create_layer(room_width/2, room_height/5, "UI_Instances", obj_titletext);
	//global.gametitle.Mytext = "Rock, Paper, Scissor!";
	global.start_btn = instance_create_layer(800, 600, "UI_Instances", obj_btn2);
	global.start_btn.Mytext = "lose";
	global.start_btn.myRoom = 3;
	
	global.start_btn = instance_create_layer(800, 100, "UI_Instances", obj_btn2);
	global.start_btn.Mytext = "win";
	global.start_btn.myRoom = 4;
}

if(room == rm_end){
	draw_set_font(fnt_title);
	global.start_btn = instance_create_layer(room_width/2, 550, "Instances", obj_btn_back);
}

if(room == rm_win){
	draw_set_font(fnt_title);
	global.start_btn = instance_create_layer(room_width/2, 550, "Instances", obj_btn_back);
}
