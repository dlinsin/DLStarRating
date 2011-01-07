//
//  StarRatingViewController.h
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 Synyx GmbH & Co. KG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLStarRatingControl.h"


@interface StarRatingViewController : UIViewController<DLStarRatingDelegate> {
	IBOutlet UILabel *stars;
}

@property (retain,nonatomic) UILabel *stars;

@end
