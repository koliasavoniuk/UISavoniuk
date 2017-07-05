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
#import "IDPModelObserver.h"
#import "IDPCache.h"

@interface IDPImageModel : IDPModel<IDPModelObserver>
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, readonly) NSURL       *url;
@property (nonatomic, readonly) IDPCache    *cache;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

@end
