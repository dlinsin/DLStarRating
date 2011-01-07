//
//  DLStarRatingDemoAppDelegate.h
//  DLStarRatingDemo
//
//  Created by David Linsin on 1/7/11.
//

#import <UIKit/UIKit.h>

@class DLStarRatingDemoViewController;

@interface DLStarRatingDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DLStarRatingDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DLStarRatingDemoViewController *viewController;

@end

