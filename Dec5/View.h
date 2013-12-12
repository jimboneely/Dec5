//
//  View.h
//  Dec5
//
//  Created by James Neely on 12/12/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface View: UIView {
	UIView *paddle;
	UIView *ball1;
    UIView *ball2;
    UIView *ball3;
	CGFloat dx, dy;	//direction and speed of ball's motion
}

- (void) move: (CADisplayLink *) displayLink;
@end
