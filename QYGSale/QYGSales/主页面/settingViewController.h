//
//  seconedViewController.h
//  QYGSales
//
//  Created by da zhan on 12-12-11.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdviseToAppViewController.h"
#import "PinganMoreAppViewController.h"
#import "MBProgressHUD.h"
#import "AboutViewController.h"
#import "HelpGuideViewController.h"
#import "shareIDRestrainViewController.h"
#import "ViewController.h"

@interface settingViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIAlertViewDelegate,UIActionSheetDelegate,MBProgressHUDDelegate>
{
	UITableView *settingTable;
	NSArray *settingList1;
	NSArray *settingList2;
	NSArray *settingList4;
	UILabel  *offLineLabel;
    AdviseToAppViewController *adviseVC;
    PinganMoreAppViewController *paMoreAppVC;
    AboutViewController    *aboutVC;
	HelpGuideViewController *helpGuideVC;
    shareIDRestrainViewController *shareIDVC;
    ViewController *testVC;
}
@property (nonatomic, retain) UITableView *settingTable;
@property (nonatomic, retain) NSArray *settingList1;
@property (nonatomic, retain) NSArray *settingList2;
@property (nonatomic, retain) NSArray *settingList4;
@property (nonatomic, retain) UILabel  *offLineLabel;



@end