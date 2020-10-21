/// @param safe

function silhouette_blocker_add(_safe)
{
    var _x1     = x + blocker_dx1;
    var _y1     = y + blocker_dy1;
    var _x2     = x + blocker_dx2;
    var _y2     = y + blocker_dy2;
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
                if (_safe)
                {
                    var _list = _grid[#  _x, _y];
                    if (ds_list_find_index(_list, other) < 0) ds_list_add(_grid[#  _x, _y], other);
                }
                else
                {
                    ds_list_add(_grid[#  _x, _y], other);
                }
                
                ++_x;
            }
            
            ++_y;
        }
    }
    
    blocker_prev_x1 = _x1;
    blocker_prev_y1 = _y1;
    blocker_prev_x2 = _x2;
    blocker_prev_y2 = _y2;
}