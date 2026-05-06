if (velh != 0) dir = sign(velh);

draw_sprite_ext(sprite_index, image_index, x, y, xscale * dir, yscale, image_angle, image_blend, image_alpha);

draw_text(x, y - 48, estado_txt);
draw_text(x, y - 64, qtd_dashs);