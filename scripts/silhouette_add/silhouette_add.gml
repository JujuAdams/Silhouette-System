/// @param colour

function silhouette_add(_colour)
{
    silhouette_colour = _colour;
    
    with(obj_silhouette_controller)
    {
        if (ds_list_find_index(silhouette_list, other) < 0) ds_list_add(silhouette_list, other);
    }
}