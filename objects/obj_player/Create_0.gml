grav = 0.2;
acel_chao = 0.1;
acel_ar = 0.07;
acel = acel_chao;

velh = 0;
velv = 0;
max_velh = 6;
max_velv = 8;

chao = false;

left = false;
right = false;
jump = false;

enum state
{
    parado, movendo, pulo, dash
}

estado = state.parado;
estado_txt = "Parado";


pega_input = function()
{
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    jump = keyboard_check(ord("K"));
}

checa_chao = function()
{
    chao = place_meeting(x, y + 1, obj_plat);
}

controla_player = function()
{
    checa_chao();
    pega_input();

    velh = (right - left) * max_velh;
    
    //Se eu não estou no chão
    if (!chao)
    {
        //Eu aplico gravidade
        velv += grav;
    }
    //Estou no chao
    else
    {
        //E aperto para pular
        if (jump)
        {
            //Então eu pulo
            velv = -max_velv;
        }    
    }
    
    //Limitando minha velocidade vertical
    velv = clamp(velv, -max_velv, max_velv);
}

maquina_estados = function()
{
    //---------------- STATE MACHINE ----------------\\
    
    switch(estado)
    {
        //Parado
        case state.parado:
            
            estado_txt = "Parado";
            
            //Zerando minha velocidade
            velh = 0;
            velv = 0;
            
            //Aplicando velocidade
            controla_player();
            
            //Se eu aperto para pular ou não estou no chao
            if (jump or !chao)
            {
                //Vou para o estado de pulo
                estado = state.pulo;
            }
            
            //Se minha velocidade horizontal for diferente de 0 ou apertei as teclas para o lado
            if (velh != 0 or left xor right)
            {
                //Vou para o estado de movendo
                estado = state.movendo;
            }
            
            break;
        
        //Movendo
        case state.movendo:
            
            estado_txt = "Movendo";
            
            //Aplicando velocidade
            controla_player();
            
            //Se pulei ou não estou no chao
            if (jump or !chao)
            {
                //Vou para o estado de pulo
                estado = state.pulo;
            }
            
            //Se minha velocidade horizontal e vertical estiver zerada
            if (velh == 0 and velv == 0)
            {
                //Vou para o estado de parado
                estado = state.parado;
            }
            
            break;
        
        case state.pulo:
            
            estado_txt = "Pulo";
            
            //Aplicando velocidade
            controla_player();
            
            //Se estou no chao
            if (chao)
            {
                //Vou para o estado de parado
                estado = state.parado;
            }
            
            break;    
    }
}