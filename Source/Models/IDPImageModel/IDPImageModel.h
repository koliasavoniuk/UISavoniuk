//
//  IDPImageModel.h
//  UITask1
//
//  Created by Student002 on 7/3/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDPModel.h"

#import "IDPModel.h"
#import "IDPUsersModelObserver.h"

@interface IDPImageModel : IDPModel<IDPUsersModelObserver>
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;
- (void)dump;

@end
