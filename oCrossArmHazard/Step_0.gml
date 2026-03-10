// collision manuelle avec le joueur
var p = instance_find(oPlayerBattle, 0);
if (!instance_exists(p)) exit;

// segment de la ligne
var x1 = center_x - lengthdir_x(arm_length, arm_angle);
var y1 = center_y - lengthdir_y(arm_length, arm_angle);

var x2 = center_x + lengthdir_x(arm_length, arm_angle);
var y2 = center_y + lengthdir_y(arm_length, arm_angle);

// distance point -> segment
var px = p.x;
var py = p.y;

var abx = x2 - x1;
var aby = y2 - y1;

var apx = px - x1;
var apy = py - y1;

var ab_len2 = abx * abx + aby * aby;
var t = 0;

if (ab_len2 > 0)
{
    t = (apx * abx + apy * aby) / ab_len2;
    t = clamp(t, 0, 1);
}

var cx = x1 + abx * t;
var cy = y1 + aby * t;

var dist2 = (px - cx) * (px - cx) + (py - cy) * (py - cy);

if (dist2 <= (arm_thickness * 0.5) * (arm_thickness * 0.5))
{
    with (p) { take_damage(); }
}