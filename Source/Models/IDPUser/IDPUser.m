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
@property (nonatomic, strong)   NSString    *imageURL;

@end

@implementation IDPUser

@dynamic fullName;
@dynamic imageModel;

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

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [self init];
    
    self.name = [coder decodeObjectForKey:kIDPKeyName];
    self.surname = [coder decodeObjectForKey:kIDPKeySurname];
    self.imageURL = [coder decodeObjectForKey:kIDPKeyImageURL];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:kIDPKeyName];
    [coder encodeObject:self.surname forKey:kIDPKeySurname];
    [coder encodeObject:self.imageURL forKey:kIDPKeyImageURL];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullName {
    return [[NSString stringWithFormat:@"%@ %@", self.name, self.surname] capitalizedString];
}

- (NSString *)imageURL {
    return [[NSBundle mainBundle] pathForResource:kIDPImageName ofType:kIDPImageExtension];
    
}

- (IDPInternetImageModel *)imageModel {
    NSURL *url = [NSURL URLWithString:kIDPImageURL];
    
    return [IDPInternetImageModel imageWithURL:url];
}

@end
