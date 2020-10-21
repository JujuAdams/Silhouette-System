/// @param safe
function silhouette_blocker_remove(_safe)
{
    var _x1     = blocker_prev_x1;
    var _y1     = blocker_prev_y1;
    var _x2     = blocker_prev_x2;
    var _y2     = blocker_prev_y2;
    var _static = blocker_static;
    
    with(obj_silhouette_controller)
    {
        var _cell_l = clamp(floor(_x1/blocker_cell_size), 0, blocker_grid_w-1);
        var _cell_t = clamp(floor(_y1/blocker_cell_size), 0, blocker_grid_h-1);
        var _cell_r = clamp(floor(_x2/blocker_cell_size), 0, blocker_grid_w-1);
        var _cell_b = clamp(floor(_y2/blocker_cell_size), 0, blocker_grid_h-1);
        
        var _grid = _static? blocker_static_grid : blocker_dynamic_grid;
        
        var _y = _cell_t;
        repeat(1 + _cell_b - _cell_t)
        {
            var _x = _cell_l;
            repeat(1 + _cell_r - _cell_l)
            {
                var _list = _grid[#  _x, _y];
                var _index = ds_list_find_index(_list, other);
                
                if (_safe)
                {
                    while(_index >= 0)
                    {
                        ds_list_delete(_list, _index);
                        _index = ds_list_find_index(_list, other);
                    }
                }
                else
                {
                    if (_index >= 0) ds_list_delete(_list, _index);
                }
                
                ++_x;
            }
            
            ++_y;
        }
    }
}