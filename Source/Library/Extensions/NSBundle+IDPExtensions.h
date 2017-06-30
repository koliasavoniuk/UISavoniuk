//
//  NSBundle+IDPExtensions.h
//  UITask1
//
//  Created by Student002 on 6/30/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (IDPExtensions)

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(id)owner;
- (id)objectWithClass:(Class)cls owner:(id)owner option:(NSDictionary *)option;

@end
