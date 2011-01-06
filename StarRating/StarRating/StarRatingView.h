//
//  StarRatingView.h
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 furryfishApps.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDefaultNumberOfStars 5


@interface StarRatingView : UIView {
	int numberOfStars;
	int currentIdx;
	UIImage *star;
	UIImage *highlightedStar;
}

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame andStars:(int)_numberOfStars;

@property (retain,nonatomic) UIImage *star;
@property (retain,nonatomic) UIImage *highlightedStar;

@end
