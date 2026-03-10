
slow_speed = 1.5;
move_speed = 4.3;

sprite_visual = instance_create_layer(x, y, "Instances", oPlayerSprite);
sprite_visual.owner = id;

can_take_damage = true;
invincibility_timer = 0;

glitch_timer = 0;
function take_damage()
{
    if (!can_take_damage) return;

    audio_play_sound(snd_player_hit, 1, false);

    can_take_damage = false;
    invincibility_timer = room_speed * 3;
    glitch_timer = 20;

    with (oPortrait)
    {
        glitch_timer = 12;
    }

    with (oBattleController)
    {
        player_lives -= 1;

        if (player_lives <= 0)
        {
            end_battle();
        }
    }
}
mask_index = sPlayerFight;
//au cas où c'est lui qui s'affiche au lieu de oPlayerSprite
visible = false; 