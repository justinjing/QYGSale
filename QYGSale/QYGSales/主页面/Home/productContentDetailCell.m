//
//  productContentDetailCell.m
//  QYGSales
//
//  Created by da zhan on 12-12-13.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "productContentDetailCell.h"
#import <QuartzCore/QuartzCore.h>


@implementation productContentDetailCell
@synthesize newsDic = _newsDic;
 

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
        bgView.image = [UIImage imageNamed:@"token_tab_middle_bg_normal"];
        self.backgroundView = bgView;
        [bgView release];
        UIImageView *selectedBgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
        selectedBgView.image = [UIImage imageNamed:@"token_tab_middle_bg_select"];
        self.selectedBackgroundView = selectedBgView;
        [selectedBgView release];
        
        // Initialization code
        newsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 80, 50)];
        [self.contentView addSubview:newsImageView];
        newsImageView.layer.shadowColor = [UIColor blackColor].CGColor;
        newsImageView.layer.shadowOpacity = 0.7f;
        
        CGSize size = newsImageView.bounds.size;
        CGFloat curlFactor = 2.f;
        CGFloat shadowDepth = 5.0f;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0.0f, 0.0f)];
        [path addLineToPoint:CGPointMake(size.width, 0.0f)];
        [path addLineToPoint:CGPointMake(size.width, size.height + shadowDepth)];
        [path addCurveToPoint:CGPointMake(0.0f, size.height + shadowDepth)
                controlPoint1:CGPointMake(size.width - curlFactor, size.height + shadowDepth - curlFactor)
                controlPoint2:CGPointMake(curlFactor, size.height + shadowDepth - curlFactor)];
        newsImageView.layer.shadowPath = path.CGPath;
        
        titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(95, 10, 200, 20)];
        titleLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:titleLabel];
        
        descLabel = [[UILabel alloc]initWithFrame:CGRectMake(95, 30, 200, 35)];
        descLabel.numberOfLines = 2;
        descLabel.textColor = [UIColor lightGrayColor];
        descLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:descLabel];
    }
    return self;
}

- (void)dealloc
{
    [newsImageView release];
    [titleLabel release];
    [descLabel release];
    [super dealloc];
}

-(void)setNewsDic:(NSDictionary *)theDic{
    [_newsDic release];
    _newsDic = [theDic retain];
    newsImageView.image = [UIImage imageNamed:[_newsDic objectForKey:@"image"]];
    titleLabel.text = [_newsDic objectForKey:@"title"];
    descLabel.text = [_newsDic objectForKey:@"desc"];
}
@end
