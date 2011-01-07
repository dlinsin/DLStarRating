//
//  StarView.h
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//

#import <UIKit/UIKit.h>

#define kEdgeInsetBottom 20

@interface DLStarView : UIButton {

}

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)index;
- (void)centerIn:(CGRect)_frame with:(int)numberOfStars;

@end
