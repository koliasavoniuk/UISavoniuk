//
//  IDPSquareView.m
//  UITask1
//
//  Created by Student002 on 6/13/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPSquareView.h"

#import "IDPSceneView.h"

static const CGFloat kIDPAnimationDuration = 1.0f;

@interface IDPSquareView ()
@property (nonatomic, assign)   BOOL    moving;

@end

@implementation IDPSquareView

#pragma mark -
#pragma mark Initializations

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isMoving {
    return _moving;
}

- (void)setSquarePosition:(IDPSquarePosition)position {
    [self setSquarePosition:position animated:NO];

}

- (void)setSquarePosition:(IDPSquarePosition)position animated:(BOOL)animated {
    [self setSquarePosition:position animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(IDPSquarePosition)position
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL finished))completion {
    
    NSTimeInterval interval = 0;
    
    if (animated) {
        interval = kIDPAnimationDuration;
    }
    
    CGPoint point = [self pointWithPosition:position];
    point.x += (CGRectGetWidth(self.frame) / 2);
    point.y += (CGRectGetHeight(self.frame) / 2);
    
    
    [UIView animateWithDuration:interval animations:^{
        self.center = point;
    } completion:completion];
}

#pragma mark -
#pragma mark Public

- (void)tapButton {
    self.moving = !self.moving;
    
    [self endlessRunning];
}

#pragma mark -
#pragma mark Private

- (IDPSquarePosition)nextPosition {
    IDPSquarePosition position = self.squarePos;
    
    if (position == IDPSquareLeftBottom) {
        position = IDPSquareLeftTop;
    } else {
        position++;
    }
    self.squarePos = position;
    
    return self.squarePos;
}

- (void)endlessRunning {
    __weak IDPSquareView *weakSelfSquareView = self;
    
    [self setSquarePosition:self.squarePos animated:YES completionHandler:^(BOOL finished) {
        if (weakSelfSquareView.moving) {
            [weakSelfSquareView nextPosition];
            [weakSelfSquareView endlessRunning];
        }
    }];
}

- (CGPoint)pointWithPosition:(IDPSquarePosition)position {
    CGRect superViewFrame = [self.superview convertRect:self.superview.bounds toView:nil];
    CGRect frame = self.frame;
    
    CGPoint point = CGPointZero;
    CGPoint bottomRight = CGPointMake(CGRectGetWidth(superViewFrame) - CGRectGetWidth(frame), CGRectGetHeight(superViewFrame) - CGRectGetHeight(frame));
    
    switch (position) {
        case IDPSquareRightTop:
            point.x = bottomRight.x;
            break;
            
        case IDPSquareRightBottom:
            point = bottomRight;
            break;
            
        case IDPSquareLeftBottom:
            point.y = bottomRight.y;
            break;
            
        default:
            break;
    }
    
    frame.origin = point;
    
    return point;
}

@end
