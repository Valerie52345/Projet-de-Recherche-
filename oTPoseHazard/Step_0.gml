var half_w = (sprite_width * image_xscale) / 2;
var half_h = (sprite_height * image_yscale) / 2;

var left   = box.x - box.sprite_width / 2 + half_w;
var right  = box.x + box.sprite_width / 2 - half_w;
var top    = box.y - box.sprite_height / 2 - half_h;
var bottom = box.y + box.sprite_height / 2 + half_h + 94;

//État 0= bouge en x en dehors de la zone
if (state == 0)
{
    x += xspd;

    if (x <= left)
    {
        x = left;
        xspd = abs(xspd);
    }
    else if (x >= right)
    {
        x = right;
        xspd = -abs(xspd);
    }

    move_timer -= 1;
    if (move_timer <= 0)
    {
        state = 1;
        pause_timer = round(room_speed * 2);
    }
}

//État 1 = attend quelque seconde
else if (state == 1)
{
    pause_timer -= 1;

    if (pause_timer <= 0)
    {
        state = 2;
    }
}

// État 2 = monte en y (offensif)
else if (state == 2)
{
	
    y -= yspd;

    if (y <= top)
    {
        y = top;
        state = 3;
    }
}


// État 4 = redescend et on reccommence le cycle
else if (state == 3)
{
    y += yspd;

    if (y >= bottom)
    {
        y = bottom;

        state = 0;
        move_timer = irandom_range(room_speed * 1, room_speed * 2);
        xspd = choose(-3, 3);
    }
}