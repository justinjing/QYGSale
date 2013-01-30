//
//  firstViewController.m
//  QYGSales
//
//  Created by da zhan on 12-12-11.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "firstViewController.h"
#import "QYGKindsProductViewController.h"
 

@interface firstViewController ()

@end

@implementation firstViewController


- (void)dealloc
{
    [DataTable release];
    [contentArray release];
    [super dealloc];
}


-(void)loadView{
   // UIImageView *temp=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 230)];
    //temp.image=[UIImage imageNamed:@"logo_Vancl.png"];
     //[self.view addSubview:temp];
    
    
    
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[[UIScreen mainScreen] applicationFrame].size.width, [[UIScreen mainScreen] applicationFrame].size.height-93)];
    self.view = container;
    [container release];
    
    DataTable = [[UITableView alloc]initWithFrame:self.view.bounds];
    DataTable.delegate = self;
    DataTable.dataSource = self;
    //DataTable.backgroundColor=[UIColor clearColor];
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
	// Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    self.title=@"最新产品";
    UIImage *title_bg = [UIImage imageNamed:@"navigationBarBackgroundRetro.png"];  //获取图片
    CGSize titleSize = self.navigationController.navigationBar.bounds.size;  //获取Navigation Bar的位置和大小
    title_bg = [self scaleToSize:title_bg size:titleSize];//设置图片的大小与Navigation Bar相同
    [self.navigationController.navigationBar  setBackgroundImage:title_bg forBarMetrics:UIBarMetricsDefault];
    
    
    NSString *contentPath = [[NSBundle mainBundle]pathForResource:@"ImageNews" ofType:@"plist"];
    contentArray = [[NSArray alloc]initWithContentsOfFile:contentPath];

    
    NSMutableArray *array = [[NSMutableArray  alloc]initWithObjects:@"手机电源",
                             @"手机贴膜",
                             @"保护壳/套",
                             @"手机电池",
                             @"手机饰品",
                             @"iPhone配件",nil];
    //self.moreAppArray=array;
    moreAppArray = [[NSMutableArray alloc] initWithArray:array];
    [array release];
    
    UIImageView *headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0,-80,320, 230)];
    headerView.image=[UIImage imageNamed:@"logo_Vancl.png"];
    headerView.userInteractionEnabled=YES;
    [self.view addSubview:headerView];
    [self.view sendSubviewToBack:headerView];
    [headerView release];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSInteger rowCount = contentArray.count/4;
//    NSLog(@"==%d",[contentArray count]);
//    if (contentArray.count%4!=0) {
//        rowCount++;
//    }
    return [moreAppArray count];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    CGFloat rowHeight = 80;
//    return rowHeight;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [DataTable dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"cell"]autorelease];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            }

    cell.textLabel.text=[moreAppArray objectAtIndex:indexPath.row];
   
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QYGKindsProductViewController *fullController = [[QYGKindsProductViewController alloc]init];
  //  [ViewController share].button.hidden=YES;
  //  fullController.hidesBottomBarWhenPushed = YES;
    fullController.navigationItem.title = [moreAppArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:fullController animated:YES];
    [fullController release];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
