//
//  shareIDRestrainViewController.m
//  PAPortalNew
//
//  Created by da zhan on 12-11-26.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "shareIDRestrainViewController.h"
#import "WeiBoShareViewController.h"
 
#import "TCWBGlobalUtil.h"
#import "TCWBRebroadcastMsgViewController.h"
//#import "TCRootViewController.h"
#import "FileStreame.h"
#import "key.h"
#import <CoreText/CoreText.h>


#define kWBSDKDemoAppKey    @"3612035166"
#define kWBSDKDemoAppSecret @"f411d39b83e45b781d7f9024480b04b3"


#define EachLabelPostionX 8.0f
#define EachLabelWidth    196.0f


#define TCWBAlertViewLogOutTag          100
#define TCWBAlertViewLogInTag           101

@interface shareIDRestrainViewController ()

@end


@implementation shareIDRestrainViewController
@synthesize weiboEngine;
//@synthesize moreAppArray;
@synthesize weiBoEngine;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *array = [[NSMutableArray  alloc]initWithObjects:@"新浪微博",
                              @"腾讯微博",nil];
    //self.moreAppArray=array;
    moreAppArray = [[NSMutableArray alloc] initWithArray:array];
    [array release];
    self.title=@"帐号绑定";

//    UIImageView *headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,320, 44)];
//    headerView.image=[UIImage imageNamed:@"bottomviewbg.jpg"];
//    headerView.userInteractionEnabled=YES;
//    
//    
//    //Header back home button
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(15, 4, 35, 35);
//    [button setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(moreApp2Setting) forControlEvents:UIControlEventTouchUpInside];
//    [headerView addSubview:button];
//    
//    
//    //Header title label
//    UILabel *titleLabel=[[UILabel  alloc]initWithFrame:CGRectMake(110,6,100,30)];
//    titleLabel.text=@"帐号绑定";
//    titleLabel.font=[UIFont boldSystemFontOfSize:24];
//    titleLabel.backgroundColor=[UIColor clearColor];
//    titleLabel.textAlignment=NSTextAlignmentCenter;
//    [headerView  addSubview:titleLabel];
//    
//    [self.view addSubview:headerView];
//    [headerView release];
//    [titleLabel release];
    
    moreAppTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, 320, self.view.bounds.size.height-44) style:UITableViewStyleGrouped];
    moreAppTableView.delegate=self;
    moreAppTableView.dataSource=self;
    moreAppTableView.backgroundView=nil;
    moreAppTableView.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:moreAppTableView];
    [moreAppTableView release];
    
    
    
    TCWBEngine *engine = [[TCWBEngine alloc] initWithAppKey:WiressSDKDemoAppKey andSecret:WiressSDKDemoAppSecret andRedirectUrl:@"http://www.ying7wang7.com"];
    [engine setRootViewController:self];
    //[engine setRedirectURI:@"http://www.ying7wang7.com"];
    self.weiboEngine = engine;
    [engine release];
    
    
    WBEngine *sinaengine = [[WBEngine alloc] initWithAppKey:kWBSDKDemoAppKey appSecret:kWBSDKDemoAppSecret];
    [sinaengine setRootViewController:self];
    [sinaengine setDelegate:self];
    [sinaengine setRedirectURI:@"http://"];
    [sinaengine setIsUserExclusive:NO];
    self.weiBoEngine = sinaengine;
    [sinaengine release];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)moreApp2Setting{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [moreAppArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"moreAppCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
        
    }

    cell.textLabel.text=[moreAppArray objectAtIndex:[indexPath row]];

    if ([indexPath row]==0) {
        cell.imageView.image=[UIImage imageNamed:@"icon_weibo_sina.png"];
        
        UISwitch  *sinaSwitch = (UISwitch *)[[cell contentView]viewWithTag:11111];
        if (!sinaSwitch) {
            sinaSwitch =[ [UISwitch alloc] initWithFrame:CGRectMake(210,8, 40,26)];
            sinaSwitch.backgroundColor=[UIColor clearColor];
            sinaSwitch.tag=111111;
            [cell.contentView addSubview:sinaSwitch];
            [sinaSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
            [sinaSwitch release];
        }
    }
    else  if ([indexPath row]==1) {
         cell.imageView.image=[UIImage imageNamed:@"icon_weibo_tencent.png"];
    
        UISwitch  *tencentSwitch = (UISwitch *)[[cell contentView]viewWithTag:22222];
        if (!tencentSwitch) {
            tencentSwitch =[ [UISwitch alloc] initWithFrame:CGRectMake(210,8, 40,26)];
            tencentSwitch.backgroundColor=[UIColor clearColor];
            tencentSwitch.tag=22222;
            tencentSwitch.on=NO;
            [cell.contentView addSubview:tencentSwitch];
            [tencentSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
            [tencentSwitch release];
        }
    }
    
    return cell;
}

- (void)switchValueChanged:(id)sender{
    UISwitch* control = (UISwitch*)sender;
    if(control.tag==111111){
        NSLog(@"111111111111111111");
        if (control.on==YES) {
           
            NSLog(@"yes");
            [weiBoEngine logIn];
        
        }else{
          
           NSLog(@"no");
        }
    }else {
      NSLog(@"2222222");
        if (control.on==YES) {
            NSLog(@"yes");
            [self onLogin];
        }else{
            NSLog(@"no");
            [self onLogout];
        }

    }
}



 
#pragma mark - login callback

//登录成功回调
- (void)onSuccessLogin
{
   // [indicatorView stopAnimating];
}

//登录失败回调
- (void)onFailureLogin:(NSError *)error
{
   // [indicatorView stopAnimating];
    NSString *message = [[NSString alloc] initWithFormat:@"%@",[NSNumber numberWithInteger:[error code]]];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[error domain]
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    [message release];
}

//#ifdef USE_UI_TWEET
//点击一键分享(自带登录功能)
- (void)onLogInOAuthButtonPressed
{
    // 分享(自带登录功能)
    [self.weiboEngine UIBroadCastMsgWithContent:@"qq"
                                       andImage:[UIImage imageNamed:@"test.png"]
                                    parReserved:nil
                                       delegate:self
                                    onPostStart:@selector(postStart)
                                  onPostSuccess:@selector(createSuccess:)
                                  onPostFailure:@selector(createFail:)];
    
}

// 点击一键转播（自带登陆功能）
- (void)repeatModuleCreat {
    
    // 转播（自带登陆功能）
    [self.weiboEngine UICreatRebroadWithContent:@"中秋，国庆"
                                    imageRefURL:@"http://mat1.gtimg.com/app/opent/images/index/iweibo/logo.gif"
                               videoImageRefURL:@"http://www.tudou.com/programs/view/b-4VQLxwoX4/"
                                    parReserved:nil
                                       delegate:self
                                    onPostStart:@selector(postStart)
                                      onSuccess:@selector(createSuccess:)
                                      onFailure:@selector(createFail:)];
    
}
//授权成功回调
- (void)onSuccessAuthorizeLogin
{
   //[indicatorView stopAnimating];
    [self onLogInOAuthButtonPressed];
}

#pragma mark - method

//点击登录按钮
- (void)onLogin {
    [weiboEngine logInWithDelegate:self
                         onSuccess:@selector(onSuccessLogin)
                         onFailure:@selector(onFailureLogin:)];
}
- (void)onLogout {
    // 注销授权
    if ([weiboEngine logOut]) {
        [self showAlertMessage:@"登出成功！"];
    }else {
        [self showAlertMessage:@"登出失败！"];
    }
}

- (void)onGeneralInterfaceBtnPressed {
    if ([[self.weiboEngine openId] length] > 0) {
//        TCRootViewController *tcWBRootViewController = [[TCRootViewController alloc] init];
//        UINavigationController	*tcWBRootNavController = [[UINavigationController alloc] initWithRootViewController:tcWBRootViewController];
//        [tcWBRootViewController release];
//        [self presentModalViewController:tcWBRootNavController animated:YES];
//        [tcWBRootNavController release];
    }
    else {
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil
                                                           message:@"请先授权！"
                                                          delegate:self
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil];
        [alertView setTag:TCWBAlertViewLogInTag];
        [alertView show];
        [alertView release];
    }
}

- (void)didRequestMutualList:(id)result{
    
}


#pragma mark -
#pragma mark - creatSuccessOrFail

- (void)postStart {
    NSLog(@"%s", __FUNCTION__);
    //    [self showAlertMessage:@"开始发送"];
}

- (void)createSuccess:(NSDictionary *)dict {
    NSLog(@"%s %@", __FUNCTION__,dict);
    if ([[dict objectForKey:@"ret"] intValue] == 0) {
        [self showAlertMessage:@"发送成功！"];
    }else {
        [self showAlertMessage:@"发送失败！"];
    }
}

- (void)createFail:(NSError *)error {
    NSLog(@"error is %@",error);
    [self showAlertMessage:@"发送失败！"];
}

- (void)showAlertMessage:(NSString *)msg {
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil
                                                       message:msg
                                                      delegate:self
                                             cancelButtonTitle:@"确定"
                                             otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
}


- (void)loadShareView {
    sendView = [[WBSendView alloc] initWithAppKey:kWBSDKDemoAppKey
                                        appSecret:kWBSDKDemoAppSecret
                                             text:@""
                                            image:nil];
    [sendView setDelegate:self];
    
    [sendView show:YES];
    [sendView release];
}

#pragma mark 微博登陆回调

- (void)onLogInXAuthButtonPressed
{
    WBLogInAlertView *logInView = [[WBLogInAlertView alloc] init];
    [logInView setDelegate:self];
    [logInView show];
    [logInView release];
}

//登录成功
- (void)engineDidLogIn:(WBEngine *)engine
{
    [self loadShareView];
}

#pragma mark - WBLogInAlertViewDelegate Methods

- (void)logInAlertView:(WBLogInAlertView *)alertView logInWithUserID:(NSString *)userID password:(NSString *)password
{
    [weiBoEngine logInUsingUserID:userID password:password];
}


#pragma mark 微博分享回调

- (void)sendViewWillAppear:(WBSendView *)view {
    
}

- (void)sendViewDidAppear:(WBSendView *)view {
    sendView = nil;
}

- (void)sendViewDidFinishSending:(WBSendView *)view
{
    [view hide:YES];
    sendView = nil;
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil
													   message:@"微博发送成功！"
													  delegate:nil
											 cancelButtonTitle:@"确定"
											 otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)sendView:(WBSendView *)view didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    [view hide:YES];
    sendView = nil;
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil
													   message:@"微博发送失败！"
													  delegate:nil
											 cancelButtonTitle:@"确定"
											 otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)sendViewNotAuthorized:(WBSendView *)view
{
    [view hide:YES];
    sendView = nil;
    
    [self dismissViewControllerAnimated:YES  completion:nil];
}

- (void)sendViewAuthorizeExpired:(WBSendView *)view
{
    [view hide:YES];
    sendView = nil;
    
//    [self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
