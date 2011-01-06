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

- (void)setupView {
	currentIdx = 0;
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

- (id)initWithStars:(int)_numberOfStars {
	self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
	if (self) {
		numberOfStars = _numberOfStars;
		[self setupView];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame andStars:(int)_numberOfStars {
	
}

- (int)indexForPoint:(CGPoint)point inView:(UIView*)view {
	return abs(point.x / view.frame.size.width);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint point = [[touches anyObject] locationInView:self];
	int idx = [self indexForPoint:point inView:[self subViewWithTag:0]];
	
	UIButton *pressedButton = (UIButton*)[self subViewWithTag:idx];
	if (pressedButton.highlighted) {
		for (int i=numberOfStars; i >= idx; --i) {
			UIButton *b = (UIButton*)[self subViewWithTag:i];
			b.highlighted = NO;
		}
		
	} else {
		for (int i=0; i <= idx; i++) {
			UIButton *b = (UIButton*)[self subViewWithTag:i];
			b.highlighted = YES;
		}
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint point = [[touches anyObject] locationInView:self];
	int idx = [self indexForPoint:point inView:[self subViewWithTag:0]];
	
	UIButton *button = (UIButton*)[self subViewWithTag:idx];
	UIButton *currentButton = (UIButton*)[self subViewWithTag:currentIdx];
	
	if (idx < currentIdx) {
		currentButton.highlighted = NO;
		currentIdx = idx;
	} else if (idx > currentIdx) {
		currentButton.highlighted = YES;
		button.highlighted = YES;
		currentIdx = idx;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesCancelled:touches withEvent:event];
}

- (void)dealloc {
	self.star = nil;
	self.highlightedStar = nil;
	[super dealloc];
}

@end
