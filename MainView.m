//
//  MainView.m
//  MVC Pattern
//
//  Created by GBS-mac on 09/08/17.
//  Copyright © 2017 Globussoft. All rights reserved.
//

#import "MainView.h"
#import "HMSegmentedControl.h"
#import "CustomTableViewCell.h"
#import "Singletone.h"
#import "UIImageView+WebCache.h"
#import "MyData.h"
#import "MyView.h"

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface MainView ()
{
    
}
@property (nonatomic, strong) MyData * dataStore;
@property (nonatomic, strong) MyView * myView;

@end

@implementation MainView
{
  HMSegmentedControl *segmentation;
  NSArray *hmsegmentArray;
  UITableView *productsTableview;
  NSMutableArray *tableArray;
  NSArray *sectionArray;
  UIScrollView *segmentScrollview;
}

-(id)initWithFrame:(CGRect)frame
{
    if (self==[super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    hmsegmentArray=[[NSArray alloc]initWithObjects:@"Time",@"Bounds",@"Popular", nil];
    sectionArray=[[NSArray alloc]initWithObjects:[Singletone sharedSingleton].firstTableData,[Singletone sharedSingleton].secondTableData,[Singletone sharedSingleton].ThirdTableData, nil];
  
    [Singletone sharedSingleton].mainSectionArray=sectionArray;
    
    //
    segmentation=[[HMSegmentedControl alloc]initWithSectionTitles:hmsegmentArray];
    segmentation.frame=CGRectMake(0,0, SCREEN_WIDTH, 40);
    segmentation.backgroundColor=Rgb2UIColor(252, 122, 81);
    segmentation.selectionIndicatorColor =[UIColor blackColor];
    segmentation.selectionIndicatorHeight = 1.0f;
    segmentation.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentation.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [self  addSubview:segmentation];
    
    //Action For HMSegment Control
    [segmentation setIndexChangeBlock:^(NSInteger index) {
        
        int   accountMode = (int)index;
        
        NSLog(@"HMS egment Control Index Path=%d",accountMode);
        
      [segmentScrollview scrollRectToVisible:CGRectMake(SCREEN_WIDTH * index, 0, SCREEN_WIDTH, 200) animated:YES];
    }];

    segmentScrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-40)];
    segmentScrollview.backgroundColor = [UIColor clearColor];
    segmentScrollview.pagingEnabled = YES;
    segmentScrollview.delegate = self;
    
    tableArray = [[NSMutableArray alloc]init];
    for (int i = 0; i <[hmsegmentArray count]; i++) {
        CGFloat originOfEachPage = i * SCREEN_WIDTH;
        
        UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(originOfEachPage, 0, SCREEN_WIDTH, segmentScrollview.bounds.size.height)];
        pageView.backgroundColor = [UIColor clearColor];
        [segmentScrollview addSubview:pageView];
        
        productsTableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, pageView.frame.size.height)];
        productsTableview.backgroundColor=[UIColor clearColor];
        productsTableview.tag = i;
        
        self.myView = [[MyView alloc] init];
        productsTableview.delegate=self.myView;
        
        
        self.dataStore = [[MyData alloc] init];
        productsTableview.dataSource=self.dataStore;
        
        productsTableview.contentInset=UIEdgeInsetsMake(0,0, 100, 0);
        productsTableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        productsTableview.backgroundColor=[[UIColor lightGrayColor]colorWithAlphaComponent:0.5];
        [pageView addSubview:productsTableview];
  
        productsTableview.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
        [tableArray addObject:productsTableview];
        
        segmentScrollview.contentSize = CGSizeMake(self.frame.size.width * [hmsegmentArray count], segmentScrollview.frame.size.height);
        segmentScrollview.bounces = NO;
        segmentScrollview.showsHorizontalScrollIndicator = NO;
        CGPoint scrollPoint = CGPointMake(self.frame.size.width * 0, 0);
        [segmentScrollview setContentOffset:scrollPoint animated:YES];
        [self  addSubview:segmentScrollview];
    }
}

#pragma mark - scroll view delegate
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if ([scrollView isKindOfClass:[UITableView class]])
    {
        
    }
    else
    {
        CGFloat pageWidth = scrollView.frame.size.width;
        int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        [segmentation setSelectedSegmentIndex:page animated:YES];
     }
}

-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
    }
    else {
        CGFloat pageWidth = scrollView.frame.size.width;
        int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        [segmentation setSelectedSegmentIndex:page animated:YES];
         }
}

@end
