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
@property (nonatomic, assign)   BOOL    running;

@end

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
        completionHandler:(void (^)(BOOL finished))completion {
    
    NSTimeInterval interval = 0;
    
    if (animated) {
        interval = kIDPAnimationDuration;
    }
    
    CGPoint point = [self pointWithPosition:position];
    
    [UIView animateWithDuration:interval animations:^{
        self.center = point;
    } completion:completion];
    
    NSLog(@"%lu", position);
}

#pragma mark -
#pragma mark Public

- (void)moveSquare {
    
    [self endlessRunning];
}

#pragma mark -
#pragma mark Private

- (IDPSquarePosition)nextPosition {
    if (self.squarePos == IDPSquareLeftBottom) {
        self.squarePos = IDPSquareLeftTop;
    } else {
        self.squarePos++;
    }
    
    return self.squarePos;
}

- (void)endlessRunning {
    __weak IDPSquareView *weakSelfSquareView = self;
    
    [self setSquarePosition:self.squarePos animated:YES completionHandler:^(BOOL finished) {
        [weakSelfSquareView nextPosition];
        [weakSelfSquareView endlessRunning];
    }];
}

- (CGPoint)pointWithPosition:(IDPSquarePosition)position {
    CGPoint point;
    CGFloat sceneHeight = self.superview.bounds.size.height;
    CGFloat sceneWidth = self.superview.bounds.size.width;
    CGFloat squareHeight = self.bounds.size.height;
    CGFloat squareWidth = self.bounds.size.width;
    
    CGFloat leftX = 0 + squareWidth / 2;
    CGFloat rightX = sceneWidth - (squareWidth / 2);
    CGFloat topY = 0 + squareHeight / 2;
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
