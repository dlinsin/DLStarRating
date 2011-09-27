/*

    DLStarRating
    Copyright (C) 2011 David Linsin <dlinsin@gmail.com> 

    All rights reserved. This program and the accompanying materials
    are made available under the terms of the Eclipse Public License v1.0
    which accompanies this distribution, and is available at
    http://www.eclipse.org/legal/epl-v10.html

 */

#import "DLStarRatingDemoViewController.h"

@implementation DLStarRatingDemoViewController

@synthesize stars;

#pragma mark -
#pragma mark View setup

- (void)viewDidLoad {
    [super viewDidLoad];
	DLStarRatingControl *customNumberOfStars = [[DLStarRatingControl alloc] initWithFrame:CGRectMake(0, 230, 320, 230) andStars:3];
	customNumberOfStars.backgroundColor = [UIColor groupTableViewBackgroundColor];
	customNumberOfStars.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
	customNumberOfStars.rating = 2;
	[self.view addSubview:customNumberOfStars];
    [customNumberOfStars release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Delegate implementation of NIB instatiated DLStarRatingControl

-(void)newRating:(DLStarRatingControl *)control :(NSUInteger)rating {
	self.stars.text = [NSString stringWithFormat:@"%d star rating",rating];
}


#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	self.stars = nil;
	[super dealloc];
}

@end
