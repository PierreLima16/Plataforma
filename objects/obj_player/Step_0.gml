
chao = place_meeting(x, y + 1, obj_plat);

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _jump = keyboard_check_pressed(ord("K"));

var _velh = (_right - _left) * max_velh;



//Se eu não estou no chão
if (!chao) 
{
    //mudo a aceleração
    acel = acel_ar;
    
    if (timer_coyote > 0) timer_coyote--;
        
    
    if (_jump) timer_pulo = tempo_pulo;
    
    timer_pulo--;
}

//Estou no chao
else 
{
    //mudo a aceleração
    acel = acel_chao;
    
    timer_coyote = tempo_coyote;
}

xscale = lerp(xscale, 1, 0.1);
yscale = lerp(yscale, 1, 0.1);

//Limitando minha velocidade vertical
velv = clamp(velv, -max_velv, max_velv);


//---------------- STATE MACHINE ----------------\\

switch(estado)
{
    //Parado
    case state.parado:
        
        estado_txt = "Parado";
        
        //Zerando minha velocidade
        velh = 0;
        velv = 0;
        
        if (!chao) velv += grav;
        
        //Se eu aperto para pular ou não estou no chao
        if (_jump and chao)
        {
            velv = -max_velv;
            xscale = 0.5;
            yscale = 1.6;
        }
        
        //Se minha velocidade horizontal for diferente de 0 ou apertei as teclas para o lado
        if (velh != 0 or velv != 0 or _left xor _right xor _jump)
        {
            //Vou para o estado de movendo
            estado = state.movendo;
        }
        
        break;
    
    //Movendo
    case state.movendo:
        
        estado_txt = "Movendo";
        
        if (!chao) velv += grav;
        
        velh = lerp(velh, _velh, acel);
        
        //Se pulei ou não estou no chao
        if (_jump and (chao or timer_coyote))
        {
            velv = -max_velv;
            xscale = 0.5;
            yscale = 1.6;
        }
        
        //Se minha velocidade horizontal e vertical estiver zerada
        if (abs(velh) < 0.2 and abs(velv) < 0.2)
        {
            //Vou para o estado de parado
            estado = state.parado;
        }
        
        break;
    
    case state.dash:
        
        
        break;    
}