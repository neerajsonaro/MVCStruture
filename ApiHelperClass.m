//
//  ApiHelperClass.m
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "ApiHelperClass.h"

@implementation ApiHelperClass
{
    id jsonResponse;
}

-(id)serviceForFirstTable
{
    NSString *urlString=@"https://api.dribbble.com/v1/shots?sort=&access_token=a589847521cfb6420457b84d97addee8c7b108ad49d9a5768f66109bc0bbea21";
    return  [self getRequest:urlString];
    
}

-(id)serviceForSecondTable
{
    NSString *urlString=@"https://api.dribbble.com/v1/shots?sort=&list=rebounds&access_token=a589847521cfb6420457b84d97addee8c7b108ad49d9a5768f66109bc0bbea21";
    return  [self getRequest:urlString];
}


-(id)serviceForThirdTable
{
    NSString *urlString=@"https://api.dribbble.com/v1/shots?sort=&list=teams&access_token=a589847521cfb6420457b84d97addee8c7b108ad49d9a5768f66109bc0bbea21";
    return  [self getRequest:urlString];
}

#pragma Post Request without Post String, Direct Method
- (id)postRequest:(NSURL*)postUrl postString:(NSString*)postString {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    defaultConfigObject.timeoutIntervalForRequest = 30.0;
    defaultConfigObject.timeoutIntervalForResource = 60.0;
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: nil];
    
    NSURL * url = postUrl;
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSString * params =postString;
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           
                                                           if(data == nil) {
                                                               dispatch_semaphore_signal(semaphore);
                                                           }
                                                           else {
                                                               NSError *errorMsg = nil;
                                                               jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&errorMsg];
                                                               dispatch_semaphore_signal(semaphore);
                                                           }
                                                       }];
    [dataTask resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return jsonResponse;
}
#pragma mark Get Request Method
-(id)getRequest:(NSString *)urlString
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    defaultConfigObject.timeoutIntervalForRequest = 30.0;
    defaultConfigObject.timeoutIntervalForResource = 60.0;
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: nil];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:url
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(data == nil)
                                                        {
                                                            dispatch_semaphore_signal(semaphore);
                                                        }
                                                        else
                                                        {
                                                            jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                                                            NSLog(@"response -->%@",jsonResponse);
                                                            dispatch_semaphore_signal(semaphore);
                                                        }
                                                    }];
    [dataTask resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return jsonResponse;
}
@end
