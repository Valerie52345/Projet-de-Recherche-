box = instance_find(oBattleBox, 0);

center_x = box.x;

center_y = box.y;

cross_angle = 0;
rotate_speed = 2.2;




shoot_timer = 0;
shoot_delay = 18;
//c'est pour la longueur (je l'ai rendu plus court parce que c'était trop difficile)
arm_length = min(box.sprite_width, box.sprite_height) * 0.32;
arm_thickness = 6;

// créer les 2 bras de la croix
arm_a = instance_create_layer(center_x, center_y, "Instances", oCrossArmHazard);
arm_b = instance_create_layer(center_x, center_y, "Instances", oCrossArmHazard);

arm_a.center_x = center_x;
arm_a.center_y = center_y;
arm_a.arm_length = arm_length;
arm_a.arm_thickness = arm_thickness;


arm_b.center_x = center_x;
arm_b.center_y = center_y;
arm_b.arm_length = arm_length;
arm_b.arm_thickness = arm_thickness;