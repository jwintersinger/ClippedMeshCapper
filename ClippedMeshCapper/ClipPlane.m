//
//  ClipPlane.m
//  Atlas
//
//  Created by Huge Bonner on 12-07-15.
//  Copyright (c) 2012 Huge Bonner Inc. All rights reserved.
//

#import "ClipPlane.h"
#import <GLKit/GLKit.h>

@implementation ClipPlane

@synthesize planeX, planeY, planeZ, planeW;
@synthesize planeYOffset;

- (id) init {
    if(self = [super init]) {
        self.planeYOffset = 0;
        
        normalX = 0;
        normalY = 0;
        normalZ = -1;
        
        [self rotate:3.14159];
    }
    return self;
}

- (void) recalculateCoefficients {
    GLKVector3 bbmid = GLKVector3Make(0, 0, 0);
    GLKVector3 normal = GLKVector3Make(normalX, normalY, normalZ);
    
    // The standard plane equation is Ax + By + Cz + d = 0, where A, B, C, and d
    // are real numbers. Such a plane has the normal [A B C] and is at distance d
    // from the origin.
    //
    // A plane can be defined using a normal vector and a single point that lies in
    // the plane. Here, the normal vector is [normalX normalY normalZ], and the
    // point lying on the plane is the midpoint of the loaded parts' bounding box.
    // Given these two entities, one can then determine the corresponding standard
    // plane equation Ax + By + Cz + d = 0.
    //
    // A, B, and C are simply components of the already-established normal vector;
    // our task, then, is calculating d. Suppose that p = [f g h] is the
    // plane-defining point -- i.e., p is the midpoint of the loaded parts'
    // bounding box. Let n = [A B C] be the plane's normal vector. Furthermore, let
    // r = [x y z] be any other point lying on the plane. Then, r - p is another
    // vector lying in the plane, and dot_product(n, r - p) = 0, for the normal
    // vector must be perpendicular to every vector lying in the plane. Then:
    //
    //   dot_product(n, r - p) = A(x - f) + B(y - g) + C(z - h)
    //                         = Ax + By + Cz - (Af + Bg + Ch)
    //                         = 0
    //
    // Note that this is in the form of the standard plane equation
    // Ax + By + Cz + d = 0, with
    //
    //   d = -(Af + Bg + Ch)
    //     = -dot_product(n, p)
    //
    // Thus, we have defined our plane via the standard plane equation.
    self.planeX = normalX;
    self.planeY = normalY;
    self.planeZ = normalZ;
    self.planeW = -GLKVector3DotProduct(normal, bbmid);
}

- (void) rotate:(float)angle {    
    GLKVector3 normal = GLKVector3Make(normalX, normalY, normalZ);
    GLKVector3 rotationAxis = GLKVector3Make(1, 0, 0);
    GLKMatrix4 rotationMatrix = GLKMatrix4RotateWithVector3(GLKMatrix4Identity, angle, rotationAxis);
    normal = GLKMatrix4MultiplyVector3(rotationMatrix, normal);
    normalX = normal.x;
    normalY = normal.y;
    normalZ = normal.z;
    
    [self recalculateCoefficients];
}

- (void) dealloc {
    [super dealloc];
}

@end
