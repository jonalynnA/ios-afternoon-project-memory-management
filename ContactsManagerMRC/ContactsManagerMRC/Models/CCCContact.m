//
//  CCCContact.m
//  ContactsManagerMRC
//
//  Created by Jonalynn Masters on 1/29/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCContact.h"

@implementation CCCContact
- (instancetype)initWithName:(NSString *)name nickname:(nullable NSString *)nickname email:(NSString *)email phoneNumber:(NSString *)phoneNumber {
    if (self = [super init]) {
        _name = [name retain];
        _phoneNumber = [phoneNumber retain];
        _email = [email retain];
        _nickname = [nickname retain];
        
        NSLog(@"Contact.init");
    }
    return self;
}

- (void)dealloc {
    [_name release];
    [_nickname release];
    [_email release];
    [_phoneNumber release];
    
    NSLog(@"Contact.dealloc");
    [super dealloc];
}

@end
