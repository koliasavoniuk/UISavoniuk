//
//  IDPUsersView.h
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IDPLoadingView;

@interface IDPUsersView : UIView
@property (nonatomic, strong)   IBOutlet    UITableView     *tableView;
@property (nonatomic, strong)   IBOutlet    IDPLoadingView  *loadingView;

@end
