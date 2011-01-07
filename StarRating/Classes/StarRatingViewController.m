//
//  StarRatingViewController.m
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 Synyx GmbH & Co. KG. All rights reserved.
//

#import "StarRatingViewController.h"
#import "StarRatingView.h"

@implementation StarRatingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	StarRatingView *customNumberOfStars = [[StarRatingView alloc] initWithFrame:CGRectMake(0, 230, 320, 230) andStars:3];
	customNumberOfStars.backgroundColor = [UIColor groupTableViewBackgroundColor];
	customNumberOfStars.autoresizingMask =  UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
	[self.view addSubview:customNumberOfStars];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

@end
