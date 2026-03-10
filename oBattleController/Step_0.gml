if (battle_finished) exit;

// vérifier que l'instance (rappel que l'instance est un élément dans la scène comme un calque)
//sonore existe encore
if (music_inst == noone || !audio_is_playing(music_inst))
{
    if (!battle_finished)
    {
        battle_finished = true;
        end_battle();
    }
    exit;
}

//quand la musique se finit le combat se finit aussi
battle_time = audio_sound_get_track_position(music_inst);


if (!audio_is_playing(music_inst) && !battle_finished)
{
    battle_finished = true;
    end_battle();
}
//test pour voir les secondes (Je le garde au cas où) 
if (keyboard_check_pressed(ord("T")))
{
    show_debug_message("battle_time = " + string(battle_time));
}
if (!battle_finished)
{
    var new_index = -1;

    for (var i = 0; i < array_length(attacks); i++)
    {
        var start_t = attacks[i][0];
        var end_t   = attacks[i][1];

        if (battle_time >= start_t && battle_time < end_t)
        {
            new_index = i;
            break;
        }
    }

    if (new_index != current_attack_index)
    {
        if (instance_exists(attack_instance))
            instance_destroy(attack_instance);

        current_attack_index = new_index;

        if (current_attack_index != -1)
        {
            var obj_attack = attacks[current_attack_index][2];
            attack_instance = instance_create_layer(0, 0, "Instances", obj_attack);
			//Encore un truc pour s'assurer que tout roule bien
			show_debug_message("Attaque en ce moment: " + string(obj_attack));

        }
        else
        {
            attack_instance = noone;
        }
    }
}