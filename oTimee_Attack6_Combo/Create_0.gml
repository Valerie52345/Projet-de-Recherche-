box = instance_find(oBattleBox, 0);
//Cette attaque demande juste de recycler des anciennes attaques
// donc il faut juste les invoquer un par un
dvd = instance_create_layer(box.x, box.y, "Instances", oDVDHazard);
tpose = instance_create_layer(box.x, box.y, "Instances", oTPoseHazard);
electric = instance_create_layer(box.x, box.y, "Instances", oTimee_Attack4_Electric);