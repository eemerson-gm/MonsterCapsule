
///@param monster object
///@param monster max-health
///@param monster max-experience
///@param monster max-level
///@param monster max-attack
///@param monster max-speed

//Gets the id of the monster comparing the parent monster.
var monster_id = scr_monster_get_id(argument0);

//Adds the information to the monster grid.
global_monster_grid[# monster_info.name, monster_id]			= string_copy(object_get_name(argument0), 2, string_length(object_get_name(argument0)) - 1);
global_monster_grid[# monster_info.max_health, monster_id]		= argument1;
global_monster_grid[# monster_info.experience, monster_id]		= argument2;
global_monster_grid[# monster_info.level, monster_id]			= argument3;
global_monster_grid[# monster_info.attack, monster_id]			= argument4;
global_monster_grid[# monster_info.speed, monster_id]			= argument5;