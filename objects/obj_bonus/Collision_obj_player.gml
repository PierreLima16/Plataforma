if (sprite_index == spr_bonus)
{
    if (other.qtd_dashs <= 0) other.qtd_dashs += 1;
        
    sumir = true;
    
    repeat(irandom_range(10, 20))
    {
        var _part = instance_create_layer(x, y, "Particulas", obj_part);
        _part.sprite_index = spr_part_bonus;
    }
    
}

