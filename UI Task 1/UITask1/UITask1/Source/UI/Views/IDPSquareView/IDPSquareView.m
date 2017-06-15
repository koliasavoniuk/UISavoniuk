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
    CGPoint point;
    CGFloat sceneHeight = self.superview.bounds.size.height;
    CGFloat sceneWidth = self.superview.bounds.size.width;
    CGFloat squareHeight = self.bounds.size.height;
    CGFloat squareWidth = self.bounds.size.width;
    
    CGFloat leftX = squareWidth / 2;
    CGFloat rightX = sceneWidth - (squareWidth / 2);
    CGFloat topY = squareHeight / 2;
    CGFloat bottomY = sceneHeight - (squareHeight / 2);
    
    
    switch (position) {
        case IDPSquareLeftTop:
            point = CGPointMake(leftX, topY);
            break;
        case IDPSquareRightTop:
            point = CGPointMake(rightX, topY);
            break;
        case IDPSquareRightBottom:
            point = CGPointMake(rightX, bottomY);
            break;
        case IDPSquareLeftBottom:
            point = CGPointMake(leftX, bottomY);
            break;
            
        default:
            point = CGPointMake(leftX, topY);
            break;
    }
    
    return point;
}

@end
