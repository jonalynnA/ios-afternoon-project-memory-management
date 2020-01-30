//
//  CCCContactDetailViewController.m
//  ContactsManagerMRC
//
//  Created by Jonalynn Masters on 1/29/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCContactDetailViewController.h"
#import "CCCContactController.h"
#import "CCCContact.h"

@interface CCCContactDetailViewController ()
@property (retain, nonatomic) IBOutlet UITextField *contactNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *contactNicknameTextField;
@property (retain, nonatomic) IBOutlet UITextField *contactEmailTextField;
@property (retain, nonatomic) IBOutlet UITextField *contactPhoneNumberTextField;

@end

@implementation CCCContactDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_controller retain];
    [self updateViews];
}


- (IBAction)saveTapped:(UIBarButtonItem *)sender {
    if (_contact) {
        _contact.name = _contactNameTextField.text;
        _contact.nickname = _contactNicknameTextField.text;
        _contact.email = _contactEmailTextField.text;
        _contact.phoneNumber = _contactPhoneNumberTextField.text;
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        _contact = [[[CCCContact alloc] initWithName:_contactNameTextField.text nickname:_contactNicknameTextField.text email:_contactEmailTextField.text phoneNumber:_contactPhoneNumberTextField.text] retain];
        [_controller addContact:self.contact];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setContact:(CCCContact *)contact {
    [_contact release];
    _contact = contact;
    [_contact retain];
    [self updateViews];
}

- (void)updateViews {
    if (_contact) {
        [self setTitle:_contact.name];
        [_contactNameTextField setText:_contact.name];
        [_contactNicknameTextField setText:_contact.nickname];
        [_contactEmailTextField setText:_contact.email];
        [_contactPhoneNumberTextField setText:_contact.phoneNumber];
    }
}


- (void)dealloc {
    [_contactNameTextField release];
    [_contactNicknameTextField release];
    [_contactEmailTextField release];
    [_contactPhoneNumberTextField release];
    [_contact release];
    [_controller release];
    [super dealloc];
}
@end
