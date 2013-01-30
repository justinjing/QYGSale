//
//  FullImageController.m
//  WangyiNewsDemo
//
//  Created by 俞 億 on 12-4-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FullImageController.h"
#import "productContentDetailCell.h"
#import "productContentDetailSliderCell.h"
#import "productDetailSpecViewController.h"
#import "ViewController.h"
#import "AWActionSheet.h"



#define kColorPullDownBoxTag      000011
#define kCapabilityPullDownBoxTag 000012

@interface FullImageController ()<UIActionSheetDelegate,AWActionSheetDelegate>{


    DownPullItem  *downPullItem;
    UIButton *colorPullDownButton;
    UIButton *capabilityPullButton;
}

@end

@implementation FullImageController
@synthesize image = _image;

- (void)dealloc
{
    [scrollView release];
    [imageView release];
    [_image release];
    [super dealloc];
}

-(void)loadView{
    
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] applicationFrame].size.width, [[UIScreen mainScreen] applicationFrame].size.height-38)];
    self.view = container;
    [container release];
    
    DataTable = [[UITableView alloc]initWithFrame:self.view.bounds];
    DataTable.delegate = self;
    DataTable.dataSource = self;
    [self.view addSubview:DataTable];
    
     
    
    UIButton *decreaseButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    decreaseButton.frame=CGRectMake(10,14,64,40);
 
    [decreaseButton setBackgroundImage:[UIImage imageNamed:@"but_share_normal.png"] forState:UIControlStateNormal];
    [decreaseButton setBackgroundImage:[UIImage imageNamed:@"but_share_press.png"] forState:UIControlStateHighlighted];
    [decreaseButton addTarget:self action:@selector(showShreView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *setUrl = [[UIBarButtonItem alloc] initWithCustomView:decreaseButton];
    self.navigationItem.rightBarButtonItem = setUrl;
    [setUrl release];
    
     colorPullDownArray = [[NSMutableArray alloc] initWithObjects:@"黑色", @"白色", @"红色",@"蓝色",nil];
     capabilityPullDownArray = [[NSMutableArray alloc] initWithObjects:@"2500毫安", @"3000毫安", @"6600毫安", @"10000毫安",nil];
    //@"Four", @"Five", @"Six", @"Seven",
    isPullDown = YES;
}

-(void)viewDidLoad{
    [super viewDidLoad];
//    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
//    self.view = container;
//    [container release];
//    
//    scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
//    scrollView.delegate = self;
//    scrollView.maximumZoomScale = 1.5;
//    [self.view addSubview:scrollView];
//    scrollView.contentSize = self.view.bounds.size;
//    
//    imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [scrollView addSubview:imageView];
//
//    imageView.image = _image;
 
    NSString *contentPath = [[NSBundle mainBundle]pathForResource:@"NewsRoot" ofType:@"plist"];
    contentDic = [[NSDictionary alloc]initWithContentsOfFile:contentPath];
    arr = [[NSArray alloc] initWithObjects:@"黑色", @"白色", @"红色", @"蓝色", nil];
    maarr= [[NSArray alloc] initWithObjects:@"2500毫安", @"3000毫安", @"6600毫安", @"10000毫安", nil];
    totalNumber=1;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView;
}




#pragma make-
#pragma make Uitableviewdelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  //  NSLog(@"confsdaf==%d",contentDic.count);
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberOfRows;
    if (section==0) {
        numberOfRows = 1;
    }else if (section==1) {
        //NSArray *newsList = [contentDic objectForKey:@"NewsList"];
        //numberOfRows = newsList.count;
           numberOfRows = 1;
    }else{
    numberOfRows = 1;
    }
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight;
    if (indexPath.section==0) {
        rowHeight = 210;
    }
    else if(indexPath.section==1) {
        rowHeight = 72;
    }
    else if(indexPath.section==2) {
        rowHeight = 60;
    }else if(indexPath.section==4) {
        rowHeight = 110;
    }else   {
        rowHeight = 70;
    }
    return rowHeight;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    
    if (indexPath.section==0) {
        productContentDetailSliderCell *sliderCell = [DataTable dequeueReusableCellWithIdentifier:@"sliderCell"];
        if (sliderCell==nil) {
            sliderCell = [[[productContentDetailSliderCell alloc]initWithStyle:UITableViewCellStyleDefault
                                                               reuseIdentifier:@"sliderCell"]autorelease];
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(scrollViewTap:)];
            [sliderCell.newsSliderScroll addGestureRecognizer:tapGesture];
            [tapGesture release];
        }
        sliderCell.sliderArray = [contentDic objectForKey:@"Slider"];
        cell = sliderCell;
    }
  else if (indexPath.section==1) {
        UITableViewCell *newsCell = [DataTable dequeueReusableCellWithIdentifier:@"newsCell"];
        if (newsCell==nil) {
            newsCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                           reuseIdentifier:@"newsCell"]autorelease];  
            
        }
        
      UILabel *productNameLabel=(UILabel *)[newsCell.contentView viewWithTag:11111];
      if (!productNameLabel) {
          productNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(4, 0, 300, 40)];
          //productNameLabel.backgroundColor=[UIColor redColor];
          productNameLabel.tag=11111;
          productNameLabel.text=@"啊睡觉对方把加快阿飞达到";
          productNameLabel.font= [UIFont systemFontOfSize:20];
          //productNameLabel.textAlignment=NSTextAlignmentCenter;
          [newsCell.contentView addSubview:productNameLabel];
          [productNameLabel release];
      }
      
      UILabel *nickNameLabel=(UILabel *)[newsCell.contentView viewWithTag:11112];
      if (!nickNameLabel) {
          nickNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(4, 36, 44,30)];
          //nickNameLabel.backgroundColor=[UIColor yellowColor];
          nickNameLabel.tag=11112;
          nickNameLabel.text=@"品牌:";
          nickNameLabel.textColor=[UIColor grayColor];
          nickNameLabel.textAlignment=NSTextAlignmentCenter;
          [newsCell.contentView addSubview:nickNameLabel];
           [nickNameLabel release];
      }
      
      UILabel *productNickNameLabel=(UILabel *)[newsCell.contentView viewWithTag:11113];
      if (!productNickNameLabel) {
          productNickNameLabel=[[UILabel alloc]initWithFrame:CGRectMake(44, 36,100,30)];
          //productNickNameLabel.backgroundColor=[UIColor yellowColor];
          productNickNameLabel.tag=11113;
          productNickNameLabel.text=@"QYG-FC8";
          productNickNameLabel.textColor=[UIColor grayColor];
          productNickNameLabel.textAlignment=NSTextAlignmentCenter;
          [newsCell.contentView addSubview:productNickNameLabel];
          [productNickNameLabel release];
      }
      
      UILabel *priceLabel=(UILabel *)[newsCell.contentView viewWithTag:11114];
      if (!priceLabel) {
          priceLabel=[[UILabel alloc]initWithFrame:CGRectMake(150, 36,40,30)];
          //priceLabel.backgroundColor=[UIColor greenColor];
          priceLabel.tag=11114;
          priceLabel.text=@"价格:";
          priceLabel.textColor=[UIColor grayColor];
          priceLabel.textAlignment=NSTextAlignmentCenter;
          [newsCell.contentView addSubview:priceLabel];
          [priceLabel release];
      }
      
      UILabel *productPriceLabel=(UILabel *)[newsCell.contentView viewWithTag:11115];
      if (!productPriceLabel) {
          productPriceLabel=[[UILabel alloc]initWithFrame:CGRectMake(190, 36, 60,30)];
          productPriceLabel.tag=11115;
          productPriceLabel.text=@"¥566.0";
          productPriceLabel.textColor=[UIColor colorWithRed:1.0 green:0.08 blue:0.57 alpha:1.0];
          productPriceLabel.textAlignment=NSTextAlignmentCenter;
          [newsCell.contentView addSubview:productPriceLabel];
          [productPriceLabel release];

      }
