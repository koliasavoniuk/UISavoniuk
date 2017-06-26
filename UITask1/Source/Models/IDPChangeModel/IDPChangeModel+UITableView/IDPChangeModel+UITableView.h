//
//  IDPChangeModel+UITableView.h
//  UITask1
//
//  Created by Student002 on 6/26/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPChangeModel.h"

@interface IDPChangeModel (UITableView)

- (void)applyToTableView:(UITableView *)table;
- (void)applyToTableView:(UITableView *)table section:(NSUInteger)section;
- (void)applyToTableView:(UITableView *)table section:(NSUInteger)section animation:(UITableViewRowAnimation)animation;

@end
