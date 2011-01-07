//
//  StarView.h
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 furryfishApps.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StarView : UIButton {

}

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)index;
- (void)centerVertical:(CGRect)_frame;
- (void)centerHorizontal:(CGRect)_frame :(int)numberOfStars;
- (void)centerIn:(CGRect)_frame with:(int)numberOfStars;

@end
