//
//  Shader.fsh
//  GLTest3
//
//  Created by Jeff Wintersinger on 2012-08-28.
//  Copyright (c) 2012 Jeff Wintersinger. All rights reserved.
//

uniform bool u_clippingEnabled;
varying lowp vec4 colorVarying;
varying highp float v_clipDist;

void main()
{
    if(u_clippingEnabled && v_clipDist < 0.0)
        discard;
    gl_FragColor = colorVarying;
}
