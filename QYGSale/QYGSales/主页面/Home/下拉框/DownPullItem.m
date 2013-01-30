    //
//  DownPullItem.m
//  MySelf
//
//  Created by xia on 11-3-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DownPullItem.h"

@implementation DownPullItem

@synthesize delegate;

@synthesize buttonArray;
@synthesize goingDownTagFlag;
@synthesize itemArray;
@synthesize im;
@synthesize imgP;
@synthesize imgSize;
@synthesize yourSelectedObject;
@synthesize downPullScrollView;

-(id)initWithItem:(CGRect)frame contentOfDownPullItem:(NSMutableArray*)array itemBgImg:(UIImage*)img itemBgImg_High:(UIImage*)img_High imageSize:(CGSize)imageSize
{
    self.itemArray = array;
	self.im = img;
	self.imgP = img_High;
    imgSize = imageSize;
	return [self initWithFrame:frame];
}

-(id)initWithItem:(CGRect)frame contentOfDownPullItem:(NSMutableArray*)array itemBgImg:(UIImage*)img itemBgImg_High:(UIImage*)img_High
{
	self.itemArray = array;
	self.im = img;
	self.imgP = img_High;
	return [self initWithFrame:frame];
}

-(id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		goingDownTagFlag = 1;
// button 数组
		buttonArray = [[NSMutableArray alloc]initWithCapacity:2];
		for (int i=0;i<[itemArray count];i++) {
			UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
			[button setBackgroundImage:im forState:UIControlStateNormal];
			button.frame = CGRectMake(0, 0,imgSize.width,imgSize.height);
			[button setBackgroundImage:imgP forState:UIControlStateHighlighted];
            [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
			
//			NSString *itemStr = [itemArray objectAtIndex:i];
//			if ([[itemStr componentsSeparatedByString:@"****"] count]==2 && ([[[[itemStr componentsSeparatedByString:@":"] objectAtIndex:1] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 12)) 
//            {
//				NSArray *resultArr = [itemStr componentsSeparatedByString:@":"];
//				UILabel *firstLabel =
//				[self newLabelWithText:[NSString stringWithFormat:@"%@ ",[resultArr objectAtIndex:0]]
//								 frame:CGRectMake(10, 4, 70, 20)
//								  font:nil
//							 textColor:COLOR_3];
//				firstLabel.textAlignment = UITextAlignmentRight;
//				UILabel *secondLabel =
//				[self newLabelWithText:[NSString stringWithFormat:@": %@",[resultArr objectAtIndex:1]]
//								 frame:CGRectMake(80, 4, 180, 20)
//								  font:nil
//							 textColor:COLOR_3];
//				secondLabel.textAlignment = UITextAlignmentLeft;
//				[button addSubview:firstLabel];
//				[button addSubview:secondLabel];
//				
//				[button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
//			}
//            else 
            {
				[button setTitleColor:[UIColor colorWithRed:97./255 green:33./255 blue:4./255 alpha:1.] forState:UIControlStateNormal];
			}
			[button setTitle:[itemArray objectAtIndex:i] forState:UIControlStateNormal];
			
			//[button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
			button.tag = i+1;
			[button addTarget:self action:@selector(goingUPToMenu:) forControlEvents:UIControlEventTouchUpInside];
			[buttonArray insertObject:button atIndex:i];
		}
	}
	return self;
}


-(void)makeAction:(id)sender
{

	[self goingDownToMenu];
}

#pragma mark -
#pragma mark           点击信用卡的出现的下拉菜单(向下出卡)
/*
 用途:    点击按钮产生一个动态的下拉菜单，选择信用卡的其中的一个卡号（卡展出） 
 */

