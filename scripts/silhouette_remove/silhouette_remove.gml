function silhouette_remove()
{
    with(obj_silhouette_controller)
    {
        var _index = ds_list_find_index(silhouette_list, other);
        while(_index >= 0)
        {
            ds_list_delete(silhouette_list, _index);
            _index = ds_list_find_index(silhouette_list, other);
        }
    }
}