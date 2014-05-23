//
//  CreateUserController.m
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import "CreateUserController.h"
#import "Util.h"
@interface CreateUserController ()

@end

@implementation CreateUserController{
    NSMutableString *error;
    Util *util;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    error =[[NSMutableString alloc]initWithString:@""];
    util =[[Util alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)saveUser:(id)sender {
    [self checkUserField];
    
}
-(id)checkUserField{
    if(![util checkString:[_txtName text]])
        [error appendString:@"\nInvalid Name"];
    if(![util checkString:[_txtFirst text]])
        [error appendString:@"\nInvalid Firstname "];
    if(![util checkEmail:[_txtEmail text]])
        [error appendString:@"\nInvalid Email"];
    if(![util checkString:[_txtLogin text]])
        [error appendString:@"\nInvalid Login"];
    if(![util checkString:[_txtPassword text]])
        [error appendString:@"\nInvalid Password"];
    if(![[_txtRetype text]isEqualToString:[_txtPassword text]]){
        if(![util checkString:[_txtRetype text]])
            [error appendString:@"\nInvalid Password check"];
        else
            [error appendString:@"\nPasswords don't match"];
    }
    if(![error isEqualToString:@""]){
        [self showAlert];
        error = [[NSMutableString alloc]initWithString:@""];
    }
    return nil;
}
-(void)showAlert{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                              @"Erreur" message:error delegate:self
                                             cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
    
}

@end
