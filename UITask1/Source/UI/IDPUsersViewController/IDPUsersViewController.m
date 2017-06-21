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

IDPViewControllerBaseViewProperty(IDPUsersViewController, usersView, IDPUsersView)

@implementation IDPUsersViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsersModel:(IDPUsersModel *)usersModel {
    if (_usersModel != usersModel) {
        [_usersModel removeObserver:self];
        _usersModel = usersModel;
        [_usersModel addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark Buttons

- (IBAction)onEditing:(id)sender {
    [self editing];
}

- (IBAction)onAdd:(id)sender {
    [self adding];
}

#pragma mark -
#pragma mark Private

- (void)editing {
    [self.usersView.tableView setEditing:!self.usersView.tableView.editing animated:YES];
}

- (void)adding {
    [self.usersModel addObject:[IDPUser new]];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.usersModel.usersArrayCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellClass = NSStringFromClass([IDPUserCell class]);
    
    IDPUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    
    cell.user = self.usersModel[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.usersModel removeObject:self.usersModel[indexPath.row]];
        [self.usersView.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                                        withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.usersModel exchangeUserAtIndex:sourceIndexPath.row withUserAtIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark IDPUsersModelObserver

- (void)modelArrayAddObject:(id)object {
    
    UITableView *tableView = self.usersView.tableView;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
    
}


@end
