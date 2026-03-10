if (!instance_exists(owner))
{
    instance_destroy();
    exit;
}

// détecter le mouvement de oPlayerBattle
x = owner.x;
y = owner.y;

move_x = x - prev_x;
move_y = y - prev_y;

var moving = (abs(move_x) > 0.01 || abs(move_y) > 0.01);

//Je m'inspire de Just Shapes and Beats avec un sprite qui a un mouvement très squishy
//<ca donne un effet que j'adore
var target_xscale = 1;
var target_yscale = 1;

// mouvement horizontal
if (abs(move_x) > abs(move_y))
{
    if (abs(move_x) > 0.01)
    {
        target_xscale = 1.18;
        target_yscale = 0.82;
		
    }
}
// mouvement vertical
else if (abs(move_y) > 0.01)
{
    target_xscale = 0.82;
    target_yscale = 1.18;
}

// lissage du stretch
stretch_x = lerp(stretch_x, target_xscale, 0.25);
stretch_y = lerp(stretch_y, target_yscale, 0.25);

//bounce quand immobile
if (!moving)
{
	
    idle_bounce += 0.18;
}
else
{
    idle_bounce = 0;
}

var bounce_scale_y = 1;
var bounce_scale_x = 1;

if (!moving)
{
    bounce_scale_y = 1 + sin(idle_bounce) * 0.04;
    bounce_scale_x = 1 - sin(idle_bounce) * 0.04;
}

image_xscale = base_xscale * stretch_x * bounce_scale_x;
image_yscale = base_yscale * stretch_y * bounce_scale_y;

//pour faire une trail
if (moving)
{
    trail_timer -= 1;

    if (trail_timer <= 0)
    {
        var t = instance_create_layer(x, y, "Instances", oPlayerTrail);
        t.sprite_index = sprite_index;
        t.image_index = image_index;
        t.image_xscale = image_xscale;
        t.image_yscale = image_yscale;


        trail_timer = 3; 
    }
	
}

else
{
    trail_timer = 0;
}

//pour mémoriser
prev_x = x;
prev_y = y;