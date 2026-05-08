repeat(irandom_range(10, 20))
{
    var _part = instance_create_layer(x, y, "Particulas", obj_part);
    _part.sprite_index = sprite_index;
}

instance_destroy();