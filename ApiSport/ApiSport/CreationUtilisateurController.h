//
//  CreationUtilisateurController.h
//  ApiSport
//
//  Created by Bryan D on 20/05/14.
//  Copyright (c) 2014 IOS team. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface CreationUtilisateurController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtNom;
@property (weak, nonatomic) IBOutlet UITextField *txtPrenom;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;
@property (weak, nonatomic) IBOutlet UITextField *txtPseudo;
@property (weak, nonatomic) IBOutlet UITextField *txtPass;
- (IBAction)creerUtilisateur:(id)sender;

@end 