//        NSArray *newsList = [contentDic objectForKey:@"NewsList"];
//        NSDictionary *newsDic = [newsList objectAtIndex:indexPath.row];
      
        cell = newsCell;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    else  if(indexPath.section==2) {
       UITableViewCell *newsCell= [DataTable dequeueReusableCellWithIdentifier:@"newsCell"];
        if (newsCell==nil) {
            newsCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                              reuseIdentifier:@"newsCell"]autorelease];
            
        }
        
        UILabel *colorLabel=(UILabel *)[newsCell.contentView viewWithTag:22221];
        if (!colorLabel) {
            colorLabel=[[UILabel alloc]initWithFrame:CGRectMake(4, 14, 40, 30)];
            //productNameLabel.backgroundColor=[UIColor redColor];
            colorLabel.tag=22221;
            colorLabel.text=@"颜色:";
            colorLabel.textColor=[UIColor grayColor];
            //colorLabel.font= [UIFont systemFontOfSize:18];
            //productNameLabel.textAlignment=NSTextAlignmentCenter;
            [newsCell.contentView addSubview:colorLabel];
            [colorLabel release];
        }
        
        
        colorPullDownButton  =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        colorPullDownButton.frame=CGRectMake(48,14,90,31);
        [colorPullDownButton setTitle:@"白色" forState:UIControlStateNormal];
        [colorPullDownButton setBackgroundImage:[UIImage imageNamed:@"cluster.png"] forState:UIControlStateNormal];
        [colorPullDownButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [colorPullDownButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [colorPullDownButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        colorPullDownButton.tag=222211;
        [colorPullDownButton addTarget:self action:@selector(pushDownButton:) forControlEvents:UIControlEventTouchUpInside];
        [newsCell.contentView addSubview:colorPullDownButton];
         
        
        UILabel *capabilityLabel=(UILabel *)[newsCell.contentView viewWithTag:22222];
        if (!capabilityLabel) {
            capabilityLabel=[[UILabel alloc]initWithFrame:CGRectMake(150, 14, 40,30)];
            //nickNameLabel.backgroundColor=[UIColor yellowColor];
            capabilityLabel.tag=22222;
            capabilityLabel.text=@"容量:";
            //capabilityLabel.font= [UIFont systemFontOfSize:18];
            capabilityLabel.textColor=[UIColor grayColor];
            capabilityLabel.textAlignment=NSTextAlignmentCenter;
            [newsCell.contentView addSubview:capabilityLabel];
            [capabilityLabel release];
        }
        
        capabilityPullButton  =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        capabilityPullButton.frame=CGRectMake(200,14,100,31);
        [capabilityPullButton setTitle:@"5500毫安" forState:UIControlStateNormal];
        [capabilityPullButton setBackgroundImage:[UIImage imageNamed:@"cluster.png"] forState:UIControlStateNormal];
        [capabilityPullButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [capabilityPullButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [capabilityPullButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        capabilityPullButton.tag=222212;
        [capabilityPullButton addTarget:self action:@selector(pushDownButton:) forControlEvents:UIControlEventTouchUpInside];
        [newsCell.contentView addSubview:capabilityPullButton];
 
        cell = newsCell;
    }
    else  if(indexPath.section==3) {
        UITableViewCell *newsCell= [DataTable dequeueReusableCellWithIdentifier:@"newsCell"];
        if (newsCell==nil) {
            newsCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                              reuseIdentifier:@"newsCell"]autorelease];
            
        }
        
        UILabel *colorLabel=(UILabel *)[newsCell.contentView viewWithTag:33331];
        if (!colorLabel) {
            colorLabel=[[UILabel alloc]initWithFrame:CGRectMake(4, 14, 40, 30)];
            //productNameLabel.backgroundColor=[UIColor redColor];
            colorLabel.tag=33331;
            colorLabel.text=@"数量:";
            colorLabel.textColor=[UIColor grayColor];
            //colorLabel.font= [UIFont systemFontOfSize:18];
            //productNameLabel.textAlignment=NSTextAlignmentCenter;
            [newsCell.contentView addSubview:colorLabel];
            [colorLabel release];
        }
        
        
        UIButton *decreaseButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        decreaseButton.frame=CGRectMake(60, 14,30, 30);
        [decreaseButton setTitle:@"一" forState:UIControlStateNormal];
        [decreaseButton setTitle:@"一" forState:UIControlStateHighlighted];
        decreaseButton.tag=333311;
        [decreaseButton addTarget:self action:@selector(PressButton:) forControlEvents:UIControlEventTouchUpInside];
        [newsCell addSubview:decreaseButton];
        
        UIButton *plusButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        plusButton.frame=CGRectMake(150, 14, 30, 30);
        plusButton.tag=333312;
        [plusButton setTitle:@"+" forState:UIControlStateNormal];
        [plusButton setTitle:@"+" forState:UIControlStateHighlighted];
        [plusButton addTarget:self action:@selector(PressButton:) forControlEvents:UIControlEventTouchUpInside];
        [newsCell addSubview:plusButton];
        
         totalNumberTextField=(UITextField *)[newsCell.contentView viewWithTag:33332];
        if (!totalNumberTextField) {
            totalNumberTextField=[[UITextField alloc]initWithFrame:CGRectMake(100, 14, 40,30)];
            //nickNameLabel.backgroundColor=[UIColor yellowColor];
            totalNumberTextField.tag=33332;
            totalNumberTextField.text=[NSString stringWithFormat:@"%d",totalNumber];
            //capabilityLabel.font= [UIFont systemFontOfSize:18];
            totalNumberTextField.textColor=[UIColor colorWithRed:1.0 green:0.08 blue:0.57 alpha:1.0];
            totalNumberTextField.textAlignment=NSTextAlignmentCenter;
            totalNumberTextField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
            totalNumberTextField.enabled=NO;
            
            totalNumberTextField.layer.borderColor=[[UIColor lightGrayColor] CGColor];
            totalNumberTextField.layer.borderWidth= 1.0f;
            totalNumberTextField.layer.cornerRadius=6;
            [newsCell.contentView addSubview:totalNumberTextField];
        }
        
        cell = newsCell;
    }else  if(indexPath.section==4) {
        UITableViewCell *newsCell= [DataTable dequeueReusableCellWithIdentifier:@"newsCell4"];
        if (newsCell==nil) {
            newsCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                              reuseIdentifier:@"newsCell4"]autorelease];
            
        }
        
  
        UIButton *decreaseButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        decreaseButton.frame=CGRectMake(60, 8,200, 38);
        [decreaseButton setBackgroundImage:[UIImage imageNamed:@"pic46.png"] forState:UIControlStateNormal];
        [decreaseButton setBackgroundImage:[UIImage imageNamed:@"pic46.png"] forState:UIControlStateHighlighted];
        [decreaseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [decreaseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [decreaseButton setTitle:@"立即购买" forState:UIControlStateNormal];
        [decreaseButton setTitle:@"立即购买" forState:UIControlStateHighlighted];
        [newsCell addSubview:decreaseButton];
        
        UIButton *plusButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        plusButton.frame=CGRectMake(60, 56, 200, 38);
        [plusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [plusButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"pic46.png"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"pic46.png"] forState:UIControlStateHighlighted];
        [plusButton setTitle:@"加入购物袋" forState:UIControlStateNormal];
        [plusButton setTitle:@"加入购物袋" forState:UIControlStateHighlighted];
        [newsCell addSubview:plusButton];
        
        
        UIImageView *gouwudai= [[UIImageView alloc]initWithFrame:CGRectMake(146,4,21,26)];
        gouwudai.image=[UIImage imageNamed:@"pic83.png"];
        [plusButton addSubview:gouwudai];
        [gouwudai release];
        
        UIImageView *lijigoumai= [[UIImageView alloc]initWithFrame:CGRectMake(146,4,21,26)];
        lijigoumai.image=[UIImage imageNamed:@"plane_right_arrow_h.png"];
        [decreaseButton addSubview:lijigoumai];
        [lijigoumai release];
  
        
        cell = newsCell;
    }

    else {
        UITableViewCell *newsCell= [DataTable dequeueReusableCellWithIdentifier:@"newsCell"];
        if (newsCell==nil) {
            newsCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                              reuseIdentifier:@"newsCell"]autorelease];
            
        }
          cell = newsCell;
        
    }


    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)showShreView {
    AWActionSheet *sheet = [[AWActionSheet alloc] initwithIconSheetDelegate:self ItemCount:[self numberOfItemsInActionSheet]];
    [sheet showInView:self.view];
    //[sheet release];
}


