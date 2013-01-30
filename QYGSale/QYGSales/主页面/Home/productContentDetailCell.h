//
//  productContentDetailCell.h
//  QYGSales
//
//  Created by da zhan on 12-12-13.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productContentDetailCell : UITableViewCell{

    UIImageView *newsImageView;
    UILabel *titleLabel;
    UILabel *descLabel;
}
@property(nonatomic,retain) NSDictionary *newsDic;

@end
