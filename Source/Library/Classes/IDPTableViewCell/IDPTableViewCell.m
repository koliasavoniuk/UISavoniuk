//
//  IDPTableViewCell.m
//  UITask1
//
//  Created by Student002 on 6/19/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPTableViewCell.h"

@implementation IDPTableViewCell


#pragma mark -
#pragma mark Accessors

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
