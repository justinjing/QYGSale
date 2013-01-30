//
//  PinganMoreAppViewController.m
//  PAPortalNew
//
//  Created by da zhan on 12-11-22.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import "PinganMoreAppViewController.h"

#define EachLabelPostionX 8.0f
#define EachLabelWidth    196.0f


@interface PinganMoreAppViewController ()

@end

@implementation PinganMoreAppViewController

 
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"更多应用";
    NSString *file = [[NSBundle mainBundle] pathForResource:@"PAMoreAppList" ofType:@"plist"];
    moreAppArray = [[NSMutableArray alloc] initWithContentsOfFile:file];
  
//    UIImageView *headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,320, 44)];
//    headerView.image=[UIImage imageNamed:@"bottomviewbg.jpg"];
//    headerView.userInteractionEnabled=YES;
//    
//    
//    //Header back home button
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(15, 4, 35, 35);
//
//    [button setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(moreApp2Setting) forControlEvents:UIControlEventTouchUpInside];
//    [headerView addSubview:button];
//    
//    
//    //Header title label
//    UILabel *titleLabel=[[UILabel  alloc]initWithFrame:CGRectMake(110,6,100,30)];
//    titleLabel.text=@"更多应用";
//    titleLabel.font=[UIFont boldSystemFontOfSize:24];
//    titleLabel.backgroundColor=[UIColor clearColor];
//    titleLabel.textAlignment=NSTextAlignmentCenter;
//    [headerView  addSubview:titleLabel];
//    
//    [self.view addSubview:headerView];
//    [headerView release];
//    [titleLabel release];

    moreAppTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] applicationFrame].size.width,[[UIScreen mainScreen] applicationFrame].size.height - 44-48) style:UITableViewStylePlain];
    moreAppTableView.delegate=self;
    moreAppTableView.dataSource=self;
    moreAppTableView.rowHeight=80.0;
    [self.view addSubview:moreAppTableView];
    [moreAppTableView release];
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
    
    UIImageView  *rssImageView =(UIImageView *)[[cell contentView]viewWithTag:00001];
    if (!rssImageView) {
        rssImageView = [[UIImageView alloc] initWithFrame:CGRectMake(EachLabelPostionX,12,56,56)];
        rssImageView.tag=00001;
        [rssImageView setContentMode:UIViewContentModeScaleToFill];
        [cell.contentView addSubview:rssImageView];
        [rssImageView release];
    }
    
    [rssImageView setImage:[UIImage imageNamed:[[moreAppArray objectAtIndex:[indexPath row]]objectForKey:@"imageUrl"]]];
    [rssImageView setImage:[UIImage imageNamed:@"Iconqq.png"]];
    
    UILabel  *titleLabel = (UILabel *)[[cell contentView]viewWithTag:11111];
    if (!titleLabel) {
        titleLabel =[ [UILabel alloc] initWithFrame:CGRectMake(rssImageView.frame.origin.x+rssImageView.frame.size.width+12,8, EachLabelWidth,26)];
        titleLabel.font = [UIFont systemFontOfSize:20];
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        titleLabel.numberOfLines = 999;
        titleLabel.backgroundColor=[UIColor clearColor];
        titleLabel.tag=11111;
        [cell.contentView addSubview:titleLabel];
        [titleLabel release];
    }
    titleLabel.text=[[moreAppArray objectAtIndex:[indexPath row]]objectForKey:@"title"];
    
  
    UILabel  *descriptionLabel = (UILabel *)[[cell contentView]viewWithTag:22222];
    if(!descriptionLabel){
    
        descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(rssImageView.frame.origin.x+rssImageView.frame.size.width+12,titleLabel.frame.origin.y+titleLabel.frame.size.height, EachLabelWidth, 40)];
        descriptionLabel.font = [UIFont systemFontOfSize:12];
        descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        descriptionLabel.numberOfLines = 999;
        descriptionLabel.tag=22222;
        descriptionLabel.textColor=[UIColor grayColor];
        descriptionLabel.backgroundColor=[UIColor clearColor];
        [cell.contentView addSubview:descriptionLabel];
        [descriptionLabel release];
    }
     descriptionLabel.text = [[moreAppArray objectAtIndex:[indexPath row]]objectForKey:@"appIntroduction"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(280, 14, 35, 35);
    button.tag =[indexPath row];
    [button setImage:[UIImage imageNamed:@"night_toolbar_save.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(downloadApp:) forControlEvents:UIControlEventTouchUpInside];
    button.tag=[indexPath row];
    [cell.contentView addSubview:button];
 
     UILabel  *freeLabel = (UILabel *)[[cell contentView]viewWithTag:44444];
    if(!freeLabel){

        freeLabel = [[UILabel alloc] initWithFrame:CGRectMake(278,button.frame.origin.y+button.frame.size.height, 36,18)];
        freeLabel.font = [UIFont systemFontOfSize:14];
        freeLabel.text = @"免费";
        freeLabel.tag  = 44444;
        freeLabel.textColor = [UIColor whiteColor];
        freeLabel.textAlignment=NSTextAlignmentCenter;
        freeLabel.backgroundColor = [UIColor colorWithRed:24.0/255.0 green:116.0/255.0 blue:205.0/255.0 alpha:1.0];
        [cell.contentView addSubview:freeLabel];
        [freeLabel release];
    }

    return cell;
}

 

-(void)downloadApp:(UIButton *)send{
    
    if(send.tag==0){
        NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
       
    }
    else if(send.tag==1){
           NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
         
    }
    else if(send.tag==2){
           NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
     }
    else if(send.tag==3){
        NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
        
    }
    else if(send.tag==4){
          NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
        
    }
    else if(send.tag==5){
         NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
          NSLog(@"dddddd7==%@",str);
         
    }
    else if(send.tag==6){
           NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
       
    }
    else if(send.tag==7){
          NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        NSLog(@"dddddd7==%@",str);
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
         
    }
    else if(send.tag==8){
        
           NSString *str = [NSString stringWithFormat:@"%@",[[moreAppArray objectAtIndex:send.tag]objectForKey:@"downloadUrl"]];
        NSLog(@"dddddd8==%@",str);
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:str]];
         
    }
  
}


