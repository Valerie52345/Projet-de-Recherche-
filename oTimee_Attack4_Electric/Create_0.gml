box = instance_find(oBattleBox, 0);

phase_seconds = 2.2; // toutes les 1.2s on refresh
phase_timer = round(room_speed * phase_seconds);

outlets = [];
wires = [];

spawn_phase();

function spawn_phase()
{
    var left   = box.x - box.sprite_width/2 + 12;
    var right  = box.x + box.sprite_width/2 - 12;
    var top    = box.y - box.sprite_height/2 + 12;
    var bottom = box.y + box.sprite_height/2 - 12;

    //ça fait apparaitre 4 prises électriques dans la battlebox (en invoquand l'objet)
    outlets = [];
    for (var i = 0; i < 4; i++)
    {
        var ox = irandom_range(left, right);
        var oy = irandom_range(top, bottom);

        var o = instance_create_layer(ox, oy, "Instances", oOutlet);
        array_push(outlets, o);
    }

    //les 2 fils électrique se connectent sur une prise random
    wires = [];

    for (var w = 0; w < 2; w++)
    {
        var ia = irandom_range(0, array_length(outlets)-1);
        var ib = irandom_range(0, array_length(outlets)-1);
        while (ib == ia)
        {
            ib = irandom_range(0, array_length(outlets)-1);
        }

        var wire = instance_create_layer(0, 0, "Instances", oWireHazard);
        wire.a = outlets[ia];
        wire.b = outlets[ib];

        array_push(wires, wire);
    }
}
//je détruis les fils et les prises dans la dernière étape
function cleanup_phase()
{
   
   
    for (var i = 0; i < array_length(wires); i++)
    {
        if (instance_exists(wires[i])) instance_destroy(wires[i]);
    }

    for (var j = 0; j < array_length(outlets); j++)
    {
        if (instance_exists(outlets[j])) instance_destroy(outlets[j]);
    }

    wires = [];
    outlets = [];
}