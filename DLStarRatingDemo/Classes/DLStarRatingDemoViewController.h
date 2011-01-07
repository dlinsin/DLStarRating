//
//  DLStarRatingDemoViewController.h
//  DLStarRatingDemo
//
//  Created by David Linsin on 1/7/11.
//

#import <UIKit/UIKit.h>
#import "DLStarRatingControl.h"

@interface DLStarRatingDemoViewController : UIViewController<DLStarRatingDelegate> {
	IBOutlet UILabel *stars;
}

@property (retain,nonatomic) UILabel *stars;

@end

