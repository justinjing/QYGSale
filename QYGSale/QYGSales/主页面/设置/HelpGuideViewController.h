//
//  HelpGuideViewController.h
//  PAPortalNew
//
//  Created by da zhan on 12-11-26.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+SplitImageIntoTwoParts.h"

@interface HelpGuideViewController : UIViewController<UIScrollViewDelegate>

//@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *left;
@property (nonatomic,strong) UIImageView *right;

@property (retain, nonatomic) UIScrollView *pageScroll;
@property (retain, nonatomic) UIPageControl *pageControl;


@end
