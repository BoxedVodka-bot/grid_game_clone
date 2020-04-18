//Set text

draw_sprite(spr_textbox, 0, 400, 200);
draw_set_color(c_white);
draw_set_font(fnt_title);
draw_set_halign(fa_left);
draw_text_ext_transformed(400, 200, "It seems like luck was not on your side. Try again!", 40, 400, 0.7, 0.7, 0);