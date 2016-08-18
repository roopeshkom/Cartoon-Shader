void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = vec2(fragCoord.x/iResolution.x, fragCoord.y/iResolution.y);
	vec4 ogColor = texture2D(iChannel0, uv);
    vec4 texColor = ogColor;
    
    if(texColor.r + texColor.g + texColor.b >= 1.0)
    {
		texColor = vec4(1,1,1,1);
    }
    else
    {
        texColor = vec4(0,0,0,1);
    }
	texColor.b = (uv.x+uv.y)/2.0;

    
    float multiplier = abs(sin(iGlobalTime));
    vec4 blend = (((multiplier)*(texColor)) + (.5*(1.0-multiplier)*(ogColor)))/2.0;
	
    fragColor = blend;
}