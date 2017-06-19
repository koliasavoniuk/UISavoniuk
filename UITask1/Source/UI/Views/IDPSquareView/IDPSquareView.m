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

@implementation IDPSquareView

#pragma mark -
#pragma mark Initializations

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(IDPSquarePosition)position {
    [self setSquarePosition:position animated:NO];

}

- (void)setSquarePosition:(IDPSquarePosition)position animated:(BOOL)animated {
    [self setSquarePosition:position animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(IDPSquarePosition)position
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL finished))completion
{
    NSTimeInterval interval = 0;
    
    if (animated) {
        interval = kIDPAnimationDuration;
    }
    
    CGPoint point = [self centerPointWithPosition:position];

    [UIView animateWithDuration:interval
                     animations:^{
                        self.center = point;
                        _squarePos = position;
                    } completion:completion];
}

#pragma mark -
#pragma mark Public

- (void)moveSquare {
    self.moving = !self.moving;
    [self runSquare];
}

#pragma mark -
#pragma mark Private

- (IDPSquarePosition)nextPosition {
    return (self.squarePos + 1) % IDPSquarePositionCount;
}

- (void)runSquare {
    __weak IDPSquareView *weakSelfSquareView = self;
    
    [self setSquarePosition:self.squarePos animated:YES completionHandler:^(BOOL finished) {
        if (weakSelfSquareView.moving) {
            weakSelfSquareView.squarePos = weakSelfSquareView.nextPosition;
            [weakSelfSquareView runSquare];
        }
    }];
}

- (CGPoint)centerPointWithPosition:(IDPSquarePosition)position {
    CGRect superViewFrame = [self.superview convertRect:self.superview.bounds toView:nil];
    CGRect frame = self.bounds;
    
    CGPoint point = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    CGPoint bottomRight = CGPointMake(CGRectGetWidth(superViewFrame) - CGRectGetMidX(frame),
                                      CGRectGetHeight(superViewFrame) - CGRectGetMidY(frame));
    
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
