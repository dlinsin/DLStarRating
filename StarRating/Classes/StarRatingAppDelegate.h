//
//  StarRatingAppDelegate.h
//  StarRating
//
//  Created by David Linsin on 1/4/11.
//  Copyright 2011 furryfishApps.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StarRatingViewController;

@interface StarRatingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    StarRatingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet StarRatingViewController *viewController;

@end
