//
//  Util.h
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject
-(BOOL)checkString:(NSString*)stringToCheck;
-(BOOL)checkUpToZero:(int)number;
-(BOOL)checkObject:(id)object;
-(BOOL)checkEmail:(NSString *)checkString;
@end
