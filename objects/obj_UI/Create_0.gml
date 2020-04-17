/// @description Insert description here
// You can write your code in this editor

if (room == room0){
	global.start_btn = instance_create_layer(room_width/2, room_height/2, "UI_Instances", obj_btn);
	global.start_btn.Mytext = "start";
	global.start_btn.myRoom = 1;
	
	//global.start_btn = instance_create_layer(room_width/2, room_height/1.5, "UI_Instances", obj_btn);
	//global.start_btn.Mytext = "Settings";
	//global.start_btn.myRoom = 2;
	
	global.gametitle = instance_create_layer(room_width/2, room_height/3, "UI_Instances", obj_titletext);
	global.gametitle.Mytext = "Game";
}