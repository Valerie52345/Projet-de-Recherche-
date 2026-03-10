// Le sprite change dépendamment des pv restants (le premier a 3 sprites pour faire une animation)
var current_lives = oBattleController.player_lives;

if (current_lives == 3)
{
    image_speed = 1;

    if (floor(image_index) > 3)
    {
        image_index = 0;
    }
}
else if (current_lives == 2)
{
    image_speed = 0;
    image_index = 4;
}
else if (current_lives <= 1)
{
    image_speed = 0;
    image_index = 5;
}

if (glitch_timer > 0)
{
    glitch_timer -= 1;
}