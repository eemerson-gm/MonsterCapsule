/// @description Start - Initalization.

//Randomizes events.
randomize();

//Defines the default value macros.
#macro CHARACTER_PARTY_SIZE		3

//Defines the palette color macros.
#macro COLOR_TEXT				color_fix($F4F4F4)
#macro COLOR_HUD				color_fix($1A1C2C)
#macro COLOR_HEALTH				color_fix($A7F070)
#macro COLOR_EXPERIENCE			color_fix($41A6F6)
#macro COLOR_DAMAGE				color_fix($94B0C2)
#macro COLOR_BACKGROUND			color_fix($566C86)

//Initalizes the tile slopes.
scr_tiles_init(ENTITY_TILEMAP_SIZE, spr_tileset_collision, tileset_map_collision);

//Defines the global data structures.
globalvar global_monster_party;			global_monster_party			= ds_grid_create(monster_party.length + 1, CHARACTER_PARTY_SIZE);
globalvar global_monster_grid;			global_monster_grid				= ds_grid_create(monster_info.length + 1, 1);
globalvar global_character_inventory;	global_character_inventory		= ds_priority_create();
globalvar global_item_grid;				global_item_grid				= ds_grid_create(item_info.length + 1, item_id.length + 1);

//Defines the item enumerators.
enum item_id{
	capsule_v1,
	capsule_v2,
	capsule_v3,
	length
}
enum item_info{
	name,
	sprite,
	length
}

//Adds the item information to the item grid.
scr_item_create(item_id.capsule_v1, "Capsule V.1", spr_item_capsule_v1);
scr_item_create(item_id.capsule_v2, "Capsule V.2", spr_item_capsule_v2);
scr_item_create(item_id.capsule_v3, "Capsule V.3", spr_item_capsule_v3);

//Defines the monster information enumerators.
enum monster_info{
	name,
	max_health,
	experience,
	level,
	attack,
	speed,
	length
}
enum monster_party{
	object,
	max_health,
	cur_health,
	max_experience,
	cur_experience,
	level,
	attack,
	speed,
	type,
	length
}

//Adds the monsters to the monster grid.
scr_monster_create(oSkwivel, 10, 10, 5, 2, 2);

scr_monster_party_add(0, oSkwivel, 10, 10, 5, 10, 5, 1, 2, 1);
