x += lengthdir_x(speed_value, dir_value);
y += lengthdir_y(speed_value, dir_value);

image_angle = dir_value;

// destruction quand ça sort de la battlebox
var left   = box.x - box.sprite_width / 2;
var right  = box.x + box.sprite_width / 2;
var top    = box.y - box.sprite_height / 2;
var bottom = box.y + box.sprite_height / 2;

var margin_x = box.sprite_width * 0.5;
var margin_y = box.sprite_height * 0.5;

if (x < left - margin_x || x > right + margin_x || y < top - margin_y || y > bottom + margin_y)
{
    instance_destroy();
}