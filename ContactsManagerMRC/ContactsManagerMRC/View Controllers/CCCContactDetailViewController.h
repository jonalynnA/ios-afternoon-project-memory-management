//
//  CCCContactDetailViewController.h
//  ContactsManagerMRC
//
//  Created by Jonalynn Masters on 1/29/20.
//  Copyright © 2020 Jonalynn Masters. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CCCContact;
@class CCCContactController;
@interface CCCContactDetailViewController : UIViewController

@property (nonatomic, retain) CCCContact *contact;
@property (nonatomic, retain) CCCContactController *controller;

@end

NS_ASSUME_NONNULL_END
