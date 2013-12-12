//
//  View.m
//  Dec5
//
//  Created by James Neely on 12/12/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor redColor];
		
		//Create the paddle.
		frame = CGRectMake(40, 100, 20, 100);
		paddle = [[UIView alloc] initWithFrame: frame];
		paddle.backgroundColor = [UIColor whiteColor];
		[self addSubview: paddle];
		
		//Create the ball in the upper left corner of this View.
		frame = CGRectMake(0, 0, 20, 20);
		ball1 = [[UIView alloc] initWithFrame: frame];
		ball1.backgroundColor = [UIColor whiteColor];
		[self addSubview: ball1];
		
		//Ball initially moves to lower right.
		dx = 2;
		dy = 2;
        
        //Create the 2nd ball in the upper left corner of this View.
		frame = CGRectMake(100, 100, 20, 20);
		ball2 = [[UIView alloc] initWithFrame: frame];
		ball2.backgroundColor = [UIColor greenColor];
		[self addSubview: ball2];
        
        //Ball initially moves to lower right.
		dx = 4;
		dy = 4;
        
        //Create the 2nd ball in the upper left corner of this View.
		frame = CGRectMake(200, 50, 20, 20);
		ball3 = [[UIView alloc] initWithFrame: frame];
		ball3.backgroundColor = [UIColor blueColor];
		[self addSubview: ball3];
        
        //Ball initially moves to lower right.
		dx = 4;
		dy = 4;
	}
	return self;
}

//Change the ball's direction of motion,
//if necessary to avoid an impending collision.

- (void) bounce {
	//Where the ball would be if its horizontal motion were allowed
	//to continue for one more move.
	CGRect horizontal = ball1.frame;
	horizontal.origin.x += dx;
    
	//Where the ball would be if its vertical motion were allowed
	//to continue for one more move.
	CGRect vertical = ball1.frame;
	vertical.origin.y += dy;
    
	//Ball must remain inside self.bounds.
	if (!CGRectEqualToRect(horizontal, CGRectIntersection(horizontal, self.bounds))) {
		//Ball will bounce off left or right edge of View.
		dx = -dx;
	}
    
	if (!CGRectEqualToRect(vertical, CGRectIntersection(vertical, self.bounds))) {
		//Ball will bounce off top or bottom edge of View.
		dy = -dy;
	}
    
	//If the ball is not currently intersecting the paddle,
	if (!CGRectIntersectsRect(ball1.frame, paddle.frame)) {
        
		//but if the ball will intersect the paddle on the next move,
		if (CGRectIntersectsRect(horizontal, paddle.frame)) {
			dx = -dx;
		}
        
		if (CGRectIntersectsRect(vertical, paddle.frame)) {
			dy = -dy;
		}
	}
    
}

- (void) bounce2 {
	//Where the ball would be if its horizontal motion were allowed
	//to continue for one more move.
	CGRect horizontal = ball2.frame;
	horizontal.origin.x += dx;
    
	//Where the ball would be if its vertical motion were allowed
	//to continue for one more move.
	CGRect vertical = ball2.frame;
	vertical.origin.y += dy;
    
	//Ball must remain inside self.bounds.
	if (!CGRectEqualToRect(horizontal, CGRectIntersection(horizontal, self.bounds))) {
		//Ball will bounce off left or right edge of View.
		dx = -dx;
	}
    
	if (!CGRectEqualToRect(vertical, CGRectIntersection(vertical, self.bounds))) {
		//Ball will bounce off top or bottom edge of View.
		dy = -dy;
	}
    
	//If the ball is not currently intersecting the paddle,
	if (!CGRectIntersectsRect(ball2.frame, paddle.frame)) {
        
		//but if the ball will intersect the paddle on the next move,
		if (CGRectIntersectsRect(horizontal, paddle.frame)) {
			dx = -dx;
		}
        
		if (CGRectIntersectsRect(vertical, paddle.frame)) {
			dy = -dy;
		}
	}
    
}

- (void) bounce3 {
	//Where the ball would be if its horizontal motion were allowed
	//to continue for one more move.
	CGRect horizontal = ball3.frame;
	horizontal.origin.x += dx;
    
	//Where the ball would be if its vertical motion were allowed
	//to continue for one more move.
	CGRect vertical = ball3.frame;
	vertical.origin.y += dy;
    
	//Ball must remain inside self.bounds.
	if (!CGRectEqualToRect(horizontal, CGRectIntersection(horizontal, self.bounds))) {
		//Ball will bounce off left or right edge of View.
		dx = -dx;
	}
    
	if (!CGRectEqualToRect(vertical, CGRectIntersection(vertical, self.bounds))) {
		//Ball will bounce off top or bottom edge of View.
		dy = -dy;
	}
    
	//If the ball is not currently intersecting the paddle,
	if (!CGRectIntersectsRect(ball3.frame, paddle.frame)) {
        
		//but if the ball will intersect the paddle on the next move,
		if (CGRectIntersectsRect(horizontal, paddle.frame)) {
			dx = -dx;
		}
        
		if (CGRectIntersectsRect(vertical, paddle.frame)) {
			dy = -dy;
		}
	}
    
}


- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView: self];
	CGFloat y = p.y;
    
	//Don't let the paddle move off the bottom or top of the View.
	CGFloat half = paddle.bounds.size.height / 2;
	y = MIN(y, self.bounds.size.height - half); //don't let y get too big
	y = MAX(y, half);                         //don't let y get too small
    
	paddle.center = CGPointMake(paddle.center.x, y);
	[self bounce];
}

- (void) move: (CADisplayLink *) displayLink {
	//NSLog(@"%.15g", displayLink.timestamp);	//15 significant digits
    
	ball1.center = CGPointMake(ball1.center.x + dx, ball1.center.y + dy);
	[self bounce];
    
    ball2.center = CGPointMake(ball2.center.x + dx, ball2.center.y + dy);
	[self bounce2];
    
    ball3.center = CGPointMake(ball3.center.x + dx, ball3.center.y + dy);
	[self bounce3];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect)rect
 {
 // Drawing code
 }
 */

@end