/*
https://itunes.apple.com/cn/app/ping-kou-dai-yin-xing-ping/id439212087?mt=8
平安口袋银行 您贴身的移动理财管家

平安口袋银行是平安银行专为iPhone, iPod touch的用户推出的移动金融服务平台,通过它,您可以随时随地掌控自己的金融资产,三大特色让您畅享全新的移动银行服务体验。
1.创新的交互界面:书形的操作界面如同带领您翻阅一本生活化的理财秘籍, 摒弃一板一眼的枯燥, 在这里, 浏览资产负债, 查询帐户明细, 操作汇款转账, 打理基金理财产品一切都是那么简易又充满乐趣。
2.双重安全保护:登录就像在开启一个设有重重保护的保险柜, 采用更高安全级别的用户名密码设置规则, 加强防火墙监控, 提供操作超时或忘记退出时自动退出等安全策略, 实施双重网银级别防护, 确保您的账户安全。
3.多样化的增值服务:新增我的账本,我的愿望和金融日历功能模块,助您轻轻松松理财,规划美好未来。


https://itunes.apple.com/cn/app/li-cai-chan-pin-su-di/id570144814?mt=8
理财产品速递
内容提要
理财产品速递是由平安推出的一款的集合各家银行理财产品的即时筛选比价工具，可以让您快速找到您想要的银行理财产品。
无论哪家银行，无论是追求高收益，还是寻求保本，还是两者兼顾或需求更多，这款专业的理财工具都能满足。

- 丰富的产品信息：百家银行的所有在售和预售理财产品的实时数据，让您再也不会错过；

- 人性的筛选方式：可以自由根据收益率、理财期限、是否保本、地区、银行等条件进行单个或组合筛选，轻松找到您最想要的那款产品；

-全面的产品详情：除了详细展现产品的发行银行、发行地区、收益率等产品信息，还可以直接拨打银行客服电话或者地图展示您附近的银行网点，方便您购买；

- 便捷的理财计算器：指定产品的收益率计算，或者自定义条件自由计算，方便您计算自己的每次收益。

- 目前支持只iOS 5及以上版本


https://itunes.apple.com/cn/app/ping-an4s/id569760428?mt=8
平安4S

内容提要
平安4S是由中国平安推出的一款手机客服端软件，通过与4s店合作，
为用户提供4S店的资讯，优惠活动，预约保养维修等

平安4S：帮您轻松搞定爱车

-查询4s店的服务和价格，了解保养项目和费用
-一键预约4S店保养，省钱省时间
-及时提供您关注的4s店的优惠活动，车辆保养等资讯服务
-目前只支持上海地区的4S店


https://itunes.apple.com/cn/app/ping-an-ren-shou/id549421060?mt=8
平安人寿
内容提要
平安人寿E服务APP是面向IPhone手机客户全新推出的自助智能服务客户端。

通过将寿险客户细分为严谨型、轻松型、游客型三类，该客户端分别提供了不同的贴心服务模式，包括：一账通密码认证体系保单服务模式；手机号匹配保单服务模式；以及保单查验、门店查询、价格公告、保险知识、热销产品、推荐资讯、活动专区等无需身份认证的服务模式；是寿险客户打理保单、了解寿险不可或缺的智能工具。

https://itunes.apple.com/cn/app/ping-an-xing-che-zhu-shou/id488026942?mt=8
平安行车助手
平安行车助手是中国平安为广大车主用户推出的一款实用工具。
洗车指数、违章查询、油耗记录功能是客户在用车养车中的得力小助手。
来电有礼、最新活动更是为车主在用车养车中获得最贴心的实惠和礼遇。还不来试用一下?

https://itunes.apple.com/cn/app/ping-an-mian-fei-dao-hang/id472914806?mt=8
平安免费导航
☆平安免费导航☆是平安随行车主系列手机应用。

当您面对日新月异的城市变化时,当您自驾车出游遭遇陌生的道路环境时,您是否希望能得到出行的提示和道路指引?☆平安随行—导航版☆能帮您准确定位、替您规划最优路线、指引您顺利到达目的地,保让您出行无忧!
同时您也可以利用内置的车险报价功能,查询您的车险报价,享受平安私家车商业险多省15%的优惠和万元以下资料齐全一天赔付得快捷服务。

https://itunes.apple.com/cn/app/ping-an-che-xian/id462722369?mt=8
平安车险
您还在为如何买车险烦恼?中国平安独家推出车险报价、投保、服务一站式客户端软件,让您轻轻松松买车险。

在这里,您的私家车商业险不仅可享受多省15%的价格,以及丰富的礼品,还可以直接语音输入复杂的信息,更方便您录入。

想完全自主买车险,现在就下载吧!

https://itunes.apple.com/cn/app/ping-an-sui-xing/id438633707?mt=8
平安随行是中国平安针对广大有车一族推出的免费客户端软件
主要功能:
★ 语音导航:为平安车险客户定制的专业级语音导航功能,和迷路彻底告别。
★ 车险服务:快捷的保单和理赔进度查询以及出险报案、车险报价等其他车险相关的服务功能。
★ 行车助手:洗车指数、违章查询、油耗计算三大功能是行车用车过程中最好的帮手
★ 新闻资讯:包括了汽车、国内、国际、娱乐、体育等15大类实时新闻,各类资讯全在掌握。
★ 趣味游戏:闲暇之余可以放松一下心情,试试自己的运气。
★ 想吃、喝、玩、乐;想购物、想加油、想停车;想看看周边有啥,周边商户全知道让您了如指掌。

平安车险客户可以享受到平安提供的尊贵服务,非平安客户也可以体验到平安为您提供的贴心帮助。
只要您有自己的爱车,就该赶紧下载来试试。


https://itunes.apple.com/cn/app/ping-an-sheng-huo/id431213240?mt=8
平安生活,提供生活娱乐、分期购物、手机充值、优惠查询等丰富功能,让您随时随地尽享生活便捷与乐趣

主要功能
★ 平安商城:全国首创,在线选购下单一次完成
★ 手机充值:支持三大运营商,信用卡支付或万里通积分兑换,方便快捷
★ 电影票购买,手机选座支付,免去影院排队烦恼
★ 万里通积分乐园,丰富礼品随您选
★ 平安信用卡,最新最热的刷卡促销活动,最全最快的商户购物折扣
★ 信用卡还款网点查询,地图引导让您方便的找到离您最近的还款点
}
 */
@end
