//
//  PinganMoreAppViewController.h
//  PAPortalNew
//
//  Created by da zhan on 12-11-22.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinganMoreAppViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    UITableView *moreAppTableView;
    NSMutableArray *moreAppArray;
    
}

@end
