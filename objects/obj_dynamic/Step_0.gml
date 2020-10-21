depth = room_height - y;

if (axis == 0)
{
    x += 2*dsin(current_time/10);
}
else if (axis == 1)
{
    y += 2*dsin(current_time/10);
}

silhouette_blocker_update(false);