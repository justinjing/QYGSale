//
//  shareIDRestrainViewController.h
//  PAPortalNew
//
//  Created by da zhan on 12-11-26.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCWBEngine.h"

#import "WBEngine.h"
#import "WBSendView.h"
#import "WBLogInAlertView.h"

@interface shareIDRestrainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,WBEngineDelegate, UIAlertViewDelegate, WBLogInAlertViewDelegate, WBSendViewDelegate>{
    
    TCWBEngine                  *weiboEngine;
    UITableView *moreAppTableView;
    NSArray *moreAppArray;
    
    WBEngine *weiBoEngine;
    WBSendView *sendView;
}


@property (nonatomic, retain) TCWBEngine   *weiboEngine;
//@property(nonatomic ,retain) NSArray *moreAppArray;
@property (nonatomic, retain) WBEngine *weiBoEngine;
@end
