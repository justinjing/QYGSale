//
//  ViewController.m
//  QYGSales
//
//  Created by da zhan on 12-12-11.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "ViewController.h"
#import "firstViewController.h"
#import "settingViewController.h"
#import "homeViewController.h"

@interface ViewController ()
-(UIButton*) buttonWithText:(NSString*) text;
@end
static ViewController *seh=nil;
@implementation ViewController
//@synthesize notificationView, commentCountLabel, likeCountLabel, followerCountLabel, showButton, hideButton;

+(ViewController *)share{
    
    if (seh==nil) {
        seh=[[ViewController alloc]init];
    }
    
    return seh;
}

-(void)homeButton{
    [self setSelectedIndex:1];
}

-(id)init{

        if (self = [super init]) {
            
            [self addCenterButtonWithImage:[UIImage imageNamed:@"cameraTabBarItem.png"] highlightImage:nil];
            [self.button addTarget:self action:@selector(homeButton) forControlEvents:UIControlEventTouchUpInside];

        }
        return self;
    }


- (void)viewDidLoad
{
    [super viewDidLoad];
 
    firstViewController *firstRootController =[[firstViewController alloc]init];
    UINavigationController *fristRootNav = [[UINavigationController alloc]initWithRootViewController:firstRootController];
    
    
    homeViewController *homeRootController =[[homeViewController alloc]init];
    UINavigationController *homeRootNav = [[UINavigationController alloc]initWithRootViewController:homeRootController];
    
    settingViewController *settingController = [[settingViewController alloc]init];
    UINavigationController *settingNav = [[UINavigationController alloc]initWithRootViewController:settingController];
    //settingNav.navigationBar.hidden=YES;
//    settingNav.delegate=self;
    
    self.viewControllers = [NSArray arrayWithObjects:
                            [self viewControllerWithTabTitle:fristRootNav Title:@"Popular" image:[UIImage imageNamed:@"29-heart.png"] Tag:11],
                            [self viewControllerWithTabTitle:homeRootNav Title:@"Share" image:nil Tag:22],
                            [self viewControllerWithTabTitle:settingNav Title:@"Setting" image:[UIImage imageNamed:@"123-id-card.png"] Tag:33],nil];
    
    [firstRootController release];
    [fristRootNav release];
    
    [homeRootController release];
    [homeRootNav release];
    
    [settingController release];
    [settingNav release];
    
    // Set the title view to the Instagram logo
//    UIImage* titleImage = [UIImage imageNamed:@"navigationBarLogo.png"];
//    UIView* titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,titleImage.size.width, self.navigationController.navigationBar.frame.size.height)];
//    UIImageView* titleImageView = [[UIImageView alloc] initWithImage:titleImage];
//    [titleView addSubview:titleImageView];
//    titleImageView.center = titleView.center;
//    CGRect titleImageViewFrame = titleImageView.frame;
//    // Offset the logo up a bit
//    titleImageViewFrame.origin.y = titleImageViewFrame.origin.y + 3.0;
//    titleImageView.frame = titleImageViewFrame;
//    self.navigationItem.titleView = titleView;
//    // Get our custom nav bar
//    CustomNavigationBar* customNavigationBar = (CustomNavigationBar*)self.navigationController.navigationBar;
//    
//    // Set the nav bar's background
//    [customNavigationBar setBackgroundWith:[UIImage imageNamed:@"navigationBarBackgroundRetro.png"]];
}

-(void)willAppearIn:(UINavigationController *)navigationController
{
    [self addCenterButtonWithImage:[UIImage imageNamed:@"cameraTabBarItem.png"] highlightImage:nil];
}

-(UIButton*) buttonWithText:(NSString*) text
{
    UIImage* buttonImage = [UIImage imageNamed:@"button-normal.png"];
    UIImage* buttonPressedImage = [UIImage imageNamed:@"button-highlighted.png"];
    UIImage* buttonDisabledImage = [UIImage imageNamed:@"button-disabled.png"];
    
    UIButton* button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    
    [button1 setTitle:text forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont buttonFontSize]];
    
    [button1 setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button1 setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button1 setBackgroundImage:buttonPressedImage forState:UIControlStateSelected];
    [button1 setBackgroundImage:buttonDisabledImage forState:UIControlStateDisabled];
    
    return button1;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
 
}

- (void)dealloc
{
    
    [super dealloc];
}


@end

