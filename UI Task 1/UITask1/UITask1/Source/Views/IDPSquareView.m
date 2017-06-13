//
//  IDPSquareView.m
//  UITask1
//
//  Created by Student002 on 6/13/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPSquareView.h"

#import "IDPSceneView.h"

@implementation IDPSquareView

#pragma mark -
#pragma mark Initializations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.center = CGPointMake(0, 0);
}

- (void)moveSquare {
    CGFloat sceneHeight = self.superview.bounds.size.height;
    CGFloat sceneWidth = self.superview.bounds.size.width;
    
    [UIView animateWithDuration:1.0 animations:^{
        self.center = CGPointMake(sceneWidth, sceneHeight);
        self.backgroundColor = [UIColor greenColor];
    } completion:nil];

    
    NSLog(@"TTRS");
}

@end
