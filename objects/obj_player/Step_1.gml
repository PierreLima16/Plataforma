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
}
