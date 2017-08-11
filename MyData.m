//
//  MyData.m
//  MVC Pattern
//
//  Created by GBS-mac on 11/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "MyData.h"
#import "Singletone.h"
#import "CustomTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface MyData ()
{
    
}
@property(nonatomic,strong)NSArray *myData;
@end


@implementation MyData

-(id)init
{
    if (self=[super init]) {
        self.myData=[Singletone sharedSingleton].mainSectionArray;
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTableViewCell *cell=[(UITableView *)tableView dequeueReusableCellWithIdentifier:@"ProductList"];
    
    if (cell==nil) {
        cell=[[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProductList"];
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    NSURL *url=[[[[self.myData objectAtIndex:tableView.tag]objectAtIndex:indexPath.row]objectForKey:@"images"]objectForKey:@"hidpi"];
    [cell.backgroundImageview sd_setImageWithURL:url];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.myData objectAtIndex:tableView.tag] count];
}

@end
