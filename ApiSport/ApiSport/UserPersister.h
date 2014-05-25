//
//  Persister.h
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface UserPersister : NSObject
+ (id)sharedUserPersister;
-(void)addUser:(User*)user;
@end
