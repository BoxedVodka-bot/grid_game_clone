
switch (global.game_state) {
	
	case global.state_intro:
		ShowText = true;
		global.xBox = room_width/2;
		global.yBox = room_height/2;
		if(keyboard_check_pressed(vk_space)){
			global.game_state = global.state_compdeal;
			ShowText = false;
		}
	
	break;
	
	case global.state_compdeal:
	//deal AI hand
		wait_time++;
		if (wait_time >= 20) {
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
		
		if(wait_time >=20){
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
		//discard hands into the discard pile
	
	letclick = false;
		 
		wait_time++;

		var cards_remain_in_deck = ds_list_size(global.deck);
		for(i = 0; i < ds_list_size(global.player_hand); i++){ 
			var return_card = global.player_hand[| i]; 
			audio_play_sound(snd_flip, 1 ,false);
			return_card.target_x = room_width - 100; 
			return_card.target_y = y + (ds_list_size(global.discard_deck)*2);
			ds_list_add(global.discard_deck, global.player_hand[| i]); 
			return_card.target_depth = ds_list_size(global.discard_deck)*2;
		}
		for(i = 0; i < ds_list_size(global.comp_hand); i++){
			var return_card = global.comp_hand[|i];
			audio_play_sound(snd_flip, 1 ,false);
			return_card.target_x = room_width - 100;
			return_card.target_y = y + (ds_list_size(global.discard_deck)*2);
			ds_list_add(global.discard_deck, global.comp_hand[| i]); 
			return_card.target_depth = ds_list_size(global.discard_deck)*2;
		}
		ds_list_clear(global.comp_hand); 
		ds_list_clear(global.player_hand);
		if(wait_time > 60){ 
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

		break;
		
		case global.state_reshuffle:
		//move the card back to the original deck backward
		letclick = false;
		
		restart_card_count += 1; 
		 if (restart_card_count >= 2) {
			 restart_card_count = 0;
		 }
   

		 if (restart_card_count == 0) {
			if (ds_list_size(global.discard_deck)>0) {
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
