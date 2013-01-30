//
//  firstViewController.h
//  QYGSales
//
//  Created by da zhan on 12-12-11.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface firstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *DataTable;
    NSArray *contentArray;
    NSArray *moreAppArray;
}
@end

