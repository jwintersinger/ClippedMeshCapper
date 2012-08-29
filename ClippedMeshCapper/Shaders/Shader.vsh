//
//  Shader.vsh
//  GLTest3
//
//  Created by Jeff Wintersinger on 2012-08-28.
//  Copyright (c) 2012 Jeff Wintersinger. All rights reserved.
//

attribute vec4 position;
attribute vec3 normal;

varying lowp vec4 colorVarying;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec4 u_clipPlane;
uniform bool u_clippingEnabled;
varying float v_clipDist;

void main()
{
    vec3 eyeNormal = normalize(normalMatrix * normal);
    vec3 lightPosition = vec3(0.0, 0.0, 1.0);
    vec4 diffuseColor = vec4(0.4, 0.4, 1.0, 1.0);
    
    float nDotVP = max(0.0, dot(eyeNormal, normalize(lightPosition)));
    
    colorVarying = diffuseColor * nDotVP;
    
    gl_Position = modelViewProjectionMatrix * position;

    if(u_clippingEnabled)
        v_clipDist = dot(position.xyz, u_clipPlane.xyz) + u_clipPlane.w;
}
