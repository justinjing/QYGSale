//
//  productDetailSpecViewController.m
//  QYGSales
//
//  Created by da zhan on 12-12-18.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "productDetailSpecViewController.h"

#define cellXOffset 10
#define cellProductLabelWidth 70
#define cellProductLabelHeight 30

#define cellDetailProductXOffset    120
#define cellDetailProductLabelWidth 160

#define cellProductLabelFont 16
#define sectionTwoLabelWidth 280

@interface productDetailSpecViewController ()

@end

@implementation productDetailSpecViewController

-(void)loadView{
    
    UIView *container = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 422)];
    self.view = container;
    [container release];
    
   // DataTable = [[UITableView alloc]initWithFrame:self.view.bounds];
    DataTable=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    DataTable.delegate = self;
    DataTable.dataSource = self;
    [self.view addSubview:DataTable];
    normalTitleArray=[[NSArray alloc]initWithObjects:@"所有",@"电源X1,接口X4",@"你可能已经知道，当你在使用UITableView的时候，你必须要设置一个data source 和一个delegate来分别提供data用于显示和提供方法用于操控。（比如选中row后）类似地，当你使用一个UICollectionView的时候你也必须设置一个data source和一个delegate。它们的详细说明如下：The data source (UICollectionViewDataSource) 返回他们在collection view里的元素数量信息以及他们各自view的信息。The delegate (UICollectionViewDelegate)当某些操作发生时比如选中cell，高亮cell，或者删除cell时会被调用到。但是当添加新的UICollectionView的时候，你必须执行第三个协议 – 这个协议是用来定制layout manager的。在这片教程里你将会用到预设的UICollectionViewFlowLayout 的layout manager，所以你必须执行UICollectionViewDelegateFlowlayout协议。它将帮你调整布局行为，控制cell之间的间距，滚动的方向等等。",nil];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma make-
