//
//  Util.m
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import "Util.h"

@implementation Util

-(BOOL)checkString:(NSString *)stringToCheck{
    if([stringToCheck isEqualToString:@""] || stringToCheck == nil)
        return false;
    return true;
}
-(BOOL)checkObject:(id)object{
    if(object == nil)
        return false;
    return true;
}
-(BOOL)checkUpToZero:(int)number{
    if(number <= 0)
        return false;
    return true;
}

-(BOOL)checkEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
@end
