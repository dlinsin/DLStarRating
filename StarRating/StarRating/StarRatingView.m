//
//  StarRatingView.m
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 furryfishApps.com. All rights reserved.
//

#import "StarRatingView.h"
#import "StarView.h"


@implementation StarRatingView

@synthesize stars;

- (UIView*)subViewWithTag:(int)tag {
	for (UIView *v in self.subviews) {
		if (v.tag == tag) {
			return v;
		}
	}
	return nil;
}

- (UIButton*)buttonWith:(UIImage*)star :(UIImage*)highlight :(NSUInteger)index {
	StarView *b = [[StarView alloc] initWithFrame:CGRectMake(((star.size.width/2)*index), 0, star.size.width/2, star.size.height/2)];
	//UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
	//b.frame = CGRectMake(((star.size.width/2)*index), 0, star.size.width/2, star.size.height/2);
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
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches Began");
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView:self];
	int idx = abs(p.x / [self subViewWithTag:0].frame.size.width);
	UIButton *b = (UIButton*)[self subViewWithTag:idx];
	b.highlighted = !b.highlighted;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches moved");
	UITouch *touch = [touches anyObject];
	CGPoint p = [touch locationInView:self];
	int idx = abs(p.x / [self subViewWithTag:0].frame.size.width);
	if (idx != currentIdx) {
		UIButton *b = (UIButton*)[self subViewWithTag:idx];
		UIButton *bOld = (UIButton*)[self subViewWithTag:currentIdx];
		
		if (idx < currentIdx) {
			b.highlighted = NO;
			bOld.highlighted = NO;
		} else {
			b.highlighted = YES;
			bOld.highlighted = YES;
		}
		
		currentIdx = idx;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches ended");
	[super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches cancelled");
	[super touchesCancelled:touches withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	/*int idx = abs(point.x / self.frame.size.width);
	return [self.superview viewWithTag:idx];*/
	return self;
}

- (void)dealloc {
    self.stars = nil;
    [super dealloc];
}

@end
