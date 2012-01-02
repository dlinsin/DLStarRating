/*

    DLStarRating
    Copyright (C) 2011 David Linsin <dlinsin@gmail.com> 

    All rights reserved. This program and the accompanying materials
    are made available under the terms of the Eclipse Public License v1.0
    which accompanies this distribution, and is available at
    http://www.eclipse.org/legal/epl-v10.html

 */

#import "DLStarView.h"


@implementation DLStarView

#pragma mark -
#pragma mark Initialization

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)index {
	self = [super initWithFrame:CGRectMake((star.size.width*index), 0, star.size.width, star.size.height+kEdgeInsetBottom)];
	if (self) {
        [self setStarImage:star highlightedStarImage:highlightedStar];
		[self setTag:index];
		[self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, kEdgeInsetBottom, 0)];
		[self setBackgroundColor:[UIColor clearColor]];
        if (index == 0) {
   	        [self setAccessibilityLabel:[NSString stringWithFormat:@"1 star", index]];   
        } else {
   	        [self setAccessibilityLabel:[NSString stringWithFormat:@"%d stars", index+1]];   
        }
	}
	return self;
}

#pragma mark -
#pragma mark UIView methods

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	return self.superview;
}

#pragma mark -
#pragma mark Layouting

- (void)centerIn:(CGRect)_frame with:(int)numberOfStars {
	CGSize size = self.frame.size;
	
	float height = self.frame.size.height;
	float frameHeight = _frame.size.height;
	float newY = (frameHeight-height)/2;
	
	float widthOfStars = self.frame.size.width * numberOfStars;
	float frameWidth = _frame.size.width;
	float gapToApply = (frameWidth-widthOfStars)/2;
	
	self.frame = CGRectMake((size.width*self.tag) + gapToApply, newY, size.width, size.height);	
}

- (void)setStarImage:(UIImage*)starImage highlightedStarImage:(UIImage*)highlightedImage {
    [self setImage:starImage forState:UIControlStateNormal];
    [self setImage:highlightedImage forState:UIControlStateSelected];
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
}

@end
