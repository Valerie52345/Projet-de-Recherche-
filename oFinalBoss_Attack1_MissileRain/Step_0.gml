spawn_timer -= 1;

if (spawn_timer <= 0)
{
    var left  = box.x - box.sprite_width / 2 + 8;
    var right = box.x + box.sprite_width / 2 - 8;
    var top   = box.y - box.sprite_height / 2 - 10;

    //les fait spawn à un x aléatoire
    var b = instance_create_layer(irandom_range(left, right), top, "Instances", oBossBullet);

    //invoque le sprite de missile
    b.sprite_index = sBossMissile;

    b.dir_value = 270;

    //vitesse aléatoire
    b.speed_value = random_range(1.8, 3.6);

    spawn_timer = spawn_delay;
}