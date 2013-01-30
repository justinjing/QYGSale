//
//  WeiBoShareViewController.m
//  PAPortalNew
//
//  Created by justin jing on 12-11-28.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "WeiBoShareViewController.h"

@interface WeiBoShareViewController ()

@end

@implementation WeiBoShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)goback2ShareMainView{
   
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self dismissModalViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImageView *headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,320, 44)];
    headerView.image=[UIImage imageNamed:@"bottomviewbg.jpg"];
    headerView.userInteractionEnabled=YES;
    
    
    //Header back home button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(15, 4, 35, 35);
    
    [button setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goback2ShareMainView) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:button];
    
    
    //Header title label
    UILabel *titleLabel=[[UILabel  alloc]initWithFrame:CGRectMake(110,6,100,30)];
    titleLabel.text=@"帐号绑定";
    titleLabel.font=[UIFont boldSystemFontOfSize:24];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    [headerView  addSubview:titleLabel];
    
    [self.view addSubview:headerView];
    [headerView release];
    [titleLabel release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
