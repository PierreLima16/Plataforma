image_angle += rot;

switch(estado)
{
    case "Avancar":
        
        var _limite_x = lengthdir_x(limite, dir);
        var _limite_y = lengthdir_y(limite, dir);
        
        x += lengthdir_x(vel, dir);
        y += lengthdir_y(vel, dir);
        
        if (_limite_x > 0)
        {
            if (x >= xstart + _limite_x) estado = "Recuar";
        }
        else if (_limite_x < 0)
        {
            if (x <= xstart + _limite_x) estado = "Recuar";
        }
        
        if (_limite_y > 0)
        {
            if (y >= ystart + _limite_y) estado = "Recuar";
        }
        else if (_limite_y < 0)
        {
            if (y <= ystart + _limite_y) estado = "Recuar";
        }
        
        break;
    
    case "Recuar":
        
        x -= lengthdir_x(vel, dir);
        y -= lengthdir_y(vel, dir);
        
        if (x == xstart and y == ystart) estado = "Avancar";
        
        break;
    
    case "Parado":
        
        break;
    
    default:
        show_message("BURRO, ESCREVEU ERRADO");
        break;
}