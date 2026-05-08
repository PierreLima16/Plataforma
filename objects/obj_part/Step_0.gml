speed = lerp(speed, 0, 0.08);
image_xscale = lerp(image_xscale, xscale, 0.1);
image_yscale = image_xscale;
image_angle += angle_speed;

angle_speed = lerp(angle_speed, 0, 0.08);

if (speed <= 0.1)
{
    image_alpha -= 0.05;
    image_xscale = lerp(image_xscale, 0, 0.05);
    image_yscale = image_xscale;
    
    if (image_alpha <= 0 or image_xscale <= 0.05)
    {
        instance_destroy();
    }
}
