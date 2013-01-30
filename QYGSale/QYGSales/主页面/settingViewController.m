//
//  seconedViewController.m
//  QYGSales
//
//  Created by da zhan on 12-12-11.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//
  
#import "settingViewController.h"
#import "AdviseToAppViewController.h"
#import "ViewController.h"
@interface settingViewController ()

@end

@implementation settingViewController

@synthesize settingTable;
@synthesize settingList1;
@synthesize settingList2;
@synthesize settingList4;
@synthesize offLineLabel;



#pragma mark -
#pragma mark Initialization

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //self.navigationController.navigationBar.hidden=NO;
//    [ViewController share].button.hidden=NO;
}


- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([viewController isKindOfClass:[self class]]) {
        
        [ViewController share].button.hidden=NO;
    }
}


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.title=@"设置";
    self.navigationController.delegate=self;
    UIImage *title_bg = [UIImage imageNamed:@"navigationBarBackgroundRetro.png"];  //获取图片
    CGSize titleSize = self.navigationController.navigationBar.bounds.size;  //获取Navigation Bar的位置和大小
    title_bg = [self scaleToSize:title_bg size:titleSize];//设置图片的大小与Navigation Bar相同
    [self.navigationController.navigationBar  setBackgroundImage:title_bg forBarMetrics:UIBarMetricsDefault];
	NSMutableArray *array1 = [[NSMutableArray  alloc]initWithObjects:@"帐号绑定",
                              @"我的收藏",
                              @"离线下载",nil];
	
	NSMutableArray *array2 = [[NSMutableArray  alloc]initWithObjects:@"清理缓存",
                              @"意见反馈",
                              @"去App Store给我们评分",
                              @"更多应用",
                              @"关于",nil];
    
    NSMutableArray *array4 = [[NSMutableArray  alloc]initWithObjects:NSLocalizedString(@"OtherProduct",nil),
                              NSLocalizedString(@"SoftWare",nil),
                              NSLocalizedString(@"HardWare",nil),nil];
    
	self.settingList1 = array1;
	self.settingList2 = array2;
	self.settingList4 = array4;
    
    
	UIImageView *headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,320, 44)];
    headerView.image=[UIImage imageNamed:@"bottomviewbg.jpg"];
    headerView.userInteractionEnabled=YES;
    
    
    //Header back home button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(15, 4, 35, 35);
    [button setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back2Home) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:button];
    
    
    //Header title label
    UILabel *titleLabel=[[UILabel  alloc]initWithFrame:CGRectMake(130,6,50,30)];
    titleLabel.text=@"设置";
    titleLabel.font=[UIFont boldSystemFontOfSize:24];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    [headerView  addSubview:titleLabel];
    
    [self.view addSubview:headerView];
    [titleLabel release];
    [headerView release];
    
    
    settingTable=[[UITableView alloc]initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] applicationFrame].size.width,[[UIScreen mainScreen] applicationFrame].size.height - 50) style:UITableViewStyleGrouped];
    settingTable.delegate=self;
    settingTable.dataSource=self;
    settingTable.backgroundColor =[UIColor whiteColor];
    settingTable.backgroundView=nil;
    [self.view addSubview:settingTable];
    [settingTable release];
	
	[array1 release];
	[array2 release];
	[array4 release];
    
    adviseVC=[[AdviseToAppViewController alloc]init];
    paMoreAppVC=[[PinganMoreAppViewController alloc]init];
    aboutVC=[[AboutViewController alloc]init];
    helpGuideVC=[[HelpGuideViewController alloc]init];
    shareIDVC= [[shareIDRestrainViewController alloc]init];
	//self.settingTable.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
}



-(void)back2Home{
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
	switch (section)
	{
		case 0:
			return 1 ;   break;
		case 1:
			return [settingList1 count];   break;
		case 2:
			return [settingList2 count];   break;
		case 3:
			return [settingList4 count];   break;
		default:
			return 0 ;  break;
	}
}


