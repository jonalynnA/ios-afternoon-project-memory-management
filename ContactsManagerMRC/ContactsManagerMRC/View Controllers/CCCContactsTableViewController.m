//
//  CCCContactsTableViewController.m
//  ContactsManagerMRC
//
//  Created by Jonalynn Masters on 1/29/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCContactsTableViewController.h"
#import "CCCContactDetailViewController.h"
#import "CCCContactController.h"
#import "CCCContact.h"

@interface CCCContactsTableViewController ()
@property (nonatomic, retain) CCCContactController *controller;
@end

@implementation CCCContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _controller = [[[CCCContactController alloc] init] retain];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.controller getContactsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    
    CCCContact *contact = [[self.controller getContactAtIndex:(int)[indexPath row]] retain];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ | %@", contact.nickname, contact.name];
    cell.detailTextLabel.text = contact.phoneNumber;
    
    [contact release];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_controller removeContactAtIndex:(int)[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CCCContactDetailViewController *detailVC = [segue destinationViewController];
    
    if ([[segue identifier] isEqual:@"ShowAddContactSegue"]) {
        detailVC.controller = self.controller;
    } else if ([[segue identifier] isEqual:@"ShowContactDetailSegue"]) {
        detailVC.controller = self.controller;
        detailVC.contact = [_controller getContactAtIndex:(int)[self.tableView.indexPathForSelectedRow row]];
    }
}

- (void)dealloc {
    [_controller release];
    [super dealloc];
}

@end
