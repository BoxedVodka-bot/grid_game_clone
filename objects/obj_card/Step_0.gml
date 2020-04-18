//set lerping animation

if (target_x != x) {
	x = lerp(x, target_x, 0.1);	
}

if (target_y != y) {
	y = lerp(y, target_y, 0.1);
}

if (target_depth != depth) {
	depth = target_depth;	
}

//hover and click
if ( y >= 576 && letclick == true && position_meeting(mouse_x, mouse_y, id) ) {
	global.player_hovered_card = id;
	hover_over();
} else if (letclick == true && global.player_hovered_card == id) { 
	global.player_hovered_card = noone;
	hover_notover();
} 

//if(global.game_state == global.state_peek && y<= 576 && position_meeting(mouse_x, mouse_y, id)){
//	global.peek_card = id;
//	hover_over();

//}else if (global.game_state !=global.state_peek && y>=576 && letclick == true && position_meeting(mouse_x, mouse_y, id)){
//	global.player_hovered_card = id;
//	hover_over()
//}else if(letclick == true && global.player_hovered_card == id){
//	global.player_hovered_card = noone;
//	hover_notover();
//}


//face index
if (face_up) {
	if card_type = global.rock {
		sprite_index = spr_rock;
		}
	if card_type = global.scissor{
		sprite_index=spr_scissor;
		}
	if card_type = global.paper {
		sprite_index=spr_paper;
		}
	}else{
		sprite_index=spr_card;
	}
