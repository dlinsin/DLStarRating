/*

    DLStarRating
    Copyright (C) 2011 David Linsin <dlinsin@gmail.com> 

    All rights reserved. This program and the accompanying materials
    are made available under the terms of the Eclipse Public License v1.0
    which accompanies this distribution, and is available at
    http://www.eclipse.org/legal/epl-v10.html

 */

#import <UIKit/UIKit.h>
#import "DLStarRatingControl.h"

@interface DLStarRatingDemoViewController : UIViewController<DLStarRatingDelegate> {
	IBOutlet UILabel *stars;
}

@property (retain,nonatomic) UILabel *stars;

@end

