var _temp = place_meeting(x, y + 1, obj_plat);

if (_temp and !chao and timer_pulo)
{
    velv = -max_velv;
    xscale = 0.5;
    yscale = 1.6;
}

else if (_temp and !chao)
{
    xscale = 1.6;
    yscale = 0.5;
    
    repeat(irandom_range(3, 5))
    {
        var _xx = irandom_range(x - sprite_width, x + sprite_width);
        var _poeira = instance_create_layer(_xx, y, "Particulas", obj_particula);
    }
}
