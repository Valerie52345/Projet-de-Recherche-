var box = instance_find(oBattleBox, 0);

var base_y = room_height - 12;

var bar_color = make_color_rgb(81,38,0);
var half = bar_count div 2;

var center_x = box.x;

for (var i = 0; i < half; i++)
{
    var bh = bar_heights[i];

    var offset = (bar_width + bar_spacing) * (i + 1);

    // gauche
    var lx = center_x - offset;
    draw_set_color(bar_color);
    draw_rectangle(lx, base_y - bh, lx + bar_width, base_y, false);

    // droite
    var rx = center_x + offset - bar_width;
    draw_rectangle(rx, base_y - bh, rx + bar_width, base_y, false);
}

draw_set_color(c_white);