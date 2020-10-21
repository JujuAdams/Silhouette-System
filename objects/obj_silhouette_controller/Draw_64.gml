var _string = "Silhouette Example\n@jujuadams\n2020-10-21";

draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_text(10, 12, _string);
draw_set_alpha(1.0);
draw_text( 9, 10, _string);
draw_text(11, 10, _string);
draw_text(10,  9, _string);
draw_text(10, 11, _string);
draw_set_colour(c_white);
draw_text(10, 10, _string);