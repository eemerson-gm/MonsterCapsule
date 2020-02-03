
///@param party index
///@param monster object
///@param monster cur-health
///@param monster max-health
///@param monster cur-experience
///@param monster max-experience
///@param monster level
///@param monster attack
///@param monster speed
///@param monster type

//Adds the monster values to the party.
global_monster_party[# monster_party.object, argument0]				= argument1;
global_monster_party[# monster_party.cur_health, argument0]			= argument2;
global_monster_party[# monster_party.max_health, argument0]			= argument3;
global_monster_party[# monster_party.cur_experience, argument0]		= argument4;
global_monster_party[# monster_party.max_experience, argument0]		= argument5;
global_monster_party[# monster_party.level, argument0]				= argument6;
global_monster_party[# monster_party.attack, argument0]				= argument7;
global_monster_party[# monster_party.speed, argument0]				= argument8;
global_monster_party[# monster_party.type, argument0]				= argument9;