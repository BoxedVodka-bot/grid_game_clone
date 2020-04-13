
//if(global.game_state == global.state_reshuffle)
//{
//	if (abs(x - target_x) > 10) {
//		x = lerp(x, target_x, 0.2);	
//	}
//	else{
//		x = target_x;
//		depth = target_depth;
//	}

//	if (abs(y - target_y) > 10) {
//		y = lerp(y, target_y, 0.2);	
//	}
//	else{
//		y = target_y;
//		depth = target_depth;
//	}
//}
//else{
//	if (target_x != x) {
//		x = lerp(x, target_x, 0.2);	
//	}

//	if (target_y != y) {
//		y = lerp(y, target_y, 0.2);
//	}
//}


//if (target_depth != depth) {
//	depth = target_depth;	
//}

//if (letclick == true && position_meeting(mouse_x, mouse_y, id)) {
//	global.player_hovered_card = id;
//	hover_over();
//} else if (global.player_hovered_card == id) { 
//	global.player_hovered_card = noone;
//	hover_notover();
//}

//if (face_up) {
//	if card_type = global.rock {
//		sprite_index = spr_rock;
//		}
//	if card_type = global.scissor{
//		sprite_index=spr_scissor;
//		}
//	if card_type = global.paper {
//		sprite_index=spr_paper;
//		}
//	}else{
//		sprite_index=spr_card;
//	}

if (target_x != x) {
	x = lerp(x, target_x, 0.1);	
}

if (target_y != y) {
	y = lerp(y, target_y, 0.1);
}

if (target_depth != depth) {
	depth = target_depth;	
}

if ( y >= 576 && letclick == true && position_meeting(mouse_x, mouse_y, id) ) {
	global.player_hovered_card = id;
	hover_over();
} else if (letclick == true && global.player_hovered_card == id) { 
	global.player_hovered_card = noone;
	hover_notover();
} 

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
