if (glitch_timer > 0)
{
    draw_sprite_ext(sprite_index, image_index,
        x + irandom_range(-2,2), y + irandom_range(-2,2),
        image_xscale, image_yscale,
        0, c_white, 1);

    draw_sprite_ext(sprite_index, image_index,
        x + irandom_range(-1,1), y + irandom_range(-1,1),
        image_xscale, image_yscale,
        0, c_white, 1);
}
else
{
    draw_sprite_ext(sprite_index, image_index,
        x, y,
        image_xscale, image_yscale,
        0, c_white, 1);
}