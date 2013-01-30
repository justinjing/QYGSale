//
//  QYGKindsProductViewController.m
//  QYGSales
//
//  Created by da zhan on 13-1-25.
//  Copyright (c) 2013年 da zhan. All rights reserved.
//

#import "QYGKindsProductViewController.h"
#import "HMSegmentedControl.h"

#define EachLabelPostionX 10.0f
#define EachLabelWidth    230.0f


@interface QYGKindsProductViewController ()

@end

@implementation QYGKindsProductViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [DataTable release];
    [contentArray release];
    [moreAppArray release];
    [moreAppArrayBackup release];
    [super dealloc];
}


-(void)loadView{
    // UIImageView *temp=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 230)];
    //temp.image=[UIImage imageNamed:@"logo_Vancl.png"];
    //[self.view addSubview:temp];
    
    
    
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen] applicationFrame].size.width, [[UIScreen mainScreen] applicationFrame].size.height-93)];
    self.view = container;
    [container release];
    
    DataTable = [[UITableView alloc]initWithFrame:CGRectMake(0,32,[[UIScreen mainScreen] applicationFrame].size.width, [[UIScreen mainScreen] applicationFrame].size.height-93+32)];
    DataTable.delegate = self;
    DataTable.dataSource = self;
   // DataTable.backgroundColor=[UIColor clearColor];
    [self.view addSubview:DataTable];
    
}

 
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

-(void)ButtonIndex{
    
    [DataTable reloadData];
}
-(void)ButtonIndex1{
    
    [DataTable reloadData];
}

