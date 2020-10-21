function silhouette_controller_draw()
{
    var _i = ds_list_size(silhouette_list)-1;
    repeat(ds_list_size(silhouette_list))
    {
        var _silh_instance = silhouette_list[| _i];
        
        if (!instance_exists(_silh_instance))
        {
            ds_list_delete(silhouette_list, _i);
            --_i;
            continue;
        }
        
        with(_silh_instance)
        {
            var _silh_depth = depth;
            var _colour     = silhouette_colour;
            var _x1         = bbox_left;
            var _y1         = bbox_top;
            var _x2         = bbox_right;
            var _y2         = bbox_bottom;
        }
        
        gpu_set_colorwriteenable(false, false, false, true);
        
        gpu_set_blendmode_ext(bm_one, bm_zero);
        draw_set_alpha(0.0);
        draw_rectangle(_x1, _y1, _x2, _y2, false);
        
        draw_set_alpha(1.0);
        gpu_set_blendmode(bm_normal);
        
        ds_map_clear(blocker_drawn_map);
        
        var _cell_l = clamp(floor(_x1/blocker_cell_size), 0, blocker_grid_w-1);
        var _cell_t = clamp(floor(_y1/blocker_cell_size), 0, blocker_grid_h-1);
        var _cell_r = clamp(floor(_x2/blocker_cell_size), 0, blocker_grid_w-1);
        var _cell_b = clamp(floor(_y2/blocker_cell_size), 0, blocker_grid_h-1);
        
        var _y = _cell_t;
        repeat(1 + _cell_b - _cell_t)
        {
            var _x = _cell_l;
            repeat(1 + _cell_r - _cell_l)
            {
                #region Draw static blockers
                
                var _list = blocker_static_grid[# _x, _y];
                
                var _j = ds_list_size(_list)-1;
                repeat(ds_list_size(_list))
                {
                    var _blocker_instance = _list[| _j];
                    if (!instance_exists(_blocker_instance))
                    {
                        ds_list_delete(_list, _j);
                        --_j;
                        continue;
                    }
                    
                    if (!ds_map_exists(blocker_drawn_map, _blocker_instance))
                    {
                        blocker_drawn_map[? _blocker_instance] = true;
                        if (_blocker_instance.depth < _silh_depth) with(_blocker_instance) blocker_draw_function();
                    }
                    
                    --_j;
                }
                
                #endregion
                
                #region Draw dynamic blockers
                
                var _list = blocker_dynamic_grid[# _x, _y];
                
                var _j = ds_list_size(_list)-1;
                repeat(ds_list_size(_list))
                {
                    var _blocker_instance = _list[| _j];
                    if (!instance_exists(_blocker_instance))
                    {
                        ds_list_delete(_list, _j);
                        --_j;
                        continue;
                    }
                    
                    if (!ds_map_exists(blocker_drawn_map, _blocker_instance))
                    {
                        blocker_drawn_map[? _blocker_instance] = true;
                        if (_blocker_instance.depth < _silh_depth) with(_blocker_instance) blocker_draw_function();
                    }
                    
                    --_j;
                }
                
                #endregion
                
                ++_x;
            }
            
            ++_y;
        }
        
        gpu_set_blendmode_ext(bm_zero, bm_src_alpha);
        with(_silh_instance) silhouette_draw_function();
        
        gpu_set_colorwriteenable(true, true, true, false);
        gpu_set_fog(true, _colour, 0, 0);
        gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
        with(_silh_instance) silhouette_draw_function();
        
        --_i;
    }
    
    gpu_set_fog(false, c_white, 0, 0);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode(bm_normal);
}