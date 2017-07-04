//
//  IDPUsersViewController.m
//  UITask1
//
//  Created by Student002 on 6/15/17.
//  Copyright © 2017 Student002. All rights reserved.
//

#import "IDPUsersViewController.h"

#import "IDPUsersView.h"
#import "IDPMacro.h"
#import "IDPUser.h"
#import "IDPUserCell.h"
#import "IDPConstants.h"
#import "IDPChangeModel.h"
#import "IDPLoadingView.h"

#import "IDPChangeModel+UITableView.h"
#import "UITableView+IDPExtensions.h"

IDPViewControllerBaseViewProperty(IDPUsersViewController, usersView, IDPUsersView)

@implementation IDPUsersViewController


- (instancetype)init {
    self = [super init];

    return self;
}
#pragma mark -
#pragma mark Accessors

- (void)setUsersModel:(IDPUsersModel *)usersModel {
    if (_usersModel != usersModel) {
        [_usersModel removeObserver:self];
        _usersModel = usersModel;
        [_usersModel addObserver:self];
        
        [_usersModel load];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usersModel load];
}

#pragma mark -
#pragma mark Buttons

- (IBAction)onEdit:(id)sender {
    self.usersView.editing = !self.usersView.editing;
}

- (IBAction)onAdd:(id)sender {
    [self.usersModel addObject:[IDPUser new]];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.usersModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IDPUserCell *cell = [tableView reusableCellWithClassOrCreateNew:[IDPUserCell class]];
    cell.user = self.usersModel[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.usersModel removeObject:self.usersModel[indexPath.row]];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.usersModel moveObjectAtIndex:sourceIndexPath.row withIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark IDPArrayModelObserver

- (void)model:(id)model didChangeWithObject:(IDPChangeModel *)object {
    [object applyToTableView:self.usersView.tableView];
}

- (void)modelDidLoad:(id)object {
    IDPUsersView *userView = self.usersView;
    userView.animatedLoading = NO;
    //sleep(2);
    [userView.tableView reloadData];
}

- (void)modelWillLoad:(id)model {
    IDPUsersView *userView = self.usersView;
    userView.animatedLoading = YES;
}

@end
