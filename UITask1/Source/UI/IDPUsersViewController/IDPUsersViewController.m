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
#pragma mark Private

- (IBAction)onEditing:(id)sender {
    [self editing];
}

//- (IBAction)onSorting:(id)sender {    
//}

#pragma mark -
#pragma mark Private

- (void)editing {
    [self.usersView.tableView setEditing:!self.usersView.tableView.editing animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return kIDPRowsInSection;
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

#pragma mark -
#pragma mark IDPUsersModelObserver

- (void)modelArrayDidChange:(id)object {
    NSLog(@"Notify");
    UITableView *tableView = self.usersView.tableView;
    
    [tableView reloadData];
    /*
    NSUInteger users = [self.usersModel usersArrayCount];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:users - 1 inSection:0];
    
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
     */
}

@end
