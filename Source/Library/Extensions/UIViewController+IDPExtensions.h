//
//  UIViewController+IDPExtensions.h
//  UITask1
//
//  Created by Student002 on 6/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (IDPExtensions)
+ (instancetype)viewController;

// You should override this method if you want to init viewController from nib with necessary name
+ (NSString *)nibName;

@end
