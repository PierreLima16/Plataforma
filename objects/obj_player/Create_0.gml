grav = 0.3;
acel_chao = 0.1;
acel_ar = 0.07;
acel = acel_chao;

velh = 0;
velv = 0;
max_velh = 6;
max_velv = 8;

chao = false;


enum state
{
    parado, movendo, dash
}

estado = state.parado;
estado_txt = "Parado";

