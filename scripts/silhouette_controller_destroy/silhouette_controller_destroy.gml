function silhouette_controller_destroy()
{
    var _y = 0;
    repeat(blocker_grid_h)
    {
        var _x = 0;
        repeat(blocker_grid_w)
        {
            ds_list_destroy(blocker_static_grid[#  _x, _y]);
            ds_list_destroy(blocker_dynamic_grid[# _x, _y]);
            ++_x;
        }
        
        ++_y;
    }
    
    ds_list_destroy(silhouette_list);
    ds_grid_destroy(blocker_static_grid);
    ds_grid_destroy(blocker_dynamic_grid);
    ds_map_destroy(blocker_drawn_map);
}