//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//  switch (section)
//	{
//	  case 0:
//		 return   @" ";		  break;
//	  case 1:
//		 return   @" ";		  break;
//	  case 2:
//		  return  @" ";		  break;
//	  case 3:
//		  return  @" ";		      break;
//	  default:
//		  return @"";   		      break;
//  }
//}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
	switch (section)
	{
		case 2:
			return  @" ";
            break;
		default:
			return  @"";
            break;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = nil;
	NSUInteger section=[indexPath section];
	NSUInteger row = [indexPath row];
	if (section==1)
	{
		if (row==0)
		{
			static NSString *kDisplayCell_ID = @"DisplayCellID";
			cell = [tableView dequeueReusableCellWithIdentifier:kDisplayCell_ID];
			if (cell == nil)
			{
			    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDisplayCell_ID] autorelease];
				cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
			}
			
			cell.textLabel.text = [settingList1 objectAtIndex:row];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
		
		else if (row==1)
		{
			static NSString *SoundIdentifier = @"SoundIdentifier2";
			cell = [tableView dequeueReusableCellWithIdentifier:SoundIdentifier];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SoundIdentifier] autorelease];
				cell.selectionStyle= UITableViewCellSelectionStyleNone;
			}
            
			cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
			cell.textLabel.text = [settingList1 objectAtIndex:row];
		}
		else if (row==2)
		{
			static NSString *SoundIdentifier = @"SoundIdentifier3";
			cell = [tableView dequeueReusableCellWithIdentifier:SoundIdentifier];
			if (cell == nil)
			{
				cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SoundIdentifier] autorelease];
				cell.selectionStyle= UITableViewCellSelectionStyleNone;
			}
			if(offLineLabel==nil)
			{
				offLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(120,5, 160, 30)];
				offLineLabel.textAlignment=NSTextAlignmentRight;
                offLineLabel.backgroundColor=[UIColor clearColor];
				offLineLabel.textColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
				
				[cell addSubview:offLineLabel];
			}
			else {
				[cell addSubview:offLineLabel];
			}
			offLineLabel.text= @"关闭";
			cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
			cell.textLabel.text = [settingList1 objectAtIndex:row];
		}
	}
	else if(section == 2)
	{
		static NSString *SettingIdentifiter = @"DisplayCellID2";
		cell = [tableView dequeueReusableCellWithIdentifier:SettingIdentifiter];
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: SettingIdentifiter] autorelease];
			cell.selectionStyle=UITableViewCellStyleDefault;
		}
		if (row == 3 || row == 1 || row==4)
		{
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
		}
		else {
			cell.accessoryType=UITableViewCellAccessoryNone;
		}
		cell.textLabel.text =[settingList2 objectAtIndex:row];
        
	}
	else if(section ==0)
	{
		static NSString *SettingIdentifiter = @"DisplayCellWaring";
		cell = [tableView dequeueReusableCellWithIdentifier:SettingIdentifiter];
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: SettingIdentifiter] autorelease];
		    cell.selectionStyle=UITableViewCellStyleDefault;
		}
		cell.textLabel.text = @"使用指引";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
	}
	else if(section ==3)
	{
		static NSString *SettingIdentifiter = @"DisplayCellID3";
		cell = [tableView dequeueReusableCellWithIdentifier:SettingIdentifiter];
		if (cell == nil)
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: SettingIdentifiter] autorelease];
		    cell.selectionStyle=UITableViewCellStyleDefault;
			
		}
		if (row==0) {
			cell.textLabel.textColor = [UIColor colorWithRed:0.2 green:0.3 blue:1.0 alpha:1.0];
		}else {
			cell.textLabel.textColor = [UIColor blackColor];
		}
        
		cell.textLabel.text =[settingList4 objectAtIndex:row];
	}
    return cell;
}



- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    
}


-(void)deleteAllCatch{
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil
                                                          delegate:self
                                                 cancelButtonTitle:@"取消"
                                            destructiveButtonTitle:@"立即清理缓存"
                                                 otherButtonTitles:nil, nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
    
}

-(void)goToAppStore
{
    NSString *str = [NSString stringWithFormat:
                     @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d",
                     547203890];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}



#pragma mark -
#pragma mark UIActionSheet

-(void)myTask{
    sleep(3);
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        
        MBProgressHUD*  HUD =  HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        
        HUD.delegate = self;
        HUD.labelText = @"请稍后";
        HUD.detailsLabelText = @"正在清除...";
        HUD.square = YES;
        [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
        [HUD release];
    }
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 1)
	{
		switch (indexPath.row)
		{
			case 0:
                [self.navigationController pushViewController:shareIDVC animated:YES];
				break;
			default:
				break;
		}
		
	}
	else if (indexPath.section==2)
	{
		switch (indexPath.row)
		{
			case 0:
				//system("killall SpringBoard");
                [self deleteAllCatch];
				break;
			case 1:
                [self.navigationController pushViewController:adviseVC animated:YES];
				break;
			case 2:
                [self goToAppStore];
				break;
			case 3:
                [self.navigationController pushViewController:paMoreAppVC animated:YES];
				break;
			case 4:
                [self.navigationController pushViewController:aboutVC animated:YES];
				break;
			case 5:
				break;
			default:
				break;
		}
	}
	else if (indexPath.section==0)
	{
		switch (indexPath.row)
		{
			case 0:
                [ViewController share].button.hidden=YES;
                helpGuideVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:helpGuideVC animated:YES];
               
				break;
			default:
				break;
		}
	}
	else if (indexPath.section==3)
	{
		switch (indexPath.row)
		{
			case 0:
				break;
			case 1:
				
				break;
			case 2:
				break;
			default:
				break;
		}
	}
	else
	{
		NSLog(@"do nothing!");
	}
    
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	self.settingTable = nil;
	self.settingList1 = nil;
	self.settingList2 = nil;
	self.offLineLabel=nil;
    
}

- (void)dealloc
{
    
	[settingList1 release];
	[settingList2 release];
	[offLineLabel release];
    [super dealloc];
}

@end
