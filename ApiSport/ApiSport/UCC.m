//
//  UCC.m
//  ApiSport
//
//  Created by Bryan D on 23/05/14.
//  Copyright (c) 2014 com.bidi. All rights reserved.
//

#import "UCC.h"

@implementation UCC
+ (id)sharedUCC {
    static UCC *sharedUCC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUCC  = [[self alloc] init];
    });
    return sharedUCC;
}

@end
