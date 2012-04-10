/*

    DLStarRating
    Copyright (C) 2011 David Linsin <dlinsin@gmail.com> 

    All rights reserved. This program and the accompanying materials
    are made available under the terms of the Eclipse Public License v1.0
    which accompanies this distribution, and is available at
    http://www.eclipse.org/legal/epl-v10.html

 */

#import <UIKit/UIKit.h>

#define kDefaultNumberOfStars 5

@protocol DLStarRatingDelegate;

@interface DLStarRatingControl : UIControl {
	int numberOfStars;
	int currentIdx;
	UIImage *star;
	UIImage *highlightedStar;
}

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame andStars:(NSUInteger)_numberOfStars;

@property (strong,nonatomic) UIImage *star;
@property (strong,nonatomic) UIImage *highlightedStar;
@property (nonatomic) NSUInteger rating;
@property (assign,nonatomic) IBOutlet id<DLStarRatingDelegate> delegate;

@end

@protocol DLStarRatingDelegate

- (void)newRating:(DLStarRatingControl *)control: (NSUInteger)rating;

@end
