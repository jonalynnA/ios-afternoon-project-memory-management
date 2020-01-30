//
//  CCCContact.h
//  ContactsManagerMRC
//
//  Created by Jonalynn Masters on 1/29/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCCContact : NSObject
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *nickname;
@property (nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *phoneNumber;

- (instancetype)initWithName:(NSString *)name nickname:(nullable NSString *)nickname email:(NSString *)email phoneNumber:(NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END
