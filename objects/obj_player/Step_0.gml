chao = place_meeting(x, y + 1, obj_plat);

var _left = keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));
var _jump = keyboard_check(ord("K"));

velh = (_right - _left) * max_velh;

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
    if (_jump)
    {
        //Então eu pulo
        velv = -max_velv;
    }    
}

//Limitando minha velocidade vertical
velv = clamp(velv, -max_velv, max_velv);