//
//  ClipPlane.h
//  Atlas
//
//  Created by Huge Bonner on 12-07-15.
//  Copyright (c) 2012 Huge Bonner Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClipPlane : NSObject {
    float planeX;
    float planeY;
    float planeZ;
    float planeW;
    
    float normalX;
    float normalY;
    float normalZ;
}

@property (readwrite, assign) float planeX;
@property (readwrite, assign) float planeY;
@property (readwrite, assign) float planeZ;
@property (readwrite, assign) float planeW;
@property (readwrite, assign) float planeYOffset;

- (void) rotate:(float)angle;
- (void) recalculateCoefficients;

@end