#pragma make Uitableviewdelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numberOfRows;
    if (section==0) {
       numberOfRows = 1;
    }
    else if (section==1){
         
        numberOfRows = 1;
    }
    else {
        numberOfRows = 1;
    }
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //CGFloat rowHeight;
    //    if (indexPath.section==0) {
    //        rowHeight = 135;
    //    }else if (indexPath.section==1) {
    //        rowHeight = 40;
    //    }else{
    //
    //     rowHeight = 70;
    //    }
    //    return rowHeight;
       //  CGSize size = [today sizeWithFont:[UIFont systemFontOfSize:24.0] constrainedToSize:CGSizeMake(200, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
	return cell.frame.size.height;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  switch (section)
	{
	  case 0:
		 return   @"商品参数";    break;
	  case 1:
		 return   @"包装清单";	 break;
	  case 2:
		  return  @"售后服务";	 break;
	  default:
		  return @"";   break;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.section==0) {
        UITableViewCell *sliderCell = [DataTable dequeueReusableCellWithIdentifier:@"sliderCell"];
        if (sliderCell==nil) {
            sliderCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:@"sliderCell"]autorelease];
    
    
        }
        
        CGRect cellFrame = [sliderCell frame];
		cellFrame.origin = CGPointMake(0,0);
        UILabel *productLabel1=(UILabel *)[sliderCell.contentView viewWithTag:11111];
        if (!productLabel1) {
            productLabel1=[[UILabel alloc]initWithFrame:CGRectMake(cellXOffset,6,cellProductLabelWidth,cellProductLabelHeight)];
            productLabel1.backgroundColor=[UIColor clearColor];
            productLabel1.tag=11111;
            productLabel1.text=@"配件类型:";
            productLabel1.font= [UIFont systemFontOfSize:cellProductLabelFont];
            //productNameLabel.textAlignment=NSTextAlignmentCenter;
            [sliderCell.contentView addSubview:productLabel1];
            [productLabel1 release];
        }
        
        UILabel *productLabel11=(UILabel *)[sliderCell.contentView viewWithTag:111112];
        if (!productLabel11) {
            productLabel11=[[UILabel alloc]initWithFrame:CGRectMake(cellDetailProductXOffset,6,cellDetailProductLabelWidth,cellProductLabelHeight)];
            productLabel11.backgroundColor=[UIColor clearColor];
            productLabel11.tag=111112;
            productLabel11.text=@"移动电源";
            productLabel11.textColor=[UIColor blueColor];
            productLabel11.font= [UIFont systemFontOfSize:cellProductLabelFont];
            //productNameLabel.textAlignment=NSTextAlignmentCenter;
            [sliderCell.contentView addSubview:productLabel11];
            [productLabel11 release];
        }
        
        UILabel *productLabel2=(UILabel *)[sliderCell.contentView viewWithTag:11112];
        if (!productLabel2) {
            productLabel2=[[UILabel alloc]initWithFrame:CGRectMake(cellXOffset,productLabel1.frame.origin.y+productLabel1.frame.size.height, cellProductLabelWidth,cellProductLabelHeight)];
            productLabel2.backgroundColor=[UIColor clearColor];
            productLabel2.tag=11112;
            productLabel2.text=@"适用型号:";
            productLabel2.font= [UIFont systemFontOfSize:cellProductLabelFont];
           // productLabel2.textAlignment=NSTextAlignmentCenter;
            [sliderCell.contentView addSubview:productLabel2];
            [productLabel2 release];
        }
        
        UILabel *productLabel21=(UILabel *)[sliderCell.contentView viewWithTag:111122];
        if (!productLabel21) {
            productLabel21=[[UILabel alloc]initWithFrame:CGRectMake(cellDetailProductXOffset,productLabel1.frame.origin.y+productLabel1.frame.size.height,cellDetailProductLabelWidth,cellProductLabelHeight)];
            productLabel21.backgroundColor=[UIColor clearColor];
            productLabel21.tag=111122;
            productLabel21.text=@"适用手机、平板电脑、数码相机等充电设备";
            productLabel21.lineBreakMode=UILineBreakModeWordWrap;
            productLabel21.numberOfLines=0;
            productLabel21.textColor=[UIColor blueColor];
            productLabel21.font= [UIFont systemFontOfSize:cellProductLabelFont];
            //productNameLabel.textAlignment=NSTextAlignmentCenter;
            CGSize size = [productLabel21.text sizeWithFont:[UIFont systemFontOfSize:cellProductLabelFont] constrainedToSize:CGSizeMake(cellDetailProductLabelWidth, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
            productLabel21.frame=CGRectMake(cellDetailProductXOffset,productLabel1.frame.origin.y+productLabel1.frame.size.height,cellDetailProductLabelWidth,size.height);
            [sliderCell.contentView addSubview:productLabel21];
            [productLabel21 release];
        }
        
        UILabel *productLabel3=(UILabel *)[sliderCell.contentView viewWithTag:11113];
        if (!productLabel3) {
            productLabel3=[[UILabel alloc]initWithFrame:CGRectMake(cellXOffset,productLabel21.frame.origin.y+productLabel21.frame.size.height,cellProductLabelWidth,cellProductLabelHeight)];
            //productNickNameLabel.backgroundColor=[UIColor yellowColor];
            productLabel3.tag=11113;
            productLabel3.text=@"电池容量:";
            productLabel3.backgroundColor=[UIColor clearColor];
            productLabel3.font= [UIFont systemFontOfSize:cellProductLabelFont];
            [sliderCell.contentView addSubview:productLabel3];
            [productLabel3 release];
            
        }
        
        UILabel *productLabel31=(UILabel *)[sliderCell.contentView viewWithTag:111132];
        if (!productLabel31) {
            productLabel31=[[UILabel alloc]initWithFrame:CGRectMake(cellDetailProductXOffset,productLabel21.frame.origin.y+productLabel21.frame.size.height,cellDetailProductLabelWidth,cellProductLabelHeight)];
            productLabel31.backgroundColor=[UIColor clearColor];
            productLabel31.tag=111132;
            productLabel31.text=@"7000毫安";
            productLabel31.textColor=[UIColor blueColor];
            productLabel31.font= [UIFont systemFontOfSize:cellProductLabelFont];
            //productNameLabel.textAlignment=NSTextAlignmentCenter;
            [sliderCell.contentView addSubview:productLabel31];
            [productLabel31 release];
        }
        
        UILabel *productLabel4=(UILabel *)[sliderCell.contentView viewWithTag:11114];
        if (!productLabel4) {
            productLabel4=[[UILabel alloc]initWithFrame:CGRectMake(cellXOffset,productLabel3.frame.origin.y+productLabel3.frame.size.height,cellProductLabelWidth,cellProductLabelHeight)];
            productLabel4.backgroundColor=[UIColor clearColor];
            productLabel4.tag=11114;
            productLabel4.text=@"输入电压:";
            //productLabel4.textAlignment=NSTextAlignmentCenter;
            productLabel4.font= [UIFont systemFontOfSize:cellProductLabelFont];
            [sliderCell.contentView addSubview:productLabel4];
            [productLabel4 release];
        }
        
        UILabel *productLabel41=(UILabel *)[sliderCell.contentView viewWithTag:111142];
        if (!productLabel41) {
            productLabel41=[[UILabel alloc]initWithFrame:CGRectMake(cellDetailProductXOffset,productLabel3.frame.origin.y+productLabel3.frame.size.height,cellDetailProductLabelWidth,cellProductLabelHeight)];
            productLabel41.backgroundColor=[UIColor clearColor];
            productLabel41.tag=111142;
            productLabel41.text=@"DC3.7V";
            productLabel41.textColor=[UIColor blueColor];
            productLabel41.font= [UIFont systemFontOfSize:cellProductLabelFont];
            //productNameLabel.textAlignment=NSTextAlignmentCenter;
            [sliderCell.contentView addSubview:productLabel41];
            [productLabel41 release];
        }
        
        
        cell = sliderCell;
        cellFrame.size.height = productLabel41.frame.origin.y+productLabel41.frame.size.height +2;
        [cell setFrame: cellFrame];
        
    }
//    else if (indexPath.section==1) {
// 
//    
//        UITableViewCell *newsCell = [DataTable dequeueReusableCellWithIdentifier:@"newsCell1"];
//        if (newsCell==nil) {
//            newsCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
//                                              reuseIdentifier:@"newsCell1"]autorelease];
//        }
//        CGRect cellFrame = [newsCell frame];
//		cellFrame.origin = CGPointMake(0,0);
//        
//        UILabel *productLabel31=(UILabel *)[newsCell.contentView viewWithTag:111143];
//        if (!productLabel31) {
//            productLabel31=[[UILabel alloc]initWithFrame:CGRectMake(cellXOffset,6,sectionTwoLabelWidth,10)];
//            productLabel31.backgroundColor=[UIColor clearColor];
//            productLabel31.tag=111143;
//            productLabel31.numberOfLines=0;
//            productLabel31.lineBreakMode=UILineBreakModeWordWrap;
//            productLabel31.text=[normalTitleArray objectAtIndex:indexPath.section];
//            productLabel31.font= [UIFont systemFontOfSize:cellProductLabelFont];
//            
//            CGSize size = [productLabel31.text sizeWithFont:[UIFont systemFontOfSize:cellProductLabelFont] constrainedToSize:CGSizeMake(sectionTwoLabelWidth, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
//            
//            productLabel31.frame=CGRectMake(cellXOffset,6,sectionTwoLabelWidth,size.height);
//            [newsCell.contentView addSubview:productLabel31];
//            [productLabel31 release];
//        }
//        cell = newsCell;
//        cellFrame.size.height = productLabel31.frame.origin.y+productLabel31.frame.size.height +2;
//        [cell setFrame: cellFrame];
//        
//    }
    else {
        UITableViewCell *newsCell = [DataTable dequeueReusableCellWithIdentifier:@"newsCell1"];
        if (newsCell==nil) {
            newsCell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                              reuseIdentifier:@"newsCell1"]autorelease];
        }
        CGRect cellFrame = [newsCell frame];
		cellFrame.origin = CGPointMake(0,0);
        
        UILabel *productLabel31=(UILabel *)[newsCell.contentView viewWithTag:111143];
        if (!productLabel31) {
            productLabel31=[[UILabel alloc]initWithFrame:CGRectMake(cellXOffset,6,sectionTwoLabelWidth,10)];
            productLabel31.backgroundColor=[UIColor clearColor];
            productLabel31.tag=111143;
            productLabel31.numberOfLines=0;
            productLabel31.lineBreakMode=UILineBreakModeWordWrap;
             productLabel31.text=[normalTitleArray objectAtIndex:indexPath.section];
            productLabel31.font= [UIFont systemFontOfSize:cellProductLabelFont];
            
            CGSize size = [productLabel31.text sizeWithFont:[UIFont systemFontOfSize:cellProductLabelFont] constrainedToSize:CGSizeMake(sectionTwoLabelWidth, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
            
            productLabel31.frame=CGRectMake(cellXOffset,6,sectionTwoLabelWidth,size.height);
            [newsCell.contentView addSubview:productLabel31];
            [productLabel31 release];
        }
 
        cell = newsCell;
        cellFrame.size.height = productLabel31.frame.origin.y+productLabel31.frame.size.height +2;
        [cell setFrame: cellFrame];
    
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
}

 

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"asfdas");
//    FullImageController *fullController = [[FullImageController alloc]init];
//    [ViewController share].button.hidden=YES;
//    fullController.hidesBottomBarWhenPushed = YES;
//    fullController.navigationItem.title = @"sad";
//    [self.navigationController pushViewController:fullController animated:YES];
//    [fullController release];
    
}


@end
