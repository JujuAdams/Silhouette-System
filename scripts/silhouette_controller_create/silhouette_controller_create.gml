/// @param cellSize    We found that "a little bigger than the size of the biggest blocker" worked well

function silhouette_controller_create(_cell_size)
{
    blocker_cell_size = _cell_size;
    
    blocker_grid_w = ceil(room_width  / blocker_cell_size);
    blocker_grid_h = ceil(room_height / blocker_cell_size);
    
    silhouette_list      = ds_list_create();
    blocker_static_grid  = ds_grid_create(blocker_grid_w, blocker_grid_h);
    blocker_dynamic_grid = ds_grid_create(blocker_grid_w, blocker_grid_h);
    blocker_drawn_map     = ds_map_create();
    
    var _y = 0;
    repeat(blocker_grid_h)
    {
        var _x = 0;
        repeat(blocker_grid_w)
        {
            blocker_static_grid[#  _x, _y] = ds_list_create();
            blocker_dynamic_grid[# _x, _y] = ds_list_create();
            ++_x;
        }
        
        ++_y;
    }
}