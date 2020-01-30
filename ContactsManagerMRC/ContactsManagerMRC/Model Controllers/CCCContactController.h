//
//  CCCContactController.h
//  ContactsManagerMRC
//
//  Created by Jonalynn Masters on 1/29/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CCCContact;
@interface CCCContactController : NSObject

- (NSUInteger)getContactsCount;
- (CCCContact *)getContactAtIndex:(int)index;
- (void)addContact:(CCCContact *)newContact;
- (nullable CCCContact *)removeContactAtIndex:(int)index;


@end

NS_ASSUME_NONNULL_END
