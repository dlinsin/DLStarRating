//
//  StarRatingView.h
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 furryfishApps.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StarRatingView : UIView {
    NSArray *stars;    
	int currentIdx;
}

@property(retain,nonatomic) NSArray *stars;

@end
