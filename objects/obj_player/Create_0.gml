grav = 0.3;
acel_chao = 0.1;
acel_ar = 0.07;
acel = acel_chao;

velh = 0;
velv = 0;
max_velh = 6;
max_velv = 8;
len = 10;
deslize = 2;

chao = false;
parede_dir = false;
parede_esq = false;
ultima_parede = false;

dir = 1;

xscale = 1;
yscale = 1;
dir_dash = 0;
qtd_dashs = 1;

sat = 255;

tempo_coyote = game_get_speed(gamespeed_fps) * 0.1;
timer_coyote = tempo_coyote;

tempo_pulo = game_get_speed(gamespeed_fps) * 0.1;
timer_pulo = 0;

dash_tempo = room_speed/4;
dash_timer = dash_tempo;

parede_tempo = game_get_speed(gamespeed_fps) * 0.1;
parede_timer = 0;

tempo_part = 5;
timer_part = 0;

enum state
{
    parado, movendo, dash
}

estado = state.parado;
estado_txt = "Parado";

