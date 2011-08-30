/*

    DLStarRating
    Copyright (C) 2011 David Linsin <dlinsin@gmail.com> 

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
