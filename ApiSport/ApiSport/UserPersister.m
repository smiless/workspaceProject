//
//  Persister.m
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import "UserPersister.h"
#import "sqlite3.h"
#import "FMDatabase.h"
@implementation UserPersister{
    
    NSString *addUserStatement ;
}

+ (id)sharedUserPersister {
    static UserPersister *sharedUserPers= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserPers  = [[self alloc] init];
    });
    return sharedUserPers;
}

-(id)init{
 
    self = [super init];
    if (self) {
        addUserStatement =@"INSERT INTO USERS (id_user, name, firstname, email, login, password) VALUES (? ,? , ?, ?, ?, ?)";
    }
    return self;
}

-(void)addUser:(User *)user{
    
    NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [docPaths objectAtIndex:0];
    NSString *dbPath = [documentsDir   stringByAppendingPathComponent:@"testDB.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
    if([database open]){
    [database executeUpdate:addUserStatement,NULL,[NSString stringWithFormat:@"%@", user.name], [NSString stringWithFormat:@"%@", user.firstName], [NSString stringWithFormat:@"%@", user.email],[NSString stringWithFormat:@"%@", user.login],[NSString stringWithFormat:@"%@", user.pass],nil];
    [database close];
    }
}
@end
