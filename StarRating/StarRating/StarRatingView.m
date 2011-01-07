//
//  StarRatingView.m
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 furryfishApps.com. All rights reserved.
//

#import "StarRatingView.h"
#import "StarView.h"
#import "UIView+Subviews.h"


@implementation StarRatingView

@synthesize star, highlightedStar;

#pragma mark -
#pragma mark Initialization

- (void)setupView {
	self.clipsToBounds = YES;
	currentIdx = -1;
	star = [[UIImage imageNamed:@"star.png"] retain];
	highlightedStar = [[UIImage imageNamed:@"star_highlighted"] retain];        
	for (int i=0; i<numberOfStars; i++) {
		StarView *v = [[StarView alloc] initWithDefault:self.star highlighted:self.highlightedStar position:i];
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
		[(StarView*)[self subViewWithTag:i] centerIn:self.frame with:numberOfStars];
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

- (void)disableStarsDownTo:(int)idx {
	for (int i=numberOfStars; i > idx; --i) {
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint point = [[touches anyObject] locationInView:self];	
	UIButton *pressedButton = [self starForPoint:point];
	if (pressedButton) {
		int idx = pressedButton.tag;
		if (pressedButton.highlighted) {
			[self disableStarsDownTo:idx];			
		} else {
			[self enableStarsUpTo:idx];
		}		
	} 
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint point = [[touches anyObject] locationInView:self];
	
	UIButton *pressedButton = [self starForPoint:point];
	if (pressedButton) {
		int idx = pressedButton.tag;
		UIButton *currentButton = (UIButton*)[self subViewWithTag:currentIdx];
		
		if (idx < currentIdx) {
			currentButton.highlighted = NO;
			currentIdx = idx;
			[self disableStarsDownTo:idx];
		} else if (idx > currentIdx) {
			currentButton.highlighted = YES;
			pressedButton.highlighted = YES;
			currentIdx = idx;
			[self enableStarsUpTo:idx];
		}
	} else if (point.x < [self subViewWithTag:0].frame.origin.x) {
		((UIButton*)[self subViewWithTag:0]).highlighted = NO;
		currentIdx = -1;
		[self disableStarsDownTo:0];
	}

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesCancelled:touches withEvent:event];
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
	self.star = nil;
	self.highlightedStar = nil;
	[super dealloc];
}

@end
