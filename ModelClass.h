//
//  ModelClass.h
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@class ModelClass;
@protocol ModelClassDelegates <NSObject>
-(void)createUI;
@end


@interface ModelClass : NSObject
@property(nonatomic,strong) id <ModelClassDelegates> delegate;


-(void)fetchData;

@end
