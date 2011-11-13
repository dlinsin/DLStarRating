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
    
    // Custom Number of Stars
	DLStarRatingControl *customNumberOfStars = [[DLStarRatingControl alloc] initWithFrame:CGRectMake(0, 154, 320, 153) andStars:3];
	customNumberOfStars.backgroundColor = [UIColor groupTableViewBackgroundColor];
	customNumberOfStars.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
	customNumberOfStars.rating = 2;
	[self.view addSubview:customNumberOfStars];
    [customNumberOfStars release];
    
    // Custom Images 
    DLStarRatingControl *customStarImageControl = [[DLStarRatingControl alloc] initWithFrame:CGRectMake(0.0, 307.0, 320.0, 153.0)];
    
    // Set Custom Stars
    [customStarImageControl setStar:nil highlightedStar:[UIImage imageNamed:@"star_highlighted-darker.png"] atIndex:0];
    [customStarImageControl setStar:nil highlightedStar:[UIImage imageNamed:@"star_highlighted-darker.png"] atIndex:2];
    [customStarImageControl setStar:nil highlightedStar:[UIImage imageNamed:@"star_highlighted-darker.png"] atIndex:4];
    
    customStarImageControl.backgroundColor = [UIColor lightGrayColor];
    customStarImageControl.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    customStarImageControl.rating = 3;
    [self.view addSubview:customStarImageControl];
    [customStarImageControl release];
    
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
