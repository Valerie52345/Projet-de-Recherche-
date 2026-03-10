var x1 = center_x - lengthdir_x(arm_length, arm_angle);
var y1 = center_y - lengthdir_y(arm_length, arm_angle);

var x2 = center_x + lengthdir_x(arm_length, arm_angle);
var y2 = center_y + lengthdir_y(arm_length, arm_angle);

draw_line_width(x1, y1, x2, y2, arm_thickness);