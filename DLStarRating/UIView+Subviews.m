//
//  UIView+Subviews.m
//  StarRating
//
//  Created by David Linsin on 1/6/11.
//

#import "UIView+Subviews.h"


@implementation UIView (Subviews)

- (UIView*)subViewWithTag:(int)tag {
	for (UIView *v in self.subviews) {
		if (v.tag == tag) {
			return v;
		}
	}
	return nil;
}

@end
