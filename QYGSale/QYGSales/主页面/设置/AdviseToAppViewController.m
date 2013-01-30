//
//  AdviseToAppViewController.m
//  PAPortalNew
//
//  Created by da zhan on 12-11-21.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "AdviseToAppViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AdviseToAppViewController ()

@end

@implementation AdviseToAppViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.title=@"意见反馈";
     //self.navigationController.navigationBar.hidden=YES;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view.backgroundColor=[UIColor whiteColor];
    UIBarButtonItem *send=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                      target:self
                                                                      action:@selector(sendButton)];
    
    self.navigationItem.rightBarButtonItem = send;
    [send release];
//    UIImageView *headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,320, 44)];
//    headerView.image=[UIImage imageNamed:@"bottomviewbg.jpg"];
//    headerView.userInteractionEnabled=YES;
//    
//    
//    //Header back home button
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(15, 4, 35, 35);
//    [button setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(back2Setting) forControlEvents:UIControlEventTouchUpInside];
//    [headerView addSubview:button];
//    
//    
//    
//    //Header send button
//    UIButton *sendbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//    sendbutton.frame = CGRectMake(260, 4,44, 35);
//    [sendbutton setImage:[UIImage imageNamed:@"advise_send.png"] forState:UIControlStateNormal];
//    [sendbutton addTarget:self action:@selector(sendButton) forControlEvents:UIControlEventTouchUpInside];
//    [headerView addSubview:sendbutton];
//    
//    
//    
//    //Header title label
//    UILabel *titleLabel=[[UILabel  alloc]initWithFrame:CGRectMake(114,6,100,30)];
//    titleLabel.text=@"意见反馈";
//    titleLabel.font=[UIFont boldSystemFontOfSize:24];
//    titleLabel.backgroundColor=[UIColor clearColor];
//    titleLabel.textAlignment=UITextAlignmentCenter;
//    [headerView  addSubview:titleLabel];
//    
//    [self.view addSubview:headerView];
//    [headerView release];
//    [titleLabel release];
    
    
    emailTF=[[UITextField alloc]initWithFrame:CGRectMake(10,10,300,30)];
    emailTF.placeholder=@"邮箱地址";
    emailTF.delegate=self;
    emailTF.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    emailTF.font=[UIFont systemFontOfSize:18.0];
    emailTF.keyboardType=UIKeyboardTypeEmailAddress;
    emailTF.layer.borderWidth=1;
    emailTF.returnKeyType=UIReturnKeyDone;
    emailTF.layer.borderColor=[[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]CGColor];
    emailTF.layer.cornerRadius=6.0;
    [self.view addSubview:emailTF];
    [emailTF release];
    
    
    adviseTV=[[UITextView alloc]initWithFrame:CGRectMake(10, emailTF.frame.origin.y+emailTF.frame.size.height+8,300,88)];
    adviseTV.delegate=self;
    adviseTV.layer.borderWidth=1;
    adviseTV.layer.borderColor=[[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]CGColor];
    adviseTV.layer.cornerRadius=6.0;
    adviseTV.returnKeyType=UIReturnKeyDone;
    adviseTV.contentInset = UIEdgeInsetsMake(6, 0, 0, 0);
    [self.view addSubview:adviseTV];
    [adviseTV release];
    
    
    
    textviewLabel1=[[UILabel  alloc]initWithFrame:CGRectMake(3,-6,100,30)];
    textviewLabel1.text=@"这里是您的意见";
    textviewLabel1.font=[UIFont boldSystemFontOfSize:14];
    textviewLabel1.backgroundColor=[UIColor clearColor];
    textviewLabel1.textColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    [adviseTV  addSubview:textviewLabel1];
    [textviewLabel1 release];
    
    
    numbercountLabel=[[UILabel  alloc]initWithFrame:CGRectMake(110,adviseTV.frame.origin.y+adviseTV.frame.size.height+2,200,30)];
    numbercountLabel.text=@"您还可以输入140字";
    numbercountLabel.font=[UIFont systemFontOfSize:16];
    numbercountLabel.backgroundColor=[UIColor clearColor];
    numbercountLabel.textAlignment=UITextAlignmentRight;
    numbercountLabel.textColor=[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.8];
    [self.view  addSubview:numbercountLabel];
    [numbercountLabel release];
    
    NSString* section1Str=[NSString stringWithFormat:@"%@",@"感谢您宝贵意见和建议,我们将第一时间做出回应!"];
    CGSize size = [section1Str sizeWithFont:[UIFont systemFontOfSize:18.0] constrainedToSize:CGSizeMake(300, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    UILabel *section1=[[UILabel  alloc]initWithFrame:CGRectMake(6,numbercountLabel.frame.origin.y+numbercountLabel.frame.size.height+8,300,size.height)];
    section1.text=section1Str;
    section1.font=[UIFont systemFontOfSize:18.0];
    section1.lineBreakMode=UILineBreakModeWordWrap;
    section1.numberOfLines=999;
    section1.backgroundColor=[UIColor clearColor];
    [self.view  addSubview:section1];
    [section1 release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    textviewLabel1.hidden=NO;

}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
     adviseTV.text=@"";
     emailTF.text=@"";
    [self.view endEditing:YES];
}

-(void)back2Setting{
    adviseTV.text=@"";
    textviewLabel1.hidden=NO;
    [self.view endEditing:YES];
    self.navigationController.navigationBar.hidden=NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)sendButton{
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

#pragma mark  UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    // NSLog(@"sdafas==%d ,%@", range.length,text);
    int count=140;
    
    if ([textView.text isEqualToString:@""]) {
        textviewLabel1.hidden=NO;
    }else{
        textviewLabel1.hidden=YES;
    }
    
    if ([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
    }
    
    count=count-[textView.text length];
    if ([textView.text length]>140) {
        
        numbercountLabel.text=[NSString stringWithFormat:@"您已经超过了%d字",abs(count)];
    }else{
        
        numbercountLabel.text=[NSString stringWithFormat:@"您还可以输入%d字",abs(count)];
        
    }
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
      textviewLabel1.hidden=YES;
    
}
- (void)textViewDidChange:(UITextView *)textView{
    
    
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
     
    
}


#pragma mark  UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
     
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
 
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;{
    
    [textField resignFirstResponder];
    return YES;
}
@end
