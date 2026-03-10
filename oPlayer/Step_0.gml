// =======================
// INPUT
// =======================
down_key  = keyboard_check(vk_down);
up_key    = keyboard_check(vk_up);
right_key = keyboard_check(vk_right);
left_key  = keyboard_check(vk_left);

// Variables pour contrôler la vitesse
xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;



// collision (de façon que le sprite ne fusionne pas avec les collisions)

if (!place_meeting(x + xspd, y, oCollisionMur)) {
    x += xspd;
} else {

    while (!place_meeting(x + sign(xspd), y, oCollisionMur)) {
        x += sign(xspd);
    }
    xspd = 0;
}
if (place_meeting(x, y, oTimee)) 
{
    scr_start_battle("timee", x, y);
	audio_stop_all();
}
if (place_meeting(x, y, oFinalBoss))
{
    scr_start_battle("finalboss", x, y);
	audio_stop_all();
}


if (!place_meeting(x, y + yspd, oCollisionMur)) {
    y += yspd;
}

else {
    while (!place_meeting(x, y + sign(yspd), oCollisionMur)) {
        y += sign(yspd);
    }
    yspd = 0;
}

// animations de marche de tous les côtésss
if (xspd > 0) {
    sprite_index = sSpriteRight;
}
else if (xspd < 0) {
    sprite_index = sSpriteLeft;
}
else if (yspd > 0) {
    sprite_index = sSpriteDown;
}
else if (yspd < 0) {
    sprite_index = sSpriteUp;
}

if (xspd != 0 || yspd != 0) {
    image_speed = 1;
} else {
    image_speed = 0;
    image_index = 0;
}
