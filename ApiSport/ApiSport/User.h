//
//  User.h
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCopying>


@property NSString *name;
@property NSString *firstName;
@property NSString *email;
@property NSString *login;
@property NSString *pass;

-(id)initWithName:(NSString*)name :(NSString*)firstName :(NSString*)email :(NSString*)login :(NSString*)pass;

-(void)addUser:(User*)user;
@end
