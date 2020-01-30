//
//  CCCContactController.m
//  ContactsManagerMRC
//
//  Created by Jonalynn Masters on 1/29/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import "CCCContactController.h"
@interface CCCContactController ()

@property (nonatomic, retain) NSMutableArray *contacts;

@end

@implementation CCCContactController
- (instancetype)init {
    if (self = [super init]) {
        _contacts = [[[NSMutableArray alloc] init] retain];
    }
    return self;
}

- (NSUInteger)getContactsCount {
    if (_contacts) {
        return [_contacts count];
    }
    return 0;
}

-(CCCContact *)getContactAtIndex:(int)index {
    if ([_contacts objectAtIndex:index]) {
        return [_contacts objectAtIndex:index];
    }
    return nil;
}

- (void)addContact:(CCCContact *)newContact {
    if (_contacts) {
        [_contacts addObject:newContact];
    }
}

- (nullable CCCContact *)removeContactAtIndex:(int)index {
    if ([_contacts objectAtIndex:index]) {
        [_contacts removeObject:[_contacts objectAtIndex:index]];
    }
    return nil;
}

- (void)dealloc {
    [_contacts release];
    [super dealloc];
}

@end
