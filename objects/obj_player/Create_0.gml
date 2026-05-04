grav = 0.3;
acel_chao = 0.1;
acel_ar = 0.07;
acel = acel_chao;

velh = 0;
velv = 0;
max_velh = 6;
max_velv = 8;

chao = false;

xscale = 1;
yscale = 1;

tempo_coyote = game_get_speed(gamespeed_fps) * 0.1;
timer_coyote = tempo_coyote;

tempo_pulo = 20;
timer_pulo = 0;

enum state
{
    parado, movendo, dash
}

estado = state.parado;
estado_txt = "Parado";

