//
//  CreationUtilisateurController.m
//  ApiSport
//
//  Created by Bryan D on 20/05/14.
//  Copyright (c) 2014 IOS team. All rights reserved.
//

#import "CreationUtilisateurController.h"
#import "Utilisateur.h"
#import <sqlite3.h>
@interface CreationUtilisateurController ()

@end

@implementation CreationUtilisateurController{
    sqlite3 *database;
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)creerUtilisateur:(id)sender {
  //  [self createEditableCopyOfDatabaseIfNeeded];
    sqlite3_stmt *insert_statement = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
   // NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = @"/Users/smiless/Desktop/workspace project/ApiSport/ApiSport/ApiDB.sqlite";
   
    NSLog(@"%@",path);
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        if (insert_statement == nil) {
            static char *sql = "INSERT INTO users (id_users,name,address) VALUES(?,?,?)";
            if (sqlite3_prepare_v2(database, sql, -1, &insert_statement, NULL) != SQLITE_OK) {
                NSAssert1(0, @"Error: failed to prepare statement with message '%s'.", sqlite3_errmsg(database));
            }
            NSString *name =@"lol";
            NSString *address=@"loladd";
            
            sqlite3_bind_int(insert_statement, 1, 5);
            sqlite3_bind_text(insert_statement, 2, [name UTF8String], -1,  SQLITE_TRANSIENT );
            sqlite3_bind_text(insert_statement, 3, [address UTF8String], -1, SQLITE_TRANSIENT );
        }
        int step;
        if ((step = sqlite3_step(insert_statement)) != SQLITE_DONE)
            NSLog(@"%s: step error: %s (%d)", __FUNCTION__, sqlite3_errmsg(database), step);
        else
            NSLog(@"success");
        
        
    }
    sqlite3_finalize(insert_statement);
    sqlite3_close(database);
}



- (void) createEditableCopyOfDatabaseIfNeeded{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"ApiDB.sqlite"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) {
        NSLog(@" succes createEditableCopyOfDatabaseIfNeeded");
        return;
    }
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ApiDB.sqlite"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}

- (NSMutableArray*) readDataFromDatabase
{
    NSMutableArray *dataArray  = [[NSMutableArray alloc] init];
    NSMutableDictionary *dataStored = [[NSMutableDictionary alloc] init];
    
    NSString *name;
    NSString *address;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"ApiDB.sqlite"];
    
    if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) {
        const char *sql = "SELECT * FROM users";
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                name =   [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                address = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                
                [dataStored setObject:name forKey:@"name"];
                [dataStored setObject:address forKey:@"address"];
                
                [dataArray addObject:[dataStored copy]];
            }
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(database);
    return dataArray;
}
@end
