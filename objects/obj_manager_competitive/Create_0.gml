//set variables
randomize ();
global.num_cards = 48;


global.deck = ds_list_create();
global.discard_deck = ds_list_create();
global.player_hand = ds_list_create();
global.comp_hand = ds_list_create();

global.player_played_card = noone;
global.player_hovered_card = noone;
global.comp_played_card = noone;
global.peek_card = noone;
global.cards_on_the_table = ds_list_create();

global.player_score = 0;
global.comp_score = 0;

global.state_player_deal = 0;
global.state_reshuffle = 1;
global.state_match = 2;
global.state_reveal = 3
global.state_clean_up = 4;
global.state_compdeal = 5;
global.state_play = 6;
global.state_discard = 7;
global.state_compplay = 8;
global.state_reshuffle2 = 9;
global.state_moveup = 10;
global.state_peek = 11;
global.state_intro = 12;

global.game_state = global.state_intro;

restart_card_count = 0;
discard_card_count = -5;
card_yyy = 0;
card_yyyy = 0;
order = 0
final_restart_count = 0;
current_card = 0;
chose_card = false;
count_time = 0;
myTime = 5.0;
ShowText = false;
alreadyChoosen = false;

//set numbers for each type of card
rock = 0;
scissor = 0;
paper = 0;

var card_y = 0;
for (var i=0 ; i<48 ; i++){
 card_y += 2;
 
var new_card = instance_create_layer(x,y+150,"Instances",obj_card);
new_card.target_x = x;
new_card.target_y = y +150+card_y;
new_card.face_up = false;
new_card.letclick = false;
new_card.in_hand = false;
//new_card.in_comp_hand = false;
new_card.depth = card_y;
if (rock <= 16) {
	rock += 1;
    new_card.card_type = global.rock;
  } else if (scissor <= 16){
	scissor += 1;
    new_card.card_type = global.scissor;
  } else {
	paper+=1;
	new_card.card_type = global.paper;
	}  
	ds_list_add(global.deck, new_card);
}


//random shuffle
ds_list_shuffle(global.deck);

var card_yy = 0;

for (i=0; i< ds_list_size(global.deck)-1; i++){
 card_yy += 2;
 new_card = global.deck[| i];
 new_card.target_y = y + 150-card_yy;
 new_card.depth = -card_yy;
}


//card deal from top

for (var i = 0; i < global.num_cards; i++) {
	global.deck[| i].x = x;
	global.deck[| i].y = y - 2*i;
	global.deck[| i].target_x = global.deck[| i].x;
	global.deck[| i].target_y = global.deck[| i].y;
	global.deck[| i].target_depth = global.num_cards - i;
}

wait_time = 0;
bottom_x = global.deck[| 0].x;
bottom_y = global.deck[| 0].y;


for(i = 0; i< ds_list_size(global.deck); i ++){
	var sort_card = global.deck[|i];
	sort_card.target_x = x;
	sort_card.target_y = y -i*2
	sort_card.target_depth = -i*2;
	
}
