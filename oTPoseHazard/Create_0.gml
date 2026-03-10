box = instance_find(oBattleBox, 0);

// échelle pour que le sprite fasse environ la moitié de la battle box
image_xscale = (box.sprite_width * 0.9) / sprite_width;
image_yscale = (box.sprite_height * 0.9) / sprite_height;

//Cette attaque a 4 états (plus de détails dans Step)
state = 0; 

move_timer = irandom_range(room_speed * 1, room_speed * 2);
pause_timer = round(room_speed * 0.5);

xspd = 3;
yspd = 22;

//il doit être sous la battle box (état 1)
var bottom = box.x;


var left = box.x - box.sprite_width / 2 + (sprite_width * image_xscale) / 2;
var right = box.x + box.sprite_width / 2 - (sprite_width * image_xscale) / 2;
var below = box.y + box.sprite_height / 2 + (sprite_height * image_yscale) / 2 + 94;

x = irandom_range(left, right);
y = below;
// direction en x random
xspd = choose(-3, 3);