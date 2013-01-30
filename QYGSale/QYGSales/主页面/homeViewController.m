//
//  homeViewController.m
//  QYGSales
//
//  Created by da zhan on 12-12-11.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "homeViewController.h"
#import "NewsSliderCell.h"
#import "NewsListCell.h"
#import "FullImageController.h"
#import "ViewController.h"
 


@interface homeViewController ()

@end

@implementation homeViewController

- (void)dealloc
{
    [DataTable release];
    [contentDic release];
    [super dealloc];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([viewController isKindOfClass:[self class]]) {
        
        [ViewController share].button.hidden=NO;
    }
}

-(void)loadView{
    
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen] applicationFrame].size.width,[[UIScreen mainScreen] applicationFrame].size.height-93)];
    self.view = container;
    [container release];
    
    DataTable = [[UITableView alloc]initWithFrame:self.view.bounds];
    DataTable.delegate = self;
    DataTable.dataSource = self;
    [self.view addSubview:DataTable];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.delegate=self;
    self.title=@"欢迎你";
    UIImage *title_bg = [UIImage imageNamed:@"navigationBarBackgroundRetro.png"];  //获取图片
    CGSize titleSize = self.navigationController.navigationBar.bounds.size;  //获取Navigation Bar的位置和大小
    title_bg = [self scaleToSize:title_bg size:titleSize];//设置图片的大小与Navigation Bar相同
    [self.navigationController.navigationBar  setBackgroundImage:title_bg forBarMetrics:UIBarMetricsDefault];
    
    
    NSString *contentPath = [[NSBundle mainBundle]pathForResource:@"NewsRoot" ofType:@"plist"];
    contentDic = [[NSDictionary alloc]initWithContentsOfFile:contentPath];
//    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 63, 30)];
//    [backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(pushBack) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    self.navigationItem.leftBarButtonItem = backButtonItem;
//    [backButtonItem release];
//    [backButton release];
}


#pragma make-
#pragma make Uitableviewdelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return contentDic.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberOfRows=0;
    if (section==0) {
        numberOfRows = 1;
    }else if (section==1) {
        NSArray *newsList = [contentDic objectForKey:@"NewsList"];
        numberOfRows = newsList.count;
    }
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight=150;
    if (indexPath.section==0) {
        rowHeight = 150;
    }else if (indexPath.section==1) {
        rowHeight = 70;
    }
    return rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=nil;
    if (indexPath.section==0) {
        NewsSliderCell *sliderCell = [DataTable dequeueReusableCellWithIdentifier:@"sliderCell"];
        if (sliderCell==nil) {
            sliderCell = [[[NewsSliderCell alloc]initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:@"sliderCell"]autorelease];
            
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(scrollViewTap:)];
        
            [sliderCell.newsSliderScroll addGestureRecognizer:tapGesture];
            [tapGesture release];
        }
        sliderCell.sliderArray = [contentDic objectForKey:@"Slider"];
        cell = sliderCell;
    }else if (indexPath.section==1) {
        NewsListCell *newsCell = [DataTable dequeueReusableCellWithIdentifier:@"newsCell"];
        if (newsCell==nil) {
            newsCell = [[[NewsListCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                           reuseIdentifier:@"newsCell"]autorelease];
            
            
        }
        NSArray *newsList = [contentDic objectForKey:@"NewsList"];
        NSDictionary *newsDic = [newsList objectAtIndex:indexPath.row];
        newsCell.newsDic = newsDic;
        cell = newsCell;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)scrollViewTap:(UITapGestureRecognizer*)theTap{
    CGPoint touchPoint = [theTap locationInView:theTap.view];
    NSInteger index = floor(touchPoint.x/320);
    NSArray *sliderArray = [contentDic objectForKey:@"Slider"];
    NSDictionary *sliderDic = [sliderArray objectAtIndex:index];
    UIImage *image = [UIImage imageNamed:[sliderDic objectForKey:@"image"]];
    NSLog(@"image:%@",[sliderDic objectForKey:@"image"]);
    FullImageController *fullController = [[FullImageController alloc]init];
    fullController.image = image;
    [ViewController share].button.hidden=YES;
    fullController.hidesBottomBarWhenPushed = YES;
    fullController.navigationItem.title = [sliderDic objectForKey:@"title"];
    [self.navigationController pushViewController:fullController animated:YES];
    [fullController release];
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FullImageController *fullController = [[FullImageController alloc]init];
    [ViewController share].button.hidden=YES;
    fullController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:fullController animated:YES];
    [fullController release];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
