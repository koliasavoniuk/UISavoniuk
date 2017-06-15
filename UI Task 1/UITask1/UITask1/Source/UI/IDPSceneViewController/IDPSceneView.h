//
//  IDPSceneView.h
//  UITask1
//
//  Created by Student002 on 6/12/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IDPSquareView.h"

@interface IDPSceneView : UIView
@property   (nonatomic, strong) IBOutlet    IDPSquareView   *squareView;
@property   (nonatomic, strong) IBOutlet    UIButton        *button;

@end
