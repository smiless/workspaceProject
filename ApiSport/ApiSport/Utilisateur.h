//
//  Utilisateurs.h
//  ApiSport
//
//  Created by Bryan D on 20/05/14.
//  Copyright (c) 2014 IOS team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilisateur : NSObject
@property NSString* nom, *prenom,*pseudo,*password;
@property int age;

-(id)initWithNom:(NSString*)nom :(NSString*)prenom :(NSString*)pseudo :(NSString*)password :(int)age;

@end
