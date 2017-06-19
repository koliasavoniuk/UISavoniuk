//
//  IDPUser.m
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPUser.h"

#import "IDPRandom.h"
#import "NSString+IDPCategory.h"

static const NSUInteger kIDPNameLength = 7;

@implementation IDPUser

@dynamic fullName;
@dynamic image;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomStringWithLength:kIDPNameLength alphabet:[NSString lowercaseLetterAlphabet]];
        self.surname = [NSString randomStringWithLength:kIDPNameLength alphabet:[NSString lowercaseLetterAlphabet]];

    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [[NSString stringWithFormat:@"%@ %@", self.name, self.surname] capitalizedString];
}

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"idapLogo" ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
