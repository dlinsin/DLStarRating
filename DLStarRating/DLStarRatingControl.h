/*

    DLStarRating
    Copyright (C) 2011 David Linsin <dlinsin@gmail.com> 

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

 */

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
	IBOutlet id<DLStarRatingDelegate> delegate;
}

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame andStars:(int)_numberOfStars;

@property (retain,nonatomic) UIImage *star;
@property (retain,nonatomic) UIImage *highlightedStar;
@property (nonatomic) int rating;
@property (retain,nonatomic) id<DLStarRatingDelegate> delegate;

@end
