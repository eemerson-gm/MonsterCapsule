/// @description Battle - Overlay.

//Draws the main font.
draw_set_font(font_main);

//Gets the monster health and visual drop speed.
var monster_health_self		= battle_monster_grid[# monster_party.cur_health, BATTLE_MONSTER_SELF];
var monster_health_other	= battle_monster_grid[# monster_party.cur_health, BATTLE_MONSTER_OTHER];
var monster_health_drop		= 0.05;

//Approaches the current health from the previous.
battle_monster_prev_health[BATTLE_MONSTER_SELF]		= lerp(battle_monster_prev_health[BATTLE_MONSTER_SELF], monster_health_self, monster_health_drop);
battle_monster_prev_health[BATTLE_MONSTER_OTHER]	= lerp(battle_monster_prev_health[BATTLE_MONSTER_OTHER], monster_health_other, monster_health_drop);

//Gets the position of the monster statistics.
var stats_self_x1		= 0;
var stats_self_y1		= 4;
var stats_other_x1		= 236;
var stats_other_y1		= 4;

//Draws the character's personal health statistics.
scr_monster_draw_stats(stats_self_x1, stats_self_y1, battle_monster_prev_health[BATTLE_MONSTER_SELF], battle_monster_grid, BATTLE_MONSTER_SELF);
scr_monster_draw_stats(stats_other_x1, stats_other_y1, battle_monster_prev_health[BATTLE_MONSTER_OTHER], battle_monster_grid, BATTLE_MONSTER_OTHER);

//Gets the option selection options.
var options_action;
options_action[action.attack]	= "Attack";
options_action[action.defend]	= "Defend";
options_action[action.swap]		= "Swap";
options_action[action.catch]	= "Catch";
options_action[action.nothing]	= "Nothing";

//Draws the font alignment.
draw_set_halign(fa_left);

//Draws the queue action selection.
for(var a = 0; a < array_length_1d(options_action); a++){
	
	//Gets the position of the options box.
	var action_x1		= stats_self_x1;
	var action_y1		= stats_self_y1 + 22 + (a * 12);
	var action_x2		= stats_self_x1 + 84;
	var action_y2		= stats_self_y1 + 32 + (a * 12);
	
	//Draws the option background.
	draw_set_color(COLOR_HUD);
	draw_rectangle(action_x1, action_y1, action_x2, action_y2, false);
	
	//Draws the selection options.
	draw_set_color(COLOR_TEXT);
	draw_sprite(spr_overlay_battle_icons, a, action_x1 + 2, action_y1 + 2);
	draw_text(action_x1 + 12, action_y1 + 2, options_action[a]);
	
}


//Gets the position of the self monster queue.
var queue_self_x1		= stats_self_x1 + 86;
var queue_self_y1		= stats_self_y1;
var queue_self_x2		= stats_self_x1 + 140;
var queue_self_y2		= stats_self_y1 + 14;

//Draws the battle queue for each monster.
draw_set_color(COLOR_HUD);
draw_rectangle(queue_self_x1, queue_self_y1, queue_self_x2, queue_self_y2, false);

//Passes the queue to a temporary queue.
var temp_queue_1 = ds_queue_create();
ds_queue_copy(temp_queue_1, battle_monster_queue[BATTLE_MONSTER_SELF])

//Draws the battle queue labels.
for(var a = 0; a < ds_queue_size(battle_monster_queue[BATTLE_MONSTER_SELF]); a++){
	
	//Draws the label in the queue.
	draw_sprite(spr_overlay_battle_icons, ds_queue_head(temp_queue_1), queue_self_x1 + (a * 10) + 4, queue_self_y1 + 4);
	
	//Removes the head from the queue.
	ds_queue_dequeue(temp_queue_1);
	
}

//Destroys the temp queue.
ds_queue_destroy(temp_queue_1);