//Je change de portrait dépendamment du boss
if (global.battle_enemy_type == "timee")
{
    sprite_index = spr_timee_portrait;
}
else if (global.battle_enemy_type == "finalboss")
{
    sprite_index = spr_finalboss_portrait;
}