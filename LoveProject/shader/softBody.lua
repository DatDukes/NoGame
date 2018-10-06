function SoftBodyShader()
    shader = love.graphics.newShader
    [[
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
    {
      vec4 pixel = Texel(texture, texture_coords );
      pixel = step(0.1, pixel);
      return pixel;
    }
    ]]
    return shader
end