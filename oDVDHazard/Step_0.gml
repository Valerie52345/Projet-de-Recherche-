x += hs;
y += vs;

//explique au DVD la limite de la battle box
var left   = box.x - box.sprite_width / 2 + sprite_width / 2;
var right  = box.x + box.sprite_width / 2 - sprite_width / 2;
var top    = box.y - box.sprite_height / 2 + sprite_height / 2;
var bottom = box.y + box.sprite_height / 2 - sprite_height / 2;




// rebonds
if (x < left)
{
    x = left;
    hs = abs(hs);
}

else if (x > right)
{
    x = right;
    hs = -abs(hs);
}



if (y < top)
{
    y = top;
    vs = abs(vs);
}

else if (y > bottom)
{
    y = bottom;
    vs = -abs(vs);
}