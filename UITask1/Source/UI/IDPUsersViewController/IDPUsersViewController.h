//
//  IDPUsersViewController.h
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IDPUsersModelObserver.h"
#import "IDPUsersModel.h"

@class IDPUser;

@interface IDPUsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, IDPUsersModelObserver>
@property (nonatomic, strong)   IDPUser *user;
@property (nonatomic, strong)   IDPUsersModel   *usersModel;

- (IBAction)onEditing:(id)sender;
//- (IBAction)onSorting:(id)sender;
- (IBAction)onAdd:(id)sender;

@end
