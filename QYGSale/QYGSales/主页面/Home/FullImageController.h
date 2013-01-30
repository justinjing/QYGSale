//
//  FullImageController.h
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJComboBox.h"
#import "DownPullItem.h"

@interface FullImageController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,AJComboBoxDelegate,DownPullItemDelegate>{
    UITableView *DataTable;
    NSDictionary *contentDic;
    UIScrollView *scrollView;
    UIImageView *imageView;
    NSArray *arr;
    NSArray *maarr;
    UITextField *totalNumberTextField;
    int totalNumber;
    
    NSMutableArray* colorPullDownArray;
    NSMutableArray* capabilityPullDownArray;
    BOOL isPullDown;
    
}
@property(nonatomic,retain) UIImage *image;

@end
