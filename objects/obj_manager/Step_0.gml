
switch (global.game_state) {
	
	case global.state_compdeal:
	//deal AI hand
		wait_time++;
		if (wait_time >= 30) {
			var cards_in_comp_hand = ds_list_size(global.comp_hand);
			var cards_in_player_hand = ds_list_size(global.player_hand);
			if (cards_in_comp_hand < 3) {
				var dealt_card = global.deck[| ds_list_size(global.deck) - 1];
				ds_list_add(global.comp_hand, dealt_card);
				ds_list_delete(global.deck, ds_list_size(global.deck) - 1);
				if(!audio_is_playing(snd_flip)){
				audio_play_sound(snd_flip, 90, false);
				}
				dealt_card.target_x = (room_width / 2 - 100) + cards_in_comp_hand*100;
				dealt_card.target_y = 150;
				dealt_card.face_up = false;
				dealt_card.letclick = false;
				wait_time = 0; //.2*room_speed;
			}

		else {
				bottom_y = global.deck[| 0].y;
				wait_time = 0.2*room_speed;
				global.game_state = global.state_player_deal;	
			}
		}
		break;
	
	case global.state_player_deal:
	//deal player hand
		
		wait_time++;
		
		if(wait_time >=60){
			var cards_in_player_hand = ds_list_size(global.player_hand);
			
			if (cards_in_player_hand < 3) {
				var dealt_card = global.deck[| ds_list_size(global.deck) - 1];
				ds_list_add(global.player_hand, dealt_card);
				ds_list_delete(global.deck, ds_list_size(global.deck) - 1);
				if(!audio_is_playing(snd_flip)){
				audio_play_sound(snd_flip, 90, false);
				}
				dealt_card.target_x = (room_width / 2 - 100) + cards_in_player_hand*100;
				dealt_card.target_y = room_height - 150;
				dealt_card.face_up = true;
				dealt_card.letclick = true;
				wait_time = 0//.2*room_speed;
			}
		else {
				wait_time =0.2*room_speed;
				global.game_state = global.state_compplay;	
			}
		}
		break;


	case global.state_compplay:
	//AI plays card
		wait_time ++;
		letclick = false;
		if (wait_time >=60) {
			if(global.comp_played_card == noone){
				if(!audio_is_playing(snd_flip)){
				audio_play_sound(snd_flip, 90, false);
				}
				var cards_in_comp_hand = ds_list_size(global.comp_hand);
				var random_card_number = irandom_range(0,cards_in_comp_hand - 1);
				global.comp_played_card = global.comp_hand[| random_card_number];	
				global.comp_played_card.target_y += 150;
				global.comp_played_card.target_x = room_width/2;
				ds_list_add(global.cards_on_the_table, global.comp_played_card);
				ds_list_delete(global.comp_hand, global.comp_played_card);
				wait_time = 0 //.1*room_speed;
			} else {
				wait_time = 0.1*room_speed;
				global.game_state = global.state_play;	
			}	
		}
		break;
		
		
	case global.state_play:
	//player plays card
			if (mouse_check_button_pressed(mb_left)) {
				if(global.player_hovered_card != noone){
					if(!audio_is_playing(snd_flip)){
						audio_play_sound(snd_flip, 90, false);
						}
					global.player_played_card = global.player_hovered_card;
					global.player_played_card.target_y -= 150;
					global.player_played_card.target_x = room_width/2;
					ds_list_add(global.cards_on_the_table, global.player_played_card);
					ds_list_delete(global.player_hand, global.player_played_card)
					global.game_state = global.state_reveal;
				}
					
			} 
		break;
		
		
		
	case global.state_reveal:
		//reveal cards & compare
		wait_time++;
		letclick = false;
		if(wait_time >= 150){
			
			//AI selected card face up
			if(global.comp_played_card.face_up == false){
				global.comp_played_card.face_up = true;
				
				if(global.comp_played_card.face_up == true){
					if(global.comp_played_card.card_type == global.player_played_card.card_type){
						global.player_score = global.player_score;
						global.comp_score = global.comp_score;
					}
					if(global.comp_played_card.card_type == global.paper && global.player_played_card.card_type == global.rock){
						global.comp_score += 1;
						if(!audio_is_playing(snd_lose)){
							audio_play_sound(snd_lose, 90, false);
							}
					}
					if(global.comp_played_card.card_type == global.scissor && global.player_played_card.card_type == global.paper){
						global.comp_score += 1;
						if(!audio_is_playing(snd_lose)){
							audio_play_sound(snd_lose, 90, false);
							}
					}
					if(global.comp_played_card.card_type == global.rock && global.player_played_card.card_type == global.scissor){
						global.comp_score += 1;
						if(!audio_is_playing(snd_lose)){
							audio_play_sound(snd_lose, 90, false);
							}
					}
					if(global.comp_played_card.card_type == global.rock && global.player_played_card.card_type == global.paper){
						global.player_score += 1;
						if(!audio_is_playing(snd_win)){
							audio_play_sound(snd_win, 90, false);
							}
					}
					if(global.comp_played_card.card_type == global.scissor && global.player_played_card.card_type == global.rock){
						global.player_score += 1;
						if(!audio_is_playing(snd_win)){
							audio_play_sound(snd_win, 90, false);
							}
					}
					if(global.comp_played_card.card_type == global.paper && global.player_played_card.card_type == global.scissor){
						global.player_score += 1;
						if(!audio_is_playing(snd_win)){
							audio_play_sound(snd_win, 90, false);
							}
					}
				}
			} else {
			global.game_state = global.state_discard;
			}
			wait_time = 0;
		}
		break;
		
		
	case global.state_discard:
		//
	
	letclick = false;
		 
		wait_time++;

		var cards_remain_in_deck = ds_list_size(global.deck);
		for(i = 0; i < ds_list_size(global.player_hand); i++){ //go through the hand list
			var return_card = global.player_hand[| i]; //get a card
			audio_play_sound(snd_flip, 1 ,false);
			return_card.target_x = room_width - 100; //set its target position to the discard area
			return_card.target_y = y + (ds_list_size(global.discard_deck)*2);
			//return_card.in_hand = false; //tell the card its not in the hand
			ds_list_add(global.discard_deck, global.player_hand[| i]); //add the card to the discard list
			return_card.target_depth = ds_list_size(global.discard_deck)*2;
		}
		for(i = 0; i < ds_list_size(global.comp_hand); i++){
			var return_card = global.comp_hand[|i];
			audio_play_sound(snd_flip, 1 ,false);
			return_card.target_x = room_width - 100;
			return_card.target_y = y + (ds_list_size(global.discard_deck)*2);
			//return_card.in_comp_hand = false; //tell the card its not in the hand
			ds_list_add(global.discard_deck, global.comp_hand[| i]); //add the card to the discard list
			return_card.target_depth = ds_list_size(global.discard_deck)*2;
		}
		ds_list_clear(global.comp_hand); //empty the faceup list
		//ds_list_clear(global.player_played_card); //empty the hand list
		ds_list_clear(global.player_hand);//empty computer hand
		if(wait_time > 60){ //wait a bit so the player sees what happened
			 if(cards_remain_in_deck > 0){
				wait_time = room_speed;
				global.comp_played_card = noone;
				global.game_state = global.state_compdeal;
			} else if(cards_remain_in_deck <= 0){
				wait_time = room_speed;
				global.game_state = global.state_reshuffle;
			}
			wait_time = 0;
		}
	
		////wait_time--;
		////var cards_remain_in_deck = ds_list_size(global.deck);
		
		
		////if (wait_time <= 0) {
		////	global.comp_played_card.face_up = false;
		////	global.comp_played_card.target_x = 928;
		////	global.comp_played_card.target_y = 416;
		////	ds_list_delete(global.cards_on_the_table, global.comp_played_card);
		////	ds_list_add(global.discard_deck, global.comp_played_card);
		////	global.comp_played_card = noone;
			
		////	global.player_played_card.face_up = false;
		////	global.player_played_card.target_x = 928;
		////	global.player_played_card.target_y = 416;
		////	ds_list_delete(global.cards_on_the_table, global.player_played_card);
		////	ds_list_add(global.discard_deck, global.player_played_card);
		////	global.player_played_card = noone;
		
		////	while(ds_list_size(global.comp_hand) > 0){

		////		global.comp_hand[| 0].target_x = room_width-96;
		////		global.comp_hand[| 0].target_y = room_height/2;
				

		////		ds_list_delete(global.comp_hand, 0);
		////	}
		////	while(ds_list_size(global.player_hand) > 0){
	
		////		global.player_hand[| 0].target_x = room_width-96;
		////		global.player_hand[| 0].target_y = room_height/2;

		////		ds_list_delete(global.player_hand, 0);
		////	}
		////	wait_time = 0.5*room_speed;
		////} else if(cards_remain_in_deck > 0){
		////	wait_time = room_speed;
		////	global.game_state = global.state_compdeal;
		////} else if(cards_remain_in_deck <= 0){
		////	wait_time = room_speed;
		////	global.game_state = global.state_reshuffle;
		////}
		break;
		
		case global.state_reshuffle:
		letclick = false;
		// wait_time ++;
		//if(wait_time % 10 == 0)
		//{
		//	var card = global.deck[| current_card];
		//	card.target_y = 400 - 2*current_card;
		//	card.y = 400-40;
		//	card.target_depth = ds_list_size(global.deck) - current_card;
		//	current_card ++;
			
		//	if(current_card == ds_list_size(global.deck))
		//	{
		//		global.game_state = global.state_compdeal;
		//		wait_time = 0;
		//		}
		//}
		
		restart_card_count += 1; 
		 if restart_card_count >= 2 {
			 restart_card_count = 0;
		 }
   

		 if restart_card_count == 0 {
			if ds_list_size(global.discard_deck)>0 {
			var last_index = ds_list_size(global.discard_deck) -1;
			var topcard = global.discard_deck[| last_index];
			ds_list_delete(global.discard_deck, last_index);
			ds_list_add(global.deck, topcard);
			topcard.face_up = false;
			topcard.depth = card_yyy;
			topcard.target_x = x;
			topcard.target_y = y +100 - 48+card_yyy*2;
			audio_play_sound(snd_flip,1,false);
			card_yyy+=1;
    
    }
   }
  
  
		if card_yyy > 23 {
			global.game_state = global.state_reshuffle2;
			}
  
		break;
  
		case global.state_reshuffle2:
		letclick = false;
		//Set each card apart
		restart_card_count += 1; 
		if (restart_card_count >= 2) {
			restart_card_count = 0;
			}
		
		//reverse the deck
		for (var i=0;i<ds_list_size(global.discard_deck)-1;i++){
			ds_list_add(global.deck ,global.discard_deck[| 23-i]);
			}


		if (restart_card_count == 0) {
			if order < 24 {
				var topcard = global.deck[| order];
				topcard.depth=-card_yyyy;
				topcard.target_x = x;
				topcard.target_y = y+30-card_yyyy;
				audio_play_sound(snd_flip, 1 ,false);
				card_yyyy+=2;
				order+=1;
				}
			
		//ready to start the next round
		if (order > 22) {
			final_restart_count ++;
			}
			}
		
		//clear everything to zero, start the next round
		if final_restart_count > 10 {
			card_yyy = 0;
			card_yyyy = 0;
			order = 0;
			final_restart_count = 0;
			restart_card_count = 0;
			global.comp_played_card = noone;
			global.game_state = global.state_compdeal;
			}
		
		break;
	
	
}


