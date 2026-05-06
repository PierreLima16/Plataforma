
chao = place_meeting(x, y + 1, obj_plat);
parede_dir = place_meeting(x + 1, y, obj_plat);
parede_esq = place_meeting(x - 1, y, obj_plat);

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _down = keyboard_check(ord("S"));
var _up = keyboard_check(ord("W"));
var _jump = keyboard_check_pressed(ord("J"));
var _jump_r = keyboard_check_released(ord("J"));
var _dash = keyboard_check_pressed(ord("K"));

var _velh = (_right - _left) * max_velh;
var _velv = (_down - _up) * max_velh;


//Se eu não estou no chão
if (!chao) 
{
    //mudo a aceleração
    acel = acel_ar;
    
    if (timer_coyote > 0) timer_coyote--;
        
    
    if (_jump)  
    {
        timer_pulo = tempo_pulo;
    }
    
    timer_pulo--;
}
//Estou no chao
else 
{
    //mudo a aceleração
    acel = acel_chao;
    
    timer_coyote = tempo_coyote;
    
    //Resetando a quantidade de dashs
    qtd_dashs = 1;
}

if (parede_dir or parede_esq)
{
    if (parede_dir) 
    {
        ultima_parede = true;
        
        if (velv > 0)
        {
            var _chance = irandom(100);
            
            if (_chance > 70)
            {
                repeat(irandom_range(1, 3))
                {
                    var _xx = x + sprite_width/2;
                    var _poeira = instance_create_layer(_xx, y, "Particulas", obj_particula);
                    _poeira.speed = _poeira.speed / 2;
                    _poeira.image_xscale = _poeira.image_xscale * 0.8;
                    _poeira.image_yscale = _poeira.image_yscale * 0.8;
                }
            }
        }
        
    }
    else 
    {
        ultima_parede = false;
        
        if (velv > 0)
        {
            var _chance = irandom(100);
            
            if (_chance > 70)
            {
                repeat(irandom_range(1, 3))
                {
                    var _xx = x - sprite_width/2;
                    var _poeira = instance_create_layer(_xx, y, "Particulas", obj_particula);
                    _poeira.speed = _poeira.speed / 2;
                    _poeira.image_xscale = _poeira.image_xscale * 0.8;
                    _poeira.image_yscale = _poeira.image_yscale * 0.8;
                }
            }
            
        }
    }
    
        
    parede_timer = parede_tempo;    
}
else
{
    if (parede_timer > 0) parede_timer--;
}

xscale = lerp(xscale, 1, 0.1);
yscale = lerp(yscale, 1, 0.1);

//---------------- STATE MACHINE ----------------\\

