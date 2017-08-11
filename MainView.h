//
//  MainView.h
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>


-(id)initWithFrame:(CGRect)frame;

@end