-(void)PressButton:(UIButton*)sender{
    NSUInteger tag = sender.tag;
    
    if (tag==333311) {
        
        if (totalNumber==1) {
            return ;
        }
        
        totalNumber--;
         
    }else if(tag==333312){
    
        totalNumber++;
    }
    totalNumberTextField.text=[NSString stringWithFormat:@"%d",totalNumber];
  
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==1) {
 
        productDetailSpecViewController *fullController = [[productDetailSpecViewController alloc]init];
        [ViewController share].button.hidden=YES;
        fullController.hidesBottomBarWhenPushed = YES;
        fullController.navigationItem.title = @"sad";
        [self.navigationController pushViewController:fullController animated:YES];
        [fullController release];
    }
    
}

-(void)didChangeComboBoxValue:(AJComboBox *)comboBox selectedIndex:(NSInteger)selectedIndex
{
//	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"Selected Value: %@", [arr objectAtIndex:selectedIndex]] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//    [alert show];
//    [alert release];
}

-(int)numberOfItemsInActionSheet
{
    return 6;
}

-(AWActionSheetCell *)cellForActionAtIndex:(NSInteger)index
{
    AWActionSheetCell* cell = [[[AWActionSheetCell alloc] init] autorelease];
    
    [[cell iconView] setBackgroundColor:
     [UIColor colorWithRed:rand()%255/255.0f
                     green:rand()%255/255.0f
                      blue:rand()%255/255.0f
                     alpha:1]];
    [[cell titleLabel] setText:[NSString stringWithFormat:@"item %d",index]];
    cell.index = index;
    return cell;
}

