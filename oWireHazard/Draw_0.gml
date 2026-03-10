if (!instance_exists(a) || !instance_exists(b)) exit;
var ax = a.x, ay = a.y;
var bx = b.x, by = b.y;

var total_len = point_distance(ax, ay, bx, by);
var ang = point_direction(ax, ay, bx, by);

//dessiner la version actuelle du fil
var active_len = (state == 0) ? min(preview_len, total_len) : (total_len * t);

// endpoint actuel du fil
var cx = ax + lengthdir_x(active_len, ang);
var cy = ay + lengthdir_y(active_len, ang);

//dessiner le fil normal
draw_set_alpha(1);
draw_line_width(ax, ay, cx, cy, wire_thickness);

//effet visuel glitch (déjà expliquée)
if (flash_timer > 0)
{
    var k = flash_timer / flash_max;
    var amp = glitch_amp * k;
    var segs = glitch_slices;

    for (var i = 0; i < segs; i++)
    {
        var t0 = i / segs;
        var t1 = (i + 1) / segs;

        var x0 = lerp(ax, cx, t0);
        var y0 = lerp(ay, cy, t0);
        var x1 = lerp(ax, cx, t1);
        var y1 = lerp(ay, cy, t1);

        var ox = random_range(-amp, amp);
        var oy = random_range(-amp * 0.4, amp * 0.4);

        draw_set_alpha(0.9 * k);
        draw_line_width(x0 + ox, y0 + oy, x1 + ox, y1 + oy, wire_thickness + 8 * k);

        if (i mod 3 == 0)
        {
            draw_set_alpha(0.4 * k);
            draw_line_width(x0 - ox, y0 - oy, x1 - ox, y1 - oy, wire_thickness + 3 * k);
        }
    }

    draw_set_alpha(0.9 * k);
    for (var j = 0; j < 5; j++)
    {
        var rx = cx + random_range(-amp, amp);
        var ry = cy + random_range(-amp, amp);
        draw_rectangle(rx - 2, ry - 1, rx + 8, ry + 1, false);
    }
}

//faire appaitre le sprite de plug au bout
draw_set_alpha(1);
if (plug_sprite != noone)
{
    draw_sprite_ext(plug_sprite, 0, cx, cy, 1, 1, ang, c_white, 1);
}
draw_set_alpha(1);