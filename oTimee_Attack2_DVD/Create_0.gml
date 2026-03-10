box = instance_find(oBattleBox, 0);

var left   = box.x - box.sprite_width / 2;
var right  = box.x + box.sprite_width / 2;
var top    = box.y - box.sprite_height / 2;
var bottom = box.y + box.sprite_height / 2;

// on prend la taille du sprite DVD
var half_w = sprite_get_width(sDvd) / 2;
var half_h = sprite_get_height(sDvd) / 2;



var spawn_x  = left + half_w;
var spawn_y= top + half_h;



dvd = instance_create_layer(spawn_x, spawn_y, "Instances", oDVDHazard);