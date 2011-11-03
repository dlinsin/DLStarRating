/*

    DLStarRating
    Copyright (C) 2011 David Linsin <dlinsin@gmail.com> 

    All rights reserved. This program and the accompanying materials
    are made available under the terms of the Eclipse Public License v1.0
    which accompanies this distribution, and is available at
    http://www.eclipse.org/legal/epl-v10.html

 */

#import <UIKit/UIKit.h>

#define kEdgeInsetBottom 10
#define kTagOffset 18000

@interface DLStarView : UIButton {

}

- (id)initWithDefault:(UIImage*)star highlighted:(UIImage*)highlightedStar position:(int)inIndex;
- (void)centerIn:(CGRect)_frame with:(int)numberOfStars;

@end
