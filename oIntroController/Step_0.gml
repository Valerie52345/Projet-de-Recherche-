//On appuie sur Z pour aller à la page RPG
if (keyboard_check_pressed(ord("Z")))
{
    audio_stop_all();
    room_goto(rm_RPG);
}
