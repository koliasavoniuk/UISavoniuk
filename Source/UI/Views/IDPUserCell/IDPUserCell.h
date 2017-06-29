//
//  IDPUserCell.h
//  UITask1
//
//  Created by Student002 on 6/19/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPTableViewCell.h"

@class IDPUser;

@interface IDPUserCell : IDPTableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel     *fullNameLabel;
@property (nonatomic, strong)   IBOutlet    UIImageView *userImageView;

@property (nonatomic, strong)   IDPUser *user;

- (void)fillWithUser:(IDPUser *)user;

@end
