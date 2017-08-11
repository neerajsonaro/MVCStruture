//
//  CustomTableViewCell.h
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property(nonatomic,strong)UIView *containerView;
@property(nonatomic,strong)UIImageView *backgroundImageview;
@property(nonatomic,strong)UIView *viewForViewAndName;


@end
