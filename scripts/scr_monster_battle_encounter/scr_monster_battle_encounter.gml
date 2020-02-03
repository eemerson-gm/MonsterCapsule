
///@param monster object

//Gets the monster information from the grid.
var monster_object		= argument0;
var monster_id			= scr_monster_get_id(monster_object);
var monster_health		= global_monster_grid[# monster_info.max_health, monster_id];
var monster_level		= global_monster_grid[# monster_info.level, monster_id];
var monster_attack		= global_monster_grid[# monster_info.attack, monster_id];
var monster_speed		= global_monster_grid[# monster_info.speed, monster_id];

//Creates the battle object with the encountered monster.
with instance_create_layer(0, 0, layer_get_id("Instances_Overlay"), oBattleEncounter){

	//Selects random values between ranges of monster stats.
	var rand_monster_health		= irandom_range(monster_health - floor(monster_health / 3), monster_health);
	var rand_monster_level		= irandom_range(monster_level - floor(monster_level / 4), monster_level);
	var rand_monster_attack		= irandom_range(monster_attack - floor(monster_attack / 2), monster_attack);
	var rand_monster_speed		= irandom_range(monster_speed - floor(monster_speed / 2), monster_speed);
	var rand_monster_type		= (irandom_range(1, 255) == 1);
	
	//Selects the randoms stats for the monster based on info.
	battle_monster_grid[# monster_party.object, BATTLE_MONSTER_OTHER]		= monster_object;
	battle_monster_grid[# monster_party.cur_health, BATTLE_MONSTER_OTHER]	= rand_monster_health;
	battle_monster_grid[# monster_party.max_health, BATTLE_MONSTER_OTHER]	= rand_monster_health;
	battle_monster_grid[# monster_party.level, BATTLE_MONSTER_OTHER]		= rand_monster_level;
	battle_monster_grid[# monster_party.attack, BATTLE_MONSTER_OTHER]		= rand_monster_attack;
	battle_monster_grid[# monster_party.speed, BATTLE_MONSTER_OTHER]		= rand_monster_speed;
	battle_monster_grid[# monster_party.type, BATTLE_MONSTER_OTHER]			= rand_monster_type;
	
	//Defines the character and monster sprites.
	battle_character	= "blue";
	battle_monster_1	= string_lower(scr_monster_get_name(battle_monster_grid[# monster_party.object, BATTLE_MONSTER_SELF]));
	battle_monster_2	= string_lower(scr_monster_get_name(battle_monster_grid[# monster_party.object, BATTLE_MONSTER_OTHER]));
	
}

//Goes to the battle room.
room_goto(room_battle_plains);