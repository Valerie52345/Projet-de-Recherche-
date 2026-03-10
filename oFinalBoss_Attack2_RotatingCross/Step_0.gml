cross_angle += rotate_speed;

//mettre à jour les "bras"
if (instance_exists(arm_a))
{
    arm_a.arm_angle = cross_angle;
}

if (instance_exists(arm_b))
{
    arm_b.arm_angle = cross_angle + 90;
}

//tirer depuis le centre
shoot_timer -= 1;

if (shoot_timer <= 0)
{
    var bullet_count = 8;

    for (var i = 0; i < bullet_count; i++)
    {
        var dir = (360 / bullet_count) * i + cross_angle;

        var b = instance_create_layer(center_x, center_y, "Instances", oBossBullet);
        b.sprite_index = sBossBulletCross;
        b.dir_value = dir;
        b.speed_value = 2.2;
    }

    shoot_timer = shoot_delay;
}