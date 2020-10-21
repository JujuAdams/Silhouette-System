/// @param safe

function silhouette_blocker_update(_safe)
{
    var _x1 = x + blocker_dx1;
    var _y1 = y + blocker_dy1;
    var _x2 = x + blocker_dx2;
    var _y2 = y + blocker_dy2;
    
    if ((_x1 != blocker_prev_x1) || (_y1 != blocker_prev_y1)
    ||  (_x2 != blocker_prev_x2) || (_y2 != blocker_prev_y2))
    {
        silhouette_blocker_remove(_safe);
        silhouette_blocker_add(_x1, _y1, _x2, _y2, _safe);
    }
}