if (keyboard_check_pressed(ord("R"))) {
	room_restart();
}
	
	
		//discard_card_count += 1; 
		// if discard_card_count >= 2 {
		//	 discard_card_count = 0;
		// }
		////discard_card_count += 1;
		//if (discard_card_count == 0){
		//for (i=0; i<=3; i++){
		//	var check_player_hand = global.player_hand[|i];
		//	//if (check_player_hand == chose_card){
		//		global.player_played_card = check_player_hand;
		//		ds_list_delete(global.player_hand, i);
		//		ds_list_add(global.discard_deck, global.player_played_card);
		//	//}	
		//}
		
		
		//ds_list_add(global.discard_deck, global.comp_hand [|global.comp_played_card]);
		//ds_list_delete(global.comp_hand, global.comp_played_card);
		//ds_list_add(global.discard_deck, global.comp_played_card[|0]);
		//ds_list_add(global.discard_deck, global.comp_hand [|1]);
		//ds_list_add(global.discard_deck, global.comp_hand [|0]);
		//ds_list_clear(global.comp_hand);
		
		//ds_list_add(global.discard_deck, global.player_played_card[|0]);
		//ds_list_add(global.discard_deck, global.player_hand [|0]);
		//ds_list_add(global.discard_deck, global.player_hand [|1]);
		//ds_list_clear(global.player_hand);
		
		//// if(discard_card_count > 180){ //wait a bit so the player sees what happened
		//	 if(cards_remain_in_deck > 0){
		//		discard_card_count = 0;
		//		global.comp_played_card = noone;
		//		chose_card = noone;
		//		global.game_state = global.state_compdeal;
		//	} else if(cards_remain_in_deck <= 0){
		//		discard_card_count = 0;
		//		chose_card = noone;
		//		global.game_state = global.state_reshuffle;
		//	//}
		//}
		////discard_card_count = 0;
		//}
		//wait_time++;

		//wait_time++;
		//bottom_x = noone;
		//bottom_y = noone;
		
		//for(i = 0; i < ds_list_size(global.discard_deck); i++){//go through the whole discard list
		//	var return_card = global.discard_deck[| ds_list_size(global.discard_deck)-1];//get a card
		//	ds_list_delete(global.discard_deck, ds_list_size(global.discard_deck)-1);//remove it from the discard list
		//	ds_list_add(global.deck, return_card);//add it back to the deck
		//	return_card.target_x = x;//set its target positions to the start position
		//	return_card.target_y = y;
		//	return_card.face_up = false;
		//	global.comp_played_card = noone;
			
		//}

		//if(wait_time > 60){//wait a bit so the player can see what happened
		//	ds_list_shuffle(global.deck);//shuffle the deck
		//	//for(i = 0; i < ds_list_size(global.deck); i ++){
		//	//	var sort_card = global.deck [|i]; 
		//	//	sort_card.target_x = x;
		//	//	sort_card.target_y = y;
		//	//	sort_card.target_depth = y - i*2;
		//	global.game_state = global.state_compdeal;	
		//	wait_time = 0;
		//	//wait_time = room_speed;
		////}
		//}
	//			end_timer ++;
				
				//if (wait_time <= 0) {		
		//	var num_discarded_cards = ds_list_size(global.discard_deck);
		//	if (num_discarded_cards > 0) {
		//		var cards_to_return = global.discard_deck[| 0];
		//		bottom_y += 2;
		//		cards_to_return.target_x = bottom_x;
		//		cards_to_return.target_y = bottom_y;
		//		cards_to_return.target_depth = global.deck[| 0].depth + 1;
		//		ds_list_insert(global.deck, 0, cards_to_return);
		//		ds_list_delete(global.discard_deck, 0);
		//		wait_time = .2*room_speed;
		//	} else {
		//		wait_time = room_speed;
		//		bottom_x = global.deck[| 0].x;
		//		bottom_y = global.deck[| 0].y;;
		//		global.game_state = global.state_compdeal;	
		//	}		
		//}
