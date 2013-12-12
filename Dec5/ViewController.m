//
//  ViewController.m
//  Dec5
//
//  Created by James Neely on 12/12/13.
//  Copyright (c) 2013 James Neely. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 - (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
 {
 self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void) loadView
{
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: frame];
}

- (void) viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	displayLink = [CADisplayLink
                   displayLinkWithTarget: self.view
                   selector: @selector(move:)
                   ];
    
	//Call move: every time the display is refreshed.
	displayLink.frameInterval = 1;
    
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink addToRunLoop: loop forMode: NSDefaultRunLoopMode];
}

- (NSUInteger) supportedInterfaceOrientations {
	return UIInterfaceOrientationMaskLandscapeLeft
    | UIInterfaceOrientationMaskLandscapeRight;
}

- (void) didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void) dealloc {
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink removeFromRunLoop: loop forMode: NSDefaultRunLoopMode];
}

@end
