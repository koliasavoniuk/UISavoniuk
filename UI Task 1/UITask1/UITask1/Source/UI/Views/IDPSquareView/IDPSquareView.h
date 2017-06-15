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
    IDPSquareLeftBottom
};

@interface IDPSquareView : UIView
@property (nonatomic, assign)                       IDPSquarePosition    squarePos;
@property (nonatomic, readonly, getter=isMoving)    BOOL                 moving;

- (void)setSquarePosition:(IDPSquarePosition)position animated:(BOOL)animated;
- (void)setSquarePosition:(IDPSquarePosition)position
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL finished))completion;

- (void)tapButton;

@end
