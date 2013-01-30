
//  Created by 王冠晓 on 11-3-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

/*        HOW TO USE ? 
 1.  import "DownPullItem.h"
 2.  please implement <DownPullItemDelegate>
 3.  build  [[DownPullItem alloc]initWithItem:  contentOfDownPullItem: itemBgImg itemBgImg_High:]
 4.  please Add this view to your view
 5.  add this code "['yourObjectName' makeAction:nil];"  to your downPullButton's Action 
 6.  rewrite this function  'clickWhichRowDoSth'  ,this function help you know which button you pressed.
	
					(	All rights reserved,Violators will be prosecuted.   )
 */
#import <UIKit/UIKit.h>
@class DownPullItem;
@protocol DownPullItemDelegate<NSObject>
@optional
-(void)clickWhichRowDoSth:(id)sender;
- (void)downPullItem:(DownPullItem*)downPullItem withSelectedButton:(UIButton*)selectedButton;
@end


@interface DownPullItem : UIView {
	id<DownPullItemDelegate> delegate;
	int goingDownTagFlag;
	NSMutableArray *buttonArray;
	
	NSMutableArray *itemArray;
	UIImage *im;
	UIImage *imgP;
    CGSize imgSize;
	UIScrollView *downPullScrollView;
	id yourSelectedObject;
}
@property (nonatomic,assign) id<DownPullItemDelegate> delegate;
@property (nonatomic,retain) NSMutableArray *buttonArray;
@property (nonatomic,assign) int goingDownTagFlag;
@property (nonatomic,retain) NSMutableArray *itemArray;
@property (nonatomic,retain) UIImage *im;
@property (nonatomic,retain) UIImage *imgP;
@property (nonatomic,assign) CGSize imgSize;
@property (nonatomic,retain) UIScrollView *downPullScrollView;

@property (nonatomic,retain) id yourSelectedObject;
-(id)initWithItem:(CGRect)frame contentOfDownPullItem:(NSMutableArray*)array itemBgImg:(UIImage*)img itemBgImg_High:(UIImage*)img_High;
-(id)initWithItem:(CGRect)frame contentOfDownPullItem:(NSMutableArray*)array itemBgImg:(UIImage*)img itemBgImg_High:(UIImage*)img_High imageSize:(CGSize)imageSize;
-(void)goingDownToMenu;
-(void)goingUPToMenu:(id)sender;
-(void)goingUPToMenuEnd;
-(void)makeAction:(id)sender;
//隐藏下拉列表(无动画)
- (void)hideDownPullItemNoAnimation;
@end