-(void)DidTapOnItemAtIndex:(NSInteger)index
{
    NSLog(@"tap on %d",index);
}



-(void)pushDownButton:(UIButton *)sender{
    UIImage *img = [UIImage imageNamed:@"pic244.png"];
    UIImage *imgP = [UIImage imageNamed:@"pic244.png"];
    if(downPullItem == nil)
    {
        
        if (sender.tag==222211) {
            downPullItem = [[DownPullItem alloc]initWithItem:CGRectMake(48,326,70,32*[colorPullDownArray count])
                                       contentOfDownPullItem:colorPullDownArray
                                                   itemBgImg:img
                                              itemBgImg_High:imgP
                                                   imageSize:CGSizeMake(90,32)];
            downPullItem.tag=kColorPullDownBoxTag;
            
        }else if (sender.tag==222212){
            
            downPullItem = [[DownPullItem alloc]initWithItem:CGRectMake(200,326,70,32*[capabilityPullDownArray count])
                                       contentOfDownPullItem:capabilityPullDownArray
                                                   itemBgImg:img
                                              itemBgImg_High:imgP
                                                   imageSize:CGSizeMake(100,32)];
            downPullItem.tag=kCapabilityPullDownBoxTag;
        }
        
        
        
        downPullItem.delegate = self;
        
    }
    if(isPullDown)
    {
        [DataTable addSubview:downPullItem];
        [downPullItem makeAction:nil];
        isPullDown = !isPullDown;
    }
    else
    {
        
        [downPullItem goingUPToMenu:nil];
        isPullDown = !isPullDown;
        [downPullItem removeFromSuperview];
        [downPullItem release];
        downPullItem = nil;
    }
    
}
#pragma mark
#pragma mark 下拉代理
// 下拉框代理
-(void)clickWhichRowDoSth:(id)sender
{
	NSInteger index = ((UIButton*)sender).tag;
    int arrayCount = [colorPullDownArray count];
    if(index >0 && index <=arrayCount)
    {
        isPullDown = !isPullDown;
        if([colorPullDownArray count]>0)
        {
            if (downPullItem.tag==kColorPullDownBoxTag)
            {
               [colorPullDownButton setTitle:[colorPullDownArray objectAtIndex:index-1] forState:UIControlStateNormal];
            }
            else if(downPullItem.tag==kCapabilityPullDownBoxTag)
            {
               [capabilityPullButton setTitle:[capabilityPullDownArray objectAtIndex:index-1] forState:UIControlStateNormal];
            
            }
            
        }
        if(downPullItem)
        {
            [downPullItem removeFromSuperview];
            [downPullItem release];
            downPullItem = nil;
        }
        
    }
	
}

@end
