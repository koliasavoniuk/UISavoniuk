//
//  IDPUser.m
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPUser.h"

#import "IDPRandom.h"
#import "IDPConstants.h"
#import "NSString+IDPCategory.h"

@interface IDPUser ()
@property (nonatomic, assign)   NSMutableArray  *mutableUsersArray;

@end

@implementation IDPUser

@dynamic fullName;
@dynamic imageURL;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomStringWithLength:kIDPNameLength alphabet:[NSString lowercaseLetterAlphabet]];
        self.surname = [NSString randomStringWithLength:kIDPNameLength alphabet:[NSString lowercaseLetterAlphabet]];
        self.mutableUsersArray = [NSMutableArray array];

    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [[NSString stringWithFormat:@"%@ %@", self.name, self.surname] capitalizedString];
}

- (NSURL *)imageURL {   
    return [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"idapLogo" ofType:@"png"]];
}

@end
