//Ce code est le coeur de tout ce qui se passe quand on est en combat
//Réutilisé pour définir quel est l'ennemi
enemy_type = global.battle_enemy_type;

//MUSIQUE
// valeur par défaut pour éviter undefined 
//(mais comme vous pouvez le voir ça change selon enemy type)
current_music = snd_timee_theme;

if (enemy_type == "timee")
{
    current_music = snd_timee_theme;
}
else if (enemy_type == "finalboss")
{
    current_music = snd_finalboss_theme;
}
//l'instance pour aider
music_inst = audio_play_sound(current_music, 1, false);

//définir le timer
battle_time = 0;

//pour définir l'état d'attaque
current_attack_index = -1;
attack_instance = noone;

//Le coeur de la gestion d'attaque (début, fin et appel l'objet contenant l'attaque)

if (enemy_type == "timee")
{
    attacks = [
        [ 0,   22,  oTimee_Attack1_Tutorial ],
        [ 22,  36,  oTimee_Attack2_DVD ],
        [ 36,  54,  oTimee_Attack3_TPose ],
        [ 54,  75,  oTimee_Attack4_Electric ],
        [ 75,  83,  oTimee_Attack5_Warning ],
        [ 83,  120, oTimee_Attack6_Combo ],
        [ 120, 138, oTimee_Attack7_End ]
    ];
}
else if (enemy_type == "finalboss")
{
    attacks = [
        [ 0,  10,  oFinalBoss_Attack1_MissileRain ],
        [ 10, 25,  oFinalBoss_Attack2_RotatingCross ],
        [ 25, 40,  oFinalBoss_Attack3_ShootingStar ],
        [ 40, 55,  oFinalBoss_Attack4_CornerTarget ],
        [ 55, 74.04,  oFinalBoss_Attack5_GalaxyBloom ]
    ];
}
current_attack_index = -1;
attack_instance = noone;

//détermine le nombre de vie du joueur (évidemment)
player_lives = 3;

//Ce qui se passe si le combat est fini (incluant le game over)
battle_finished = false;
function end_battle()
{
    audio_stop_all();

    if (player_lives > 0)
    {
        if (enemy_type == "timee")
        {
            global.timee_defeated = true;
            room_goto(global.battle_return_room);
        }
        else if (enemy_type == "finalboss")
        {
            room_goto(rm_ending);
        }
    }
    else
    {
        room_goto(rm_gameover);
    }
}
//Au cas où (c'est l'équivalent d'un console log)
show_debug_message("Combat contre" + string(enemy_type));