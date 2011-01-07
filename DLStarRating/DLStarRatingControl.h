//
//  StarRatingView.h
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//

#import <UIKit/UIKit.h>

#define kDefaultNumberOfStars 5

@protocol DLStarRatingDelegate

- (void)newRating:(int)rating;

@end



@interface DLStarRatingControl : UIControl {
	int numberOfStars;
	int currentIdx;
	UIImage *star;
	UIImage *highlightedStar;
	id<DLStarRatingDelegate> delegate;
}

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame andStars:(int)_numberOfStars;

@property (retain,nonatomic) UIImage *star;
@property (retain,nonatomic) UIImage *highlightedStar;
@property (nonatomic) int rating;
@property (retain,nonatomic) id<DLStarRatingDelegate> delegate;

@end
