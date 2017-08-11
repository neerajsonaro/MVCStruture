//
//  ViewController.m
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "ViewController.h"
#import "ModelClass.h"
#import "MainView.h"

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()<ModelClassDelegates>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    ModelClass *modelClass=[[ModelClass alloc]init];
    modelClass.delegate=self;
    [modelClass fetchData];
    
}

-(void)createUI
{
    NSLog(@"view controllwer function called ");
    MainView  * mainView=[[MainView alloc]initWithFrame:CGRectMake(0, 20,SCREEN_WIDTH , SCREEN_HEIGHT)];
    [self.view addSubview:mainView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
