//------- Colisão Horizontal
if (place_meeting(x + velh, y, obj_plat))
{
    var _velh = sign(velh);
    while(!place_meeting(x + _velh, y, obj_plat))
    {
        x += _velh;
    }
    
    velh = 0;
}

x += velh;

//------- Colisão Vertical
if (place_meeting(x, y + velv, obj_plat))
{
    var _velv = sign(velv);
    while(!place_meeting(x, y + _velv, obj_plat))
    {
        y += _velv;
    }
    
    velv = 0;
}

y += velv;
