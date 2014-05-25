//
//  User.m
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import "User.h"
#import "UserPersister.h"
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

-(void)addUser:(User *)user{
    UserPersister *sharedPersister = [UserPersister sharedUserPersister];
    [sharedPersister addUser:user];
}

-(id) copyWithZone: (NSZone *) zone
{
    User *userCopy = [[User allocWithZone: zone] init];
    
    userCopy->_name = [_name copyWithZone:zone];
    userCopy->_firstName = [_firstName copyWithZone:zone];
    userCopy->_email = [_email copyWithZone:zone];
    userCopy->_login = [_login copyWithZone:zone];
    userCopy->_pass = [_pass copyWithZone:zone];
    return userCopy;
}
@end