-(void)ButtonIndex2{
    
    [DataTable reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    UIImage *title_bg = [UIImage imageNamed:@"navigationBarBackgroundRetro.png"];  //获取图片
    CGSize titleSize = self.navigationController.navigationBar.bounds.size;  //获取Navigation Bar的位置和大小
    title_bg = [self scaleToSize:title_bg size:titleSize];//设置图片的大小与Navigation Bar相同
    [self.navigationController.navigationBar  setBackgroundImage:title_bg forBarMetrics:UIBarMetricsDefault];
    
    
    NSString *contentPath = [[NSBundle mainBundle]pathForResource:@"ImageNews" ofType:@"plist"];
    contentArray = [[NSArray alloc]initWithContentsOfFile:contentPath];
    
    
    NSMutableArray *_mutiArray = [[NSMutableArray alloc] init];
    [_mutiArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"98.0",@"productprice",@"110",@"productsells", nil]];
    [_mutiArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"138.0",@"productprice",@"220",@"productsells", nil]];
    [_mutiArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"88.0",@"productprice",@"80",@"productsells", nil]];
    [_mutiArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"129.0",@"productprice",@"300",@"productsells", nil]];
    [_mutiArray addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"79.0",@"productprice",@"29",@"productsells", nil]];
    
  
    moreAppArray = [[NSMutableArray alloc] initWithArray:_mutiArray];
    moreAppArrayBackup=[[NSMutableArray alloc] initWithArray:_mutiArray];

    [_mutiArray release];
 
    
    HMSegmentedControl *segmentedControl2 = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"默认", @"价格↑", @"销量↓"]];
    [segmentedControl2 setIndexChangeBlock:^(NSUInteger index) {
        if (index==0) { 
           //产品默认排序
            moreAppArray = [[NSMutableArray alloc] initWithArray:moreAppArrayBackup];
 
            [self ButtonIndex];
            
        }else if (index==1) {
            //产品价格升序排列
            NSComparator cmptr = ^(id obj1, id obj2){
                if ([[obj1 objectForKey:@"productprice"] floatValue] > [[obj2 objectForKey:@"productprice"] floatValue]) {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                
                if ([[obj1 objectForKey:@"productprice"] floatValue] < [[obj2 objectForKey:@"productprice"] floatValue]) {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                
                return (NSComparisonResult)NSOrderedSame;
            };
            
            NSArray *array = [moreAppArray sortedArrayUsingComparator:cmptr];
           
            moreAppArray=[[NSMutableArray alloc] initWithArray:array];
            [self ButtonIndex1];
            
        }if (index==2) {
            //产品销量降序排列
            NSComparator cmptr = ^(id obj1, id obj2){
                if ([[obj1 objectForKey:@"productsells"] floatValue] < [[obj2 objectForKey:@"productsells"] floatValue]) {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                
                if ([[obj1 objectForKey:@"productsells"] floatValue] > [[obj2 objectForKey:@"productsells"] floatValue]) {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                
                return (NSComparisonResult)NSOrderedSame;
            };
            
            NSArray *array = [moreAppArray sortedArrayUsingComparator:cmptr];
            
            moreAppArray=[[NSMutableArray alloc] initWithArray:array];
 
            [self ButtonIndex2];
        }
    }];
    
    [segmentedControl2 setSelectionIndicatorHeight:4.0f];
    [segmentedControl2 setBackgroundColor:[UIColor blackColor]];
    [segmentedControl2 setTextColor:[UIColor whiteColor]];
    [segmentedControl2 setSelectionIndicatorColor:[UIColor redColor]];
    [segmentedControl2 setSelectionIndicatorMode:HMSelectionIndicatorFillsSegment];
    [segmentedControl2 setSegmentEdgeInset:UIEdgeInsetsMake(0, 6, 0, 6)];
    [segmentedControl2 setCenter:CGPointMake(160, 16)];
    [segmentedControl2 setTag:2];
    [self.view addSubview:segmentedControl2];
    [segmentedControl2 release];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     
    return [moreAppArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [DataTable dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"cell"]autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        //cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    UILabel  *pricetitleLabel = (UILabel *)[[cell contentView]viewWithTag:22220];
    if (!pricetitleLabel) {
        pricetitleLabel =[ [UILabel alloc] initWithFrame:CGRectMake(EachLabelPostionX,2, 40, 30)];
        pricetitleLabel.font = [UIFont systemFontOfSize:16];
        pricetitleLabel.lineBreakMode = UILineBreakModeWordWrap;
        pricetitleLabel.numberOfLines = 999;
        pricetitleLabel.backgroundColor=[UIColor clearColor];
        pricetitleLabel.tag=22220;
        [cell.contentView addSubview:pricetitleLabel];
        [pricetitleLabel release];
    }
    pricetitleLabel.text = @"价格:";
    
    
    UILabel  *titleLabel = (UILabel *)[[cell contentView]viewWithTag:22221];
    if (!titleLabel) {
        titleLabel =[ [UILabel alloc] initWithFrame:CGRectMake(EachLabelPostionX+40,2, EachLabelWidth, 30)];
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        titleLabel.numberOfLines = 999;
        titleLabel.backgroundColor=[UIColor clearColor];
        titleLabel.tag=22221;
        [cell.contentView addSubview:titleLabel];
        [titleLabel release];
    }
    titleLabel.text =[[moreAppArray objectAtIndex:indexPath.row] objectForKey:@"productprice"];
    
    
    UILabel  *sellstitleLabel = (UILabel *)[[cell contentView]viewWithTag:22222];
    if (!sellstitleLabel) {
        sellstitleLabel =[ [UILabel alloc] initWithFrame:CGRectMake(EachLabelPostionX,titleLabel.frame.origin.y+titleLabel.frame.size.height, 40, 30)];
        sellstitleLabel.font = [UIFont systemFontOfSize:16];
        sellstitleLabel.lineBreakMode = UILineBreakModeWordWrap;
        sellstitleLabel.numberOfLines = 999;
        sellstitleLabel.backgroundColor=[UIColor clearColor];
        sellstitleLabel.tag=22222;
        [cell.contentView addSubview:sellstitleLabel];
        [sellstitleLabel release];
    }
    sellstitleLabel.text = @"销量:";
    
    UILabel  *descriptionLabel = (UILabel *)[[cell contentView]viewWithTag:22223];
    if (!descriptionLabel) {
        descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(EachLabelPostionX+40,titleLabel.frame.origin.y+titleLabel.frame.size.height, EachLabelWidth, 30)];
        descriptionLabel.font = [UIFont systemFontOfSize:16];
        descriptionLabel.lineBreakMode = UILineBreakModeWordWrap;
        descriptionLabel.numberOfLines = 999;
        descriptionLabel.textColor=[UIColor grayColor];
        descriptionLabel.tag=22223;
        descriptionLabel.backgroundColor=[UIColor clearColor];
        [cell.contentView addSubview:descriptionLabel];
        [descriptionLabel release];
    }
    descriptionLabel.text = [[moreAppArray objectAtIndex:[indexPath row]]objectForKey:@"productsells"];
    return cell;
    
}

@end
