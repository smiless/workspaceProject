//
//  CreateUserController.h
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateUserController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtFirst;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtRetype;
- (IBAction)saveUser:(id)sender;

@end
