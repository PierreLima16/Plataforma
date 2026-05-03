
chao = place_meeting(x, y + 1, obj_plat);
    
var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _jump = keyboard_check(ord("K"));

var _velh = (_right - _left) * max_velh;
velh = lerp(velh, _velh, acel);

//Se eu não estou no chão
if (!chao)
{
    //Mudando a aceleração
    acel = acel_ar;
}
//Estou no chao
else
{
    //Mudando a aceleração
    acel = acel_chao;
}

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
        }
        
        //Se minha velocidade horizontal for diferente de 0 ou apertei as teclas para o lado
        if (velh != 0 or velv != 0 or _left xor _right)
        {
            //Vou para o estado de movendo
            estado = state.movendo;
        }
        
        break;
    
    //Movendo
    case state.movendo:
        
        estado_txt = "Movendo";
        
        if (!chao) velv += grav;
        
        //Se pulei ou não estou no chao
        if (_jump and chao)
        {
            velv = -max_velv;
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