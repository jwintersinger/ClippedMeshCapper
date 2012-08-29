//
//  ViewController.h
//  GLTest3
//
//  Created by Jeff Wintersinger on 2012-08-28.
//  Copyright (c) 2012 Jeff Wintersinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "ClipPlane.h"

@interface ViewController : GLKViewController {
    ClipPlane* _clipPlane;
}
@property (readwrite, retain) ClipPlane* clipPlane;
@end