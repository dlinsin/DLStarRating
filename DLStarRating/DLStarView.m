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

#import "DLStarView.h"


@implementation DLStarView

#pragma mark -
#pragma mark Initialization

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)index {
	self = [super initWithFrame:CGRectMake((star.size.width*index), 0, star.size.width, star.size.height+kEdgeInsetBottom)];
	if (self) {
		[self setImage:star forState:UIControlStateNormal];
		[self setImage:highlightedStar forState:UIControlStateSelected];
		[self setImage:highlightedStar forState:UIControlStateHighlighted];
		[self setTag:index];
		[self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, kEdgeInsetBottom, 0)];
		[self setBackgroundColor:[UIColor clearColor]];
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

@end
