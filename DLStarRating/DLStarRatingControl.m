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

#import "DLStarRatingControl.h"
#import "DLStarView.h"
#import "UIView+Subviews.h"


@implementation DLStarRatingControl

@synthesize star, highlightedStar, delegate;

#pragma mark -
#pragma mark Initialization

- (void)setupView {
	self.clipsToBounds = YES;
	currentIdx = -1;
	star = [[UIImage imageNamed:@"star.png"] retain];
	highlightedStar = [[UIImage imageNamed:@"star_highlighted.png"] retain];        
	for (int i=0; i<numberOfStars; i++) {
		DLStarView *v = [[DLStarView alloc] initWithDefault:self.star highlighted:self.highlightedStar position:i];
		[self addSubview:v];
		[v release];
	}
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
		numberOfStars = kDefaultNumberOfStars;
		[self setupView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		numberOfStars = kDefaultNumberOfStars;
		[self setupView];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame andStars:(int)_numberOfStars {
	self = [super initWithFrame:frame];
	if (self) {
		numberOfStars = _numberOfStars;
		[self setupView];
	}
	return self;
}

- (void)layoutSubviews {
	for (int i=0; i < numberOfStars; i++) {
		[(DLStarView*)[self subViewWithTag:i] centerIn:self.frame with:numberOfStars];
	}
}

#pragma mark -
#pragma mark Touch Handling

- (UIButton*)starForPoint:(CGPoint)point {
	for (int i=0; i < numberOfStars; i++) {
		if (CGRectContainsPoint([self subViewWithTag:i].frame, point)) {
			return (UIButton*)[self subViewWithTag:i];
		}
	}	
	return nil;
}

- (void)disableStarsDownToExclusive:(int)idx {
	for (int i=numberOfStars; i > idx; --i) {
		UIButton *b = (UIButton*)[self subViewWithTag:i];
		b.highlighted = NO;
	}
}

- (void)disableStarsDownTo:(int)idx {
	for (int i=numberOfStars; i >= idx; --i) {
		UIButton *b = (UIButton*)[self subViewWithTag:i];
		b.highlighted = NO;
	}
}


- (void)enableStarsUpTo:(int)idx {
	for (int i=0; i <= idx; i++) {
		UIButton *b = (UIButton*)[self subViewWithTag:i];
		b.highlighted = YES;
	}
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint point = [touch locationInView:self];	
	UIButton *pressedButton = [self starForPoint:point];
	if (pressedButton) {
		int idx = pressedButton.tag;
		if (pressedButton.highlighted) {
			[self disableStarsDownToExclusive:idx];
		} else {
			[self enableStarsUpTo:idx];
		}		
		currentIdx = idx;
	} 
	return YES;		
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
	[super cancelTrackingWithEvent:event];
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint point = [touch locationInView:self];
	
	UIButton *pressedButton = [self starForPoint:point];
	if (pressedButton) {
		int idx = pressedButton.tag;
		UIButton *currentButton = (UIButton*)[self subViewWithTag:currentIdx];
		
		if (idx < currentIdx) {
			currentButton.highlighted = NO;
			currentIdx = idx;
			[self disableStarsDownToExclusive:idx];
		} else if (idx > currentIdx) {
			currentButton.highlighted = YES;
			pressedButton.highlighted = YES;
			currentIdx = idx;
			[self enableStarsUpTo:idx];
		}
	} else if (point.x < [self subViewWithTag:0].frame.origin.x) {
		((UIButton*)[self subViewWithTag:0]).highlighted = NO;
		currentIdx = -1;
		[self disableStarsDownToExclusive:0];
	}
	return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
	[self.delegate newRating:self.rating];
	[super endTrackingWithTouch:touch withEvent:event];
}

#pragma mark -
#pragma mark Rating Property

- (void)setRating:(int)_rating {
	[self disableStarsDownTo:0];
	currentIdx = _rating-1;
	[self enableStarsUpTo:currentIdx];
}

- (int)rating {
	return currentIdx+1;
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	self.star = nil;
	self.highlightedStar = nil;
	self.delegate = nil;
	[super dealloc];
}

@end
