//
//  UINib+IDPExtensions.m
//  UITask1
//
//  Created by Student002 on 6/21/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "UINib+IDPExtensions.h"

#import "NSArray+IDPExtensions.h"

@implementation UINib (IDPExtensions)

+ (instancetype)nibWithClass:(Class)class {
    return [self nibWithClass:class bundle:nil];
}

+ (instancetype)nibWithClass:(Class)class bundle:( NSBundle * _Nullable)bundle {
    NSString *nibClass = NSStringFromClass(class);
    
    return [UINib nibWithNibName:nibClass bundle:bundle];
}

+ (id)objectFromNibWithClass:(Class)class {
    UINib *nib = [UINib nibWithClass:class];
    NSArray *objects = [nib instantiateWithOwner:nil options:nil];
    
    NSArray *result = [objects arrayByFilteringWithBlock:^(id object){
        return [object isMemberOfClass:class];
    }];
    
    id object = [result firstObject];
    
    return object;
}

@end
