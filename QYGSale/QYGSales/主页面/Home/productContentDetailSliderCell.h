//
//  productContentDetailSliderCell.h
//  QYGSales
//
//  Created by da zhan on 12-12-13.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface productContentDetailSliderCell : UITableViewCell<UIScrollViewDelegate,iCarouselDataSource,iCarouselDelegate>{
    
    UIScrollView *newsSliderScroll;
    UILabel *titleLabel;
    UIPageControl *pageControl;
    iCarousel *carousel;
    NSArray *sliderArray;
}
@property(nonatomic,retain) NSArray *sliderArray;
@property(nonatomic,readonly) UIScrollView *newsSliderScroll;
@property(nonatomic,retain) iCarousel *carousel;

@end
