//Pour éviter les erreurs
if (!instance_exists(a) || !instance_exists(b))
{
    instance_destroy();
    exit;
}

//Les states ont été expliqué dans create
if (state == 0) 
{
    delay_frames--;
    if (delay_frames <= 0)
    {
        state = 1;
        t = 0;
    }
}
else if (state == 1) 
{
    t += 1 / max(1, grow_frames);
    if (t >= 1)
    {
        t = 1;
        state = 2;
		    flash_timer = flash_max;

    }
}

//Pour l'effet visuel
if (flash_timer > 0) flash_timer--;
var p = instance_find(oPlayerBattle, 0);
if (!instance_exists(p)) exit;

//pour la longueur active du fil
var ax = a.x, ay = a.y;
var bx = b.x, by = b.y;

//direction et longueur totale
var dx = bx - ax;
var dy = by - ay;
var total_len = point_distance(ax, ay, bx, by);

var active_len;

//l'état preview
if (state == 0)
{
    active_len = min(preview_len, total_len);
}
else
{
    //l'état grow
    active_len = total_len * t;
}

// si active_len est trop petit, pas de dégâts (juste un repère visuel)
if (active_len < 4) exit;

// point B "actuel" du segment
var ang = point_direction(ax, ay, bx, by);
var cx = ax + lengthdir_x(active_len, ang);
var cy = ay + lengthdir_y(active_len, ang);

//pour clarifier p c'est le player donc px et py sont le x de celui-ci
//Le A c'est la tête, le H c'est la partie fil et le C c'est la queue
var px = p.x, py = p.y;

var abx = cx - ax;
var aby = cy - ay;

var apx = px - ax;
var apy = py - ay;

var ab_len2 = abx*abx + aby*aby;

var u = 0;

if (ab_len2 > 0)
{
    u = (apx*abx + apy*aby) / ab_len2;
    u = clamp(u, 0, 1);
}



var hx = ax + abx * u;

var hy = ay + aby * u;

var dist2 = (px - hx)*(px - hx) + (py - hy)*(py - hy);
// pour la collision du joueur
if (dist2 <= (wire_thickness*0.5)*(wire_thickness*0.5))
{
   with (p) { take_damage(); }
}