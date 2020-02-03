/// @description Battle - Variables.

//Defines the monster battle index macros.
#macro BATTLE_MONSTER_SELF		0
#macro BATTLE_MONSTER_OTHER		1

//Defines the battle queue enumerators.
enum action{
	attack,
	defend,
	swap,
	catch,
	nothing
}

//Defines the battle monster variables.
battle_monster_grid = ds_grid_create(monster_party.length, 2);

//Defines the battle monster queues.
battle_monster_queue[BATTLE_MONSTER_SELF]			= ds_queue_create();
battle_monster_queue[BATTLE_MONSTER_OTHER]			= ds_queue_create();

//Copies the character monster statistics from the party.
ds_grid_set_grid_region(battle_monster_grid, global_monster_party, 0, 0, monster_party.length, 0, 0, 0);

//Gets the previous health of the monsters.
battle_monster_prev_health[BATTLE_MONSTER_SELF]		= battle_monster_grid[# monster_party.cur_health, BATTLE_MONSTER_SELF];
battle_monster_prev_health[BATTLE_MONSTER_OTHER]	= battle_monster_grid[# monster_party.cur_health, BATTLE_MONSTER_OTHER];

ds_queue_enqueue(battle_monster_queue[BATTLE_MONSTER_SELF], action.attack);
ds_queue_enqueue(battle_monster_queue[BATTLE_MONSTER_SELF], action.defend);
ds_queue_enqueue(battle_monster_queue[BATTLE_MONSTER_SELF], action.swap);
ds_queue_enqueue(battle_monster_queue[BATTLE_MONSTER_SELF], action.catch);
ds_queue_enqueue(battle_monster_queue[BATTLE_MONSTER_SELF], action.nothing);