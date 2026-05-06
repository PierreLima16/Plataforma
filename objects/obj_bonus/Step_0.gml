if (sumir)
{
    sprite_index = -1;
    image_alpha = lerp(image_alpha, 0, 0.1);
    image_xscale = lerp(image_xscale, 0, 0.1);
    image_yscale = image_xscale;
    
    timer_some--;
    
    if (timer_some <= 0)
    {
        sumir = false;
        
        timer_some = tempo_some;
    }
}
else
{
    sprite_index = spr_bonus;
    image_alpha = lerp(image_alpha, 1, 0.1);
    image_xscale = lerp(image_xscale, 1, 0.1);
    image_yscale = image_xscale;
}