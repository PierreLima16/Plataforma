if (instance_exists(obj_player))
{
    if (obj_player.velv < 0 and !place_meeting(x, y, obj_player))
    {
        sprite_index = -1;
    }
    else if (obj_player.y < y)
    {
        sprite_index = spr_plat_oneway;
    }
}
