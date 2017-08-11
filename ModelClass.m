//
//  ModelClass.m
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "ModelClass.h"
#import "ApiHelperClass.h"
#import "Singletone.h"



@implementation ModelClass
{
    ModelClass *modelClass;
}

-(void)fetchData
{

    
    dispatch_group_t group=dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),^{
        ApiHelperClass *apiHelper=[[ApiHelperClass alloc]init];
        [Singletone sharedSingleton].firstTableData=[apiHelper serviceForFirstTable];
        NSLog(@"First Table Data=%@",[Singletone sharedSingleton].firstTableData);
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 2),^{
        ApiHelperClass *apiHelper=[[ApiHelperClass alloc]init];
        [Singletone sharedSingleton].secondTableData=[apiHelper serviceForSecondTable];
        NSLog(@"Second Table Data=%@",[Singletone sharedSingleton].secondTableData);
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 2),^{
        ApiHelperClass *apiHelper=[[ApiHelperClass alloc]init];
        [Singletone sharedSingleton].ThirdTableData=[apiHelper serviceForThirdTable];
        NSLog(@"Third Table Data=%@",[Singletone sharedSingleton].ThirdTableData);
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
      
            [_delegate createUI];
            
        });
    });
}


@end
