//
//  DLStarRatingDemoViewController.m
//  DLStarRatingDemo
//
//  Created by David Linsin on 1/7/11.
//

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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark -
#pragma mark Delegate implementation of NIB instatiated DLStarRatingControl

-(void)newRating:(int)rating {
	self.stars.text = [NSString stringWithFormat:@"%d star rating",rating];
}


#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	self.stars = nil;
	[super dealloc];
}

@end
