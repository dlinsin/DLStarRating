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

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)inIndex {
	self = [super initWithFrame:CGRectMake((star.size.width*inIndex), 0, star.size.width, star.size.height+kEdgeInsetBottom)];
	if (self) {
		[self setImage:star forState:UIControlStateNormal];
		[self setImage:highlightedStar forState:UIControlStateSelected];
		[self setImage:highlightedStar forState:UIControlStateHighlighted];
		[self setTag:inIndex+kTagOffset];
		[self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, kEdgeInsetBottom, 0)];
		[self setBackgroundColor:[UIColor clearColor]];
        [self setContentMode:UIViewContentModeScaleToFill];
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
	
    
    if (_frame.size.height < self.frame.size.height)
    {
        size.height = _frame.size.height;
        size.width = _frame.size.height - kEdgeInsetBottom; //maintain aspect ratio of star
    }
    
    if (size.width * numberOfStars > _frame.size.width)
    {
        size.width = _frame.size.width /numberOfStars;
        size.height = size.width + kEdgeInsetBottom;
    }
    
	float height = size.height;
	float frameHeight = _frame.size.height;
        
	float newY = (frameHeight-height)/2;
	
	float widthOfStars = size.width * numberOfStars;
	float frameWidth = _frame.size.width;
	float gapToApply = (frameWidth-widthOfStars)/2;
	
    CGRect newRect = CGRectMake((size.width*(self.tag-kTagOffset)) + gapToApply, newY, size.width, size.height);
	self.frame = newRect;	
}

@end
