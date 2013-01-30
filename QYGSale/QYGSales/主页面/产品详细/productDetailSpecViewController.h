//
//  productDetailSpecViewController.h
//  QYGSales
//
//  Created by da zhan on 12-12-18.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productDetailSpecViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

  UITableView *DataTable;
  NSArray *normalTitleArray;
}


@end
