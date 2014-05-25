//
//  User.m
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithName:(NSString*)name :(NSString*)firstName :(NSString*)email :(NSString*)login :(NSString*)pass{
    self = [super init];
    if(self){
        _name = name;
        _firstName = name;
        _email = email;
        _login = login;
        _pass = pass;
    }
    return self;
}

@end
