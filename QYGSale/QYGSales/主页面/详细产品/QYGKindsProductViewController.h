//
//  QYGKindsProductViewController.h
//  QYGSales
//
//  Created by da zhan on 13-1-25.
//  Copyright (c) 2013年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYGKindsProductViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    UITableView *DataTable;
    NSArray *contentArray;
    NSMutableArray *moreAppArray;
    NSArray *moreAppArrayBackup;
}
@end
