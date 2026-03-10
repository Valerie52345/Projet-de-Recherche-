a = noone;
b = noone;
//Le flash et glitch c'est l'effet visuel dans les fils se connectent à une prise
flash_timer = 0;
flash_max = 12; 
wire_thickness = 6;
glitch_amp = 6;    
glitch_slices = 6;


//ça c'est l'animation où le fil s'allonge, preview est caché par la prise électrique sur laquelle elle spawn
//delay pour laisser le temps au joueur de réagir
// et grow pour la durée de l'étirement (donc techniquement la vitesse aussi)
preview_len = 10;        
delay_frames = room_speed * 1;
grow_frames  = room_speed * 0.25;
//Comme pour l'attaque 3, ces fils ont 3 états: preview(expliqué en haut)
//grow (l'animation où il grandit) et full qui est évidemment l'état final
t = 0;
state = 0;

//On récupère le sprite voulu (celui au bout du fil)
plug_sprite = sWire;
plug_offset = 0;
