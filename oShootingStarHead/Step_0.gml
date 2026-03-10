wave_timer += 0.18;

//fait un zigzag
var current_dir = base_dir + sin(wave_timer) * wave_amount;

x += lengthdir_x(move_speed, current_dir);
y += lengthdir_y(move_speed, current_dir);

image_angle = current_dir;

//fait le "bullet trail"
trail_timer -= 1;

if (trail_timer <= 0)
{
    var b = instance_create_layer(x, y, "Instances", oBossBullet);
    b.sprite_index = sBossBulletStartrail;
    b.dir_value = current_dir + 180;
    b.speed_value = 1.2;

    trail_timer = trail_delay;
}

//les détruit hors de la battlebox
var left   = box.x - box.sprite_width / 2;
var right  = box.x + box.sprite_width / 2;
var top    = box.y - box.sprite_height / 2;
var bottom = box.y + box.sprite_height / 2;

var margin = 40;

if (x < left - margin || x > right + margin || y < top - margin || y > bottom + margin)
{
    instance_destroy();
}