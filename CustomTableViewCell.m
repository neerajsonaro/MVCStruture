//
//  CustomTableViewCell.m
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "CustomTableViewCell.h"
#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@implementation CustomTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        if ([reuseIdentifier isEqualToString:@"ProductList"]) {
           
            _containerView=[[UIView alloc]initWithFrame:CGRectMake(5,5, SCREEN_WIDTH-10,SCREEN_HEIGHT/2)];
            _containerView.backgroundColor=[UIColor whiteColor];
            [self.contentView addSubview:_containerView];

            _backgroundImageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2-60)];
            [_containerView addSubview:_backgroundImageview];
               
        }
    }
    return self;
}
@end
