shoot_timer -= 1;

if (shoot_timer <= 0)
{
    var left   = box.x - box.sprite_width / 2;
    var right  = box.x + box.sprite_width / 2;
    var top    = box.y - box.sprite_height / 2;
    var bottom = box.y + box.sprite_height / 2;

    var margin = 8;

    //positions des 4 coins
    var corner_x = [ left + margin, right - margin, left + margin, right - margin ];
    var corner_y = [ top + margin, top + margin, bottom - margin, bottom - margin ];

    //vise le joueur au moment du tir (AKA j'enregistre la position que le joueur avait à ce moment là)
    var p = instance_find(oPlayerBattle, 0);

    if (instance_exists(p))
    {
        for (var i = 0; i < 4; i++)
        {
            var dir = point_direction(corner_x[i], corner_y[i], p.x, p.y);

            var b = instance_create_layer(corner_x[i], corner_y[i], "Instances", oBossBullet);
            b.sprite_index = sBossMissile; 
            b.dir_value = dir;
            b.speed_value = random_range(1.3, 2.6);
        }
    }

    shoot_timer = shoot_delay;
}