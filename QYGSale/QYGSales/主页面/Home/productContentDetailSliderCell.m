//
//  productContentDetailSliderCell.m
//  QYGSales
//
//  Created by da zhan on 12-12-13.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "productContentDetailSliderCell.h"


#define kSliderImageTag 100
#define kSliderLabelTag 101


#define ITEM_SPACING 180

@implementation productContentDetailSliderCell
  
@synthesize sliderArray = _sliderArray;
@synthesize newsSliderScroll;
@synthesize carousel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor=[UIColor grayColor];
      
        carousel = [[iCarousel alloc]initWithFrame:CGRectMake(0, 20, 320, 160)];
        carousel.type = iCarouselTypeLinear;
         [self.contentView addSubview:carousel];
        // Initialization code
        
//        newsSliderScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(120, 8, 150, 160)];
//        newsSliderScroll.pagingEnabled = YES;
//        newsSliderScroll.bounces = NO;
//        newsSliderScroll.delegate = self;
//        newsSliderScroll.clipsToBounds=YES;
//        newsSliderScroll.showsHorizontalScrollIndicator = NO;
//        [self.contentView addSubview:newsSliderScroll];
    
        
        pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0,185, 320, 20)];
        [self.contentView addSubview:pageControl];
         
    }
    return self;
}

- (void)dealloc
{    
    [carousel release];
    [sliderArray release];
    [titleLabel release];
    [pageControl release];
    [super dealloc];
}

-(void)setSliderArray:(NSArray *)theArray{
    [_sliderArray release];
    _sliderArray = [theArray retain];
  //  NSLog(@"%d=%@",[_sliderArray count],_sliderArray);
//    CGFloat xOffset = 80;
//    for (NSInteger i=0; i<_sliderArray.count; i++) {
//        NSDictionary *sliderDic = [_sliderArray objectAtIndex:i];
//        UIImageView *sliderImageView = (UIImageView*)[self.contentView viewWithTag:kSliderImageTag+i];
//        if (sliderImageView==nil) {
//            sliderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(xOffset, 8,150, 160)];
//            sliderImageView.tag = kSliderImageTag+i;
//            [newsSliderScroll addSubview:sliderImageView];
//            [sliderImageView release];
//        }
//        sliderImageView.image = [UIImage imageNamed:[sliderDic objectForKey:@"image"]];
//        if (i==0) {
//            titleLabel.text = [sliderDic objectForKey:@"title"];
//        }
//        xOffset += 170;
//    }
//    newsSliderScroll.contentSize = CGSizeMake((150+20)*_sliderArray.count+20, 160);
    carousel.delegate = self;
    carousel.dataSource = self;
    [pageControl setNumberOfPages:self.sliderArray.count];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [_sliderArray count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
 
    NSDictionary *sliderDic = [_sliderArray objectAtIndex:index];
    UIView *view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:[sliderDic objectForKey:@"image"]]] autorelease];
    view.frame = CGRectMake(70,8,150,160);
    return view;
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	return 0;
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return [_sliderArray count];
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return ITEM_SPACING;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return NO;
}

- (void)carouselDidScroll:(iCarousel *)carousel{
    
     NSInteger currentIndex = self.carousel.currentItemIndex;
     [pageControl setCurrentPage:currentIndex];
}

@end
