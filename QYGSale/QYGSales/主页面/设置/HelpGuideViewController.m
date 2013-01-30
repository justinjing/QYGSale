//
//  HelpGuideViewController.m
//  PAPortalNew
//
//  Created by da zhan on 12-11-26.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "HelpGuideViewController.h"
#import "ViewController.h"
@interface HelpGuideViewController ()

@end

@implementation HelpGuideViewController
 
//@synthesize imageView;
@synthesize left = _left;
@synthesize right = _right;
@synthesize pageScroll;
@synthesize pageControl;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(void)dealloc
{

    //[self.left release];
    //[self.right release];
    [super dealloc];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:YES];
     
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor scrollViewTexturedBackgroundColor];
    self.navigationController.navigationBar.hidden=YES;

	// Do any additional setup after loading the view, typically from a nib.
    pageScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    pageScroll.delegate = self;
    pageScroll.pagingEnabled=YES;
    pageScroll.showsHorizontalScrollIndicator=NO;
    pageScroll.contentSize = CGSizeMake(self.view.frame.size.width * 5, self.view.frame.size.height);
    [self.view addSubview:pageScroll];
    
    
    for (int i=0; i<5; i++) {
        UIImageView* imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(320*i,0,320,460)];
        imageView1.image=[UIImage imageNamed:[NSString stringWithFormat:@"bg_help_0%d.jpg",(i+1)]];
        [pageScroll addSubview:imageView1];
        [imageView1 release];
        if (i==4) {
            imageView1.userInteractionEnabled=YES;
            
            UIButton *startButton=[UIButton buttonWithType:UIButtonTypeCustom];
            startButton.frame=CGRectMake(25, 280, 270, 38);
            [startButton setBackgroundImage:[UIImage imageNamed:@"button_start_enjoying.png"] forState:UIControlStateNormal];
            [startButton addTarget:self action:@selector(gotoMainView) forControlEvents:UIControlEventTouchUpInside];
            [imageView1 addSubview:startButton];
        }
    }
    
    pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 440,320, 20)];
    pageControl.numberOfPages = 5;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}


- (void)scrollViewResume
{
    [pageScroll setContentOffset:CGPointMake(0, 0)];
//    [ViewController share].button.hidden=NO;
}


-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID isEqualToString:@"split"] && finished) {
        
        [self.left removeFromSuperview];
        [self.right removeFromSuperview];
        
        [self.pageScroll setHidden:NO];
        [self.pageControl setHidden:NO];
        
        [self performSelector:@selector(scrollViewResume) withObject:nil afterDelay:.3];
        
//        NextViewController *controller = [[NextViewController alloc] init];
//        [self presentModalViewController:controller animated:YES];
//        [controller release];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)gotoMainView{
    self.navigationController.navigationBar.hidden=NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self performSelector:@selector(scrollViewResume) withObject:nil afterDelay:.5];
    
//    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
//    [self.gotoMainViewBtn setHidden:YES];
 /*
    NSArray *array = [UIImage splitImageIntoTwoParts:[UIImage imageNamed:@"bg_help_05.jpg"]];
    self.left = [[UIImageView alloc] initWithImage:[array objectAtIndex:0]];
    self.right = [[UIImageView alloc] initWithImage:[array objectAtIndex:1]];
    [self.view addSubview:self.left];
    [self.view addSubview:self.right];
    [self.pageScroll setHidden:YES];
    [self.pageControl setHidden:YES];
    
    self.left.transform = CGAffineTransformIdentity;
    self.right.transform = CGAffineTransformIdentity;
    
    [UIView beginAnimations:@"split" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    self.left.transform = CGAffineTransformMakeTranslation(-160 ,0);
    self.right.transform = CGAffineTransformMakeTranslation(160 ,0);
    [UIView commitAnimations];
*/
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.view.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

@end