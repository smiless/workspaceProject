//
//  Utilisateurs.m
//  ApiSport
//
//  Created by Bryan D on 20/05/14.
//  Copyright (c) 2014 IOS team. All rights reserved.
//

#import "Utilisateur.h"

@implementation Utilisateur
-(id)initWithNom:(NSString *)nom :(NSString *)prenom :(NSString *)pseudo :(NSString *)password :(int)age{
    
    self =[super init];
    if(self){
        
        _nom = nom;
        _prenom = prenom;
        _pseudo = pseudo;
        _password = password;
        _age = age;
    }
    
    return self;
}
@end
