//
//  MyView.m
//  MVC Pattern
//
//  Created by GBS-mac on 11/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "MyView.h"
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@implementation MyView

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"index path=%ld",(long)indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return SCREEN_HEIGHT/2;
}

@end
