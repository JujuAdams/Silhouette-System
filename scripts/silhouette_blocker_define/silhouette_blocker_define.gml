/// @param leftRelative
/// @param topRelative
/// @param rightRelative
/// @param bottomRelative
/// @param static
/// @param drawFunction

function silhouette_blocker_define(_dx1, _dy1, _dx2, _dy2, _static, _draw_function)
{
    blocker_dx1 = _dx1;
    blocker_dy1 = _dy1;
    blocker_dx2 = _dx2;
    blocker_dy2 = _dy2;
    
    blocker_static = _static;
    blocker_draw_function = _draw_function;
    
    //If we haven't already added this instance to the silhouette controller, do so now
    if (!variable_instance_exists(id, "blocker_prev_x1")) silhouette_blocker_add(true);
}