-(void)goingDownToMenu{
	
	if (goingDownTagFlag == 0) {
		[self goingUPToMenu:nil];
		goingDownTagFlag = 1;
	}else if (goingDownTagFlag == 1){
		
		//首先判断卡的长度动态的 scrollview 的contentsize 的 长度
		//if ([myCommuteAccountView.creditButtonArray count] >= 7) {
//			[myCommuteAccountView.myScrollView setContentSize:CGSizeMake(320, myCommuteAccountView.myScrollView.contentSize.height + ([myCommuteAccountView.creditButtonArray count] - 7) * 32)]; 
//		}
		
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.35];
		
		for (int i = 0; i < [buttonArray count]; i++) {
			UIButton *button = [buttonArray objectAtIndex:i];
			[self addSubview:button];
			button.frame = CGRectMake(button.frame.origin.x,  button.frame.origin.y + (imgSize.height-3) * i, button.frame.size.width, button.frame.size.height);
			
		}
		
		[UIView commitAnimations];
		
		goingDownTagFlag = 0;
		
	}
	
	
}

#pragma mark -
#pragma mark           点击信用卡的出现的下拉菜单(向上收卡)
/*
 用途:    点击按钮产生一个动态的下拉菜单，选择信用卡的其中的一个卡号（卡收回）
 */
-(void)goingUPToMenu:(id)sender{
	
	//使滚动面板的内容变回原来的的大小
	//if ([ count] >= 7) {
//		[buttonArraysetContentSize:CGSizeMake(320, myCommuteAccountView.myScrollView.contentSize.height - ([myCommuteAccountView.creditButtonArray count] - 7) * 32)];
//	}
//	
    //再次点中下拉菜单的按钮时候
	if (sender == nil) {
		//NSLog(@"乐购器");
		//点击下拉菜单中的选择的按钮	 
	}else {
	//	UIButton *button = (UIButton *)sender;
	//	UILabel *label = (UILabel *)([button viewWithTag:1]);
	//  myCommuteAccountView.currLabelCredit.text = label.text;
	}
	
	NSLog(@"ssssssssssssssssssssssssssssssssssssssssss%d",((UIButton*)sender).tag);

	yourSelectedObject = sender;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.35];
	
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(goingUPToMenuEnd)];
	
	for (int i = 0; i < [buttonArray count]; i++) {
		UIButton *button = [buttonArray objectAtIndex:i];
		[self addSubview:button];
		button.frame = CGRectMake(button.frame.origin.x,0, button.frame.size.width, button.frame.size.height);
		
	}
	
	[UIView commitAnimations];
	
	goingDownTagFlag = 1;
}


#pragma mark -
#pragma mark 隐藏下拉列表(无动画)

- (void)hideDownPullItemNoAnimation{
	yourSelectedObject = nil;
	for (int i = 0; i < [buttonArray count]; i++) {
		UIButton *button = [buttonArray objectAtIndex:i];
		[self addSubview:button];
		button.frame = CGRectMake(button.frame.origin.x,0, button.frame.size.width, button.frame.size.height);
		
	}
	goingDownTagFlag = 1;
	for (int i = 0; i < [buttonArray count]; i++) {
		UIButton *button = [buttonArray objectAtIndex:i];
	    [button removeFromSuperview];
	}
	[self removeFromSuperview];
}

#pragma mark -
#pragma mark           点击信用卡的出现的下拉菜单结束的操作
/*
 用途:    点击按钮产生一个动态的下拉菜单，选择信用卡的其中的一个卡号（收卡结束） 
 */
-(void)goingUPToMenuEnd{
	for (int i = 0; i < [buttonArray count]; i++) {
		UIButton *button = [buttonArray objectAtIndex:i];
	    [button removeFromSuperview];
	}
	[self removeFromSuperview];
	if ([delegate respondsToSelector:@selector(clickWhichRowDoSth:)]) {
		[delegate performSelector:@selector(clickWhichRowDoSth:) withObject:yourSelectedObject];
	}
	if ([delegate respondsToSelector:@selector(downPullItem:withSelectedButton:)]) {
		[delegate downPullItem:self withSelectedButton:yourSelectedObject];
	}
}
- (void)dealloc {
	
	[buttonArray release];
	[itemArray release];
	[im release];
	[imgP release];
	[downPullScrollView release];
    [super dealloc];
}


@end
