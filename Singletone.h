//
//  Singletone.h
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singletone : NSObject

+(Singletone *)sharedSingleton;

@property(nonatomic,strong) NSArray *firstTableData;
@property(nonatomic,strong) NSArray *secondTableData;
@property(nonatomic,strong) NSArray *ThirdTableData;
@property(nonatomic,strong) NSArray *mainSectionArray;

@end
