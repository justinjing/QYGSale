//
//  homeViewController.h
//  QYGSales
//
//  Created by da zhan on 12-12-11.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate>{
    UITableView *DataTable;
    NSDictionary *contentDic;
}

@end
