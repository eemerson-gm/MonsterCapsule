/// @description Encounter - Overlay.

//Inherit the parent event.
event_inherited();

//Gets the sprites for the character and monsters.
var spr_character		= asset_get_index("spr_character_walk_" + battle_character);
var spr_monster_1		= asset_get_index("spr_monster_walk_" + battle_monster_1);
var spr_monster_2		= asset_get_index("spr_monster_walk_" + battle_monster_2);
var spr_index			= current_time / 300;

//Draws the character and monster.
draw_sprite(spr_character, spr_index, 48 + 8, 96 + 8);
draw_sprite(spr_monster_1, spr_index, 64 + 8, 96 + 8);

//Draws the opposing monsters.
draw_sprite_ext(spr_monster_2, spr_index, 256 + 8, 96 + 8, -1, 1, 0, c_white, 1);