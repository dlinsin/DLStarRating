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

@synthesize stars;

- (UIButton*)buttonWith:(UIImage*)star :(UIImage*)highlight :(NSUInteger)index {
	StarView *b = [[StarView alloc] initWithFrame:CGRectMake(((star.size.width/2)*index), 0, star.size.width/2, star.size.height/2)];
	[b setImage:star forState:UIControlStateNormal];
	[b setImage:highlight forState:UIControlStateSelected];
	[b setImage:highlight forState:UIControlStateHighlighted];
	b.tag = index;
	return b;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
		currentIdx = 0;
		UIImage *star = [UIImage imageNamed:@"star.png"];
		UIImage *highlight = [UIImage imageNamed:@"star_highlighted"];        
        [self addSubview:[self buttonWith:star :highlight :0]];
		[self addSubview:[self buttonWith:star :highlight :1]];
		[self addSubview:[self buttonWith:star :highlight :2]];
		[self addSubview:[self buttonWith:star :highlight :3]];
    }
    return self;
}

- (int)indexForPoint:(CGPoint)point inView:(UIView*)view {
	return abs(point.x / view.frame.size.width);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CGPoint point = [[touches anyObject] locationInView:self];
	int idx = [self indexForPoint:point inView:[self subViewWithTag:0]];
	UIButton *b = (UIButton*)[self subViewWithTag:idx];
	b.highlighted = !b.highlighted;
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

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	return self;
}

- (void)dealloc {
    self.stars = nil;
    [super dealloc];
}

@end
