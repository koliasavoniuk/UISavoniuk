//
//  IDPUsersView.h
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IDPLoadingViewContainer.h"

@interface IDPUsersView : IDPLoadingViewContainer
@property (nonatomic, strong)   IBOutlet    UITableView     *tableView;

@property (nonatomic, assign)   BOOL    editing;

@end