switch(estado)
{
    //Parado
    case state.parado:
        
        estado_txt = "Parado";
        
        //Zerando minha velocidade
        velh = 0;
        velv = 0;
        
        if (chao and _down)
        {
            xscale = lerp(xscale, 1.6, 0.2);
            yscale = lerp(yscale, 0.5, 0.2);
        }
        
        if (!chao and (parede_dir or parede_esq or parede_timer))
        {
            if (velv > 0)
            {
                velv = lerp(velv, deslize, acel);
            }
            else
            {
                velv += grav;
            }
            
            if (_jump and ultima_parede)
            {
                velh = -max_velh * 0.5;
                velv = -max_velv;
                
                xscale = 0.5;
                yscale = 1.6;
                
                parede_timer = 0;
                
                repeat(irandom_range(5, 8))
                {
                    var _xx = x + sprite_width/2
                    var _poeira = instance_create_layer(_xx, y, "Particulas", obj_particula);
                    _poeira.speed = _poeira.speed * 2;
                }
            }
            else if (_jump and !ultima_parede)
            {
                velh = max_velh * 0.5;
                velv = -max_velv;
                
                xscale = 0.5;
                yscale = 1.6;
                
                parede_timer = 0;
                
                repeat(irandom_range(5, 8))
                {
                    var _xx = x - sprite_width/2
                    var _poeira = instance_create_layer(_xx, y, "Particulas", obj_particula);
                    _poeira.speed = _poeira.speed * 2;
                }
            }
        }
        else if (!chao)
        {
            velv += grav;
        }
        
        
        //Se eu aperto para pular ou não estou no chao
        if (_jump and chao)
        {
            velv = -max_velv;
            xscale = 0.5;
            yscale = 1.6;
            
            repeat(irandom_range(5, 8))
            {
                var _xx = irandom_range(x - sprite_width/2, x + sprite_width/2);
                var _poeira = instance_create_layer(x, y, "Particulas", obj_particula);
                _poeira.speed = _poeira.speed * 2;
            }
        }
        
        //Se minha velocidade horizontal for diferente de 0 ou apertei as teclas para o lado
        if (velh != 0 or velv != 0 or _left xor _right xor _jump)
        {
            //Vou para o estado de movendo
            estado = state.movendo;
        }
        
        if (_dash and qtd_dashs > 0)
        {
            estado = state.dash;
            dir_dash = point_direction(0, 0, (_right - _left), (_down - _up));
        }
        
        break;
    
    //Movendo
    case state.movendo:
        
        estado_txt = "Movendo";
        
        if (chao and _down)
        {
            xscale = lerp(xscale, 1.6, 0.2);
            yscale = lerp(yscale, 0.5, 0.2);
        }
        
        if (!chao and (parede_dir or parede_esq or parede_timer))
        {
            if (velv > 0)
            {
                velv = lerp(velv, deslize, acel);
            }
            else
            {
                velv += grav;
            }
            
            if (_jump and ultima_parede)
            {
                velh = -max_velh * 0.5;
                velv = -max_velv;
                
                xscale = 0.5;
                yscale = 1.6;
                
                parede_timer = 0;
                
                repeat(irandom_range(5, 8))
                {
                    var _xx = x + sprite_width/2
                    var _poeira = instance_create_layer(_xx, y, "Particulas", obj_particula);
                    _poeira.speed = _poeira.speed * 2;
                }
            }
            else if (_jump and !ultima_parede)
            {
                velh = max_velh * 0.5;
                velv = -max_velv;
                
                xscale = 0.5;
                yscale = 1.6;
                
                parede_timer = 0;
                
                repeat(irandom_range(5, 8))
                {
                    var _xx = x - sprite_width/2
                    var _poeira = instance_create_layer(_xx, y, "Particulas", obj_particula);
                    _poeira.speed = _poeira.speed * 2;
                }
            }
        }
        else if (!chao)
        {
            velv += grav;
        }
        
        velh = lerp(velh, _velh, acel);
        
        timer_part--;
        
        if (abs(velh) > max_velh - 0.5 and chao)
        {
            if (timer_part <= 0)
            {
                repeat(irandom_range(1, 3))
                {
                    var _xx = irandom_range(x - sprite_width/2, x + sprite_width/2);
                    var _poeira = instance_create_layer(_xx, y, "Particulas", obj_particula);
                    _poeira.speed = _poeira.speed / 2;
                    _poeira.image_xscale = _poeira.image_xscale * 0.8;
                    _poeira.image_yscale = _poeira.image_yscale * 0.8;
                }
                
                timer_part = tempo_part;
            }
            
        }
        
        //Se pulei ou não estou no chao
        if (_jump and (chao or timer_coyote))
        {
            velv = -max_velv;
            xscale = 0.5;
            yscale = 1.6;
            
            repeat(irandom_range(5, 8))
            {
                var _xx = irandom_range(x - sprite_width/2, x + sprite_width/2);
                var _poeira = instance_create_layer(x, y, "Particulas", obj_particula);
                _poeira.speed = _poeira.speed * 2;
            }
            
        }
        
        //Se minha velocidade horizontal e vertical estiver zerada
        if (abs(velh) < 0.2 and abs(velv) < 0.2)
        {
            //Vou para o estado de parado
            estado = state.parado;
        }
        
        if (velv < 0)
        {
            if (_jump_r)
            {
                velv *= 0.7;
            }
        }
        
        if (_dash and qtd_dashs > 0)
        {
            estado = state.dash;
            dir_dash = point_direction(0, 0, (_right - _left), (_down - _up));
        }
        
        //Limitando minha velocidade vertical
        velv = clamp(velv, -max_velv, max_velv);
        
        break;
    
    case state.dash:
        
        if (estado_txt != "Dash")
        {
            qtd_dashs = 0;
            estado_txt = "Dash";
        }
        
        dash_timer--;
        
        velh = lengthdir_x(len, dir_dash);
        velv = lengthdir_y(len, dir_dash);
        
        if (dir_dash == 90 or dir_dash == 270)
        {
            xscale = 0.4;
            yscale = 1.5;
        }
        else
        {
            xscale = 1.5
            yscale = 0.4;
        }
        
        var _rastro = instance_create_layer(x, y, layer, obj_player_ext);
        _rastro.xscale = xscale;
        _rastro.yscale = yscale;
        
        if (dash_timer <= 0)
        {
            estado = state.movendo;
            dash_timer = dash_tempo;
            
            velh = (max_velh * sign(velh) * 0.3);
            velv = (max_velv * sign(velv) * 0.3);
        }
        
        break;
    
    case state.morte:
        
        if (estado_txt != "Morte")
        {
            velv = -max_velv;
            
            estado_txt = "Morte";
        }
        
        velh = 0;
        if (velv < 0) velv += grav;
        else if (velv > 0) velv += grav * 3;  
        
        mask_index = spr_mask;
        image_angle = lerp(image_angle, 45, 0.1);
        
        if (y > room_height + 100)
        {
            room_restart();
        }
        
        
        break;
}

switch(qtd_dashs)
{
    case 0:
        sat = lerp(sat, 0, 0.1);
        break;
    
    case 1:
        sat = lerp(sat, 255, 0.1);
        break;

}

var _cor_atual = make_colour_hsv(20, sat, 255);
image_blend = _cor_atual;