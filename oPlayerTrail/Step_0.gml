life -= 1;

image_alpha = life / max_life * 0.35;

if (life <= 0)
{
    instance_destroy();
}