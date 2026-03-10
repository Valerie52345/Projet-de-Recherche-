if (glitch_timer > 0)
{
    draw_sprite_ext(sprite_index, image_index,
        x + irandom_range(-5,5),
        y + irandom_range(-5,5),
        1, 1, 0,
        c_white, 1);
}
else
{
    draw_self();
}