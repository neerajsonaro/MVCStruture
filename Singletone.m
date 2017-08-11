//
//  Singletone.m
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "Singletone.h"
#import <UIKit/UIKit.h>

@implementation Singletone
static Singletone *sharedSingleton;

+(Singletone *)sharedSingleton
{
    @synchronized (self)
    {
        if (!sharedSingleton)
        {
            sharedSingleton=[[Singletone alloc]init];
        }
        return sharedSingleton;
    }
}

@end
