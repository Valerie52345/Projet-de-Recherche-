var t = oBattleController.battle_time;

var intensity = 0.12;
var speed_mul = 3;


// En gros pour le boss fight je suis le temps de mes attaques normales 
//et je change l'intensité dépendamment de la difficulté de l'attaque


//phase pour timee
if (global.battle_enemy_type == "timee")
{

    if (t >= 0 && t < 22)
    {
        intensity = 0.05;
        speed_mul = 1.5;
    }

    else if (t >= 22 && t < 36)
    {
        intensity = 0.12;
        speed_mul = 3;
    }

    else if (t >= 36 && t < 54)
    {
        intensity = 0.16;
        speed_mul = 3.5;
    }

    else if (t >= 54 && t < 75)
    {
        intensity = 0.18;
        speed_mul = 4;
    }
    else if (t >= 75 && t < 83)
    {
        intensity = 0.05;
        speed_mul = 1.5;
    }

    else if (t >= 83 && t < 120)
    {
        intensity = 0.3;
        speed_mul = 7;
    }

    // fin calme
    else if (t >= 120 && t < 138)
    {
        intensity = 0.04;
        speed_mul = 1.2;
    }

}


//Phases du boss final
else if (global.battle_enemy_type == "finalboss")
{

    if (t >= 0 && t < 12)
    {
        intensity = 0.10;
        speed_mul = 2.4;

        local_max_height = 8;
    }

    else if (t >= 12 && t < 24)
    {
        intensity = 0.16;
        speed_mul = 3.6;

        local_max_height = 11;
    }

    else if (t >= 24 && t < 36)
    {
        intensity = 0.18;
        speed_mul = 4.2;

        local_max_height = 12;
    }

    else if (t >= 36 && t < 48)
    {
        intensity = 0.20;
        speed_mul = 4.8;

        local_max_height = 13;
    }

    else if (t >= 48 && t < 60)
    {
        intensity = 0.24;
        speed_mul = 5.5;

        local_max_height = 15;
    }

}


//Je fais un effet mirroir (effet visuel)
var half = bar_count div 2;

for (var i = 0; i < half; i++)
{
	//sinus rend le mouvement plus fluide
    var wave = sin((t * speed_mul) + i * 0.8);
    var target = min_height + ((wave * 0.5 + 0.5) * max_height * intensity);

    bar_heights[i] = lerp(bar_heights[i], target, 0.12);

}