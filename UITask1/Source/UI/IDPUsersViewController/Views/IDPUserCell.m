//
//  IDPUserCell.m
//  UITask1
//
//  Created by Student002 on 6/19/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPUserCell.h"

#import "IDPUser.h"

@implementation IDPUserCell

#pragma mark -
#pragma mark Accessors

- (void)setUser:(IDPUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithUser:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithUser:(IDPUser *)user {
    self.fullNameLabel.text = user.fullName;
    self.userImageView.image = [UIImage imageWithContentsOfFile:[user.imageURL absoluteString]];
}

@end
