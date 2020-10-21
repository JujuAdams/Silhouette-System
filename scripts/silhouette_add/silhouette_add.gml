/// @param colour
/// @param drawFunction

function silhouette_add(_colour, _function)
{
    silhouette_colour = _colour;
    silhouette_draw_function = _function;
    
    with(obj_silhouette_controller)
    {
        if (ds_list_find_index(silhouette_list, other) < 0) ds_list_add(silhouette_list, other);
    }
}