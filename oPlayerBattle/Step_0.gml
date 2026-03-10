
var h = keyboard_check(vk_right) - keyboard_check(vk_left);
var v = keyboard_check(vk_down) - keyboard_check(vk_up);

var current_speed = move_speed;
//le sprite suit la hitbox
sprite_visual.x = x;
sprite_visual.y = y;

if (keyboard_check(vk_shift))
{
    current_speed = slow_speed;
}

x += h * current_speed;
y += v * current_speed;

///se fait stop par la battlebox
var margin = 8;

x = clamp(x, oBattleBox.x - oBattleBox.sprite_width/2 + margin,
             oBattleBox.x + oBattleBox.sprite_width/2 - margin);

y = clamp(y, oBattleBox.y - oBattleBox.sprite_height/2 + margin,
             oBattleBox.y + oBattleBox.sprite_height/2 - margin);


//quand je me fais toucher: temporairement invincible
if (!can_take_damage)
{
    invincibility_timer -= 1;

    if (invincibility_timer <= 0)
    {
        can_take_damage = true;
    }
}

//effet visual quand on est touché
if (glitch_timer > 0)
{
    glitch_timer--;
glitch_timer -= 1;
    sprite_visual.x = x + random_range(-6,6);
    sprite_visual.y = y + random_range(-6,6);
}
if (place_meeting(x, y, oHazard))
{
    take_damage();
}