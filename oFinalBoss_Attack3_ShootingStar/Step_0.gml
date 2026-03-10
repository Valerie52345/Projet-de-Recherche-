spawn_timer -= 1;

if (spawn_timer <= 0)
{
    var left   = box.x - box.sprite_width / 2;
    var right  = box.x + box.sprite_width / 2;
    var top    = box.y - box.sprite_height / 2;
    var bottom = box.y + box.sprite_height / 2;

    // spawn depuis la droite, hauteur aléatoire
    var sy = irandom_range(top + 12, bottom - 12);
    var star = instance_create_layer(right + 24, sy, "Instances", oShootingStarHead);

    // direction principale vers la gauche
    star.base_dir = 180;
    star.move_speed = random_range(4, 5.5);
    star.wave_amount = random_range(10, 22);




    spawn_timer = spawn_delay;
}