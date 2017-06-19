//
//  IDPSquareView.h
//  UITask1
//
//  Created by Student002 on 6/13/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, IDPSquarePosition) {
    IDPSquareLeftTop,
    IDPSquareRightTop,
    IDPSquareRightBottom,
    IDPSquareLeftBottom,
    IDPSquarePositionCount
};

@interface IDPSquareView : UIView
@property (nonatomic, assign)   IDPSquarePosition   squarePosition;
@property (nonatomic, assign)   BOOL                moving;

- (void)setSquarePosition:(IDPSquarePosition)position;
- (void)setSquarePosition:(IDPSquarePosition)position animated:(BOOL)animated;

@end
