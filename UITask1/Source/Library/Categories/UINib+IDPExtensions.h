//
//  UINib+IDPExtensions.h
//  UITask1
//
//  Created by Student002 on 6/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (IDPExtensions)

NS_ASSUME_NONNULL_BEGIN

+ (instancetype)nibWithClass:(Class)cls;
+ (instancetype)nibWithClass:(Class)cls bundle:( NSBundle * _Nullable)bundle;

+ (id)objectFromNibWithClass:(Class)cls;

NS_ASSUME_NONNULL_END

@end
