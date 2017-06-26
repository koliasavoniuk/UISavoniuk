//
//  IDPSceneView.m
//  UITask1
//
//  Created by Student002 on 6/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPSceneView.h"

@implementation IDPSceneView

#pragma mark -
#pragma mark Public

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)changeButtonTitle {
    [self.button setTitle:self.squareView.moving ? @"Start" : @"Stop" forState:UIControlStateNormal];
}

@end
