

#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h> // For .layer 

@implementation AboutViewController

@synthesize aboutArray;
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
   self.title=@"关于";
//    UIImageView *headerView=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,320, 44)];
//    headerView.image=[UIImage imageNamed:@"bottomviewbg.jpg"];
//    headerView.userInteractionEnabled=YES;
//    
//    
//    //Header back home button
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(15, 4, 35, 35);
//    [button setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(about2Setting) forControlEvents:UIControlEventTouchUpInside];
//    [headerView addSubview:button];
//
//    UILabel *titleLabel=[[UILabel  alloc]initWithFrame:CGRectMake(114,6,100,30)];
//    titleLabel.text=@"关于";
//    titleLabel.font=[UIFont boldSystemFontOfSize:24];
//    titleLabel.backgroundColor=[UIColor clearColor];
//    titleLabel.textAlignment=NSTextAlignmentCenter;
//    [headerView  addSubview:titleLabel];
//    
//    [self.view addSubview:headerView];
//    [headerView release];
//    [titleLabel release];
    
    
    aboutTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, [[UIScreen mainScreen] applicationFrame].size.width,[[UIScreen mainScreen] applicationFrame].size.height - 44-48) style:UITableViewStyleGrouped];
    aboutTableView.delegate=self;
    aboutTableView.dataSource=self;
    aboutTableView.backgroundColor=[UIColor whiteColor];
    aboutTableView.backgroundView=nil;
    [self.view addSubview:aboutTableView];
    [aboutTableView release];

	NSMutableArray *array=[[NSMutableArray alloc] initWithObjects:
                           @"   中国平安保险(集团)股份有限公司（以下简称“中国平安”，“公司”，“集团”）于1988年诞生于深圳蛇口，是中国第一家股份制保险企业，至今已发展成为融保险、银行、投资等金融业务为一体的整合、紧密、多元的综合金融服务集团。公司为香港联合交易所主板及上海证券交易所两地上市公司，股票代码分别为2318和601318。\n    中国平安的企业使命是：对股东负责，资产增值，稳定回报；对客户负责，服务至上，诚信保障；对员工负责，生涯规划，安居乐业；对社会负责，回馈社会，建设国家。中国平安以“专业创造价值”为核心文化理念，倡导以价值最大化为导向，以追求卓越为过程，形成了“诚实、信任、进取、成就”的个人价值观，和“团结、活力、学习、创新”的团队价值观。集团贯彻“竞争、激励、淘汰”三大机制，执行“差异、专业、领先、长远”的经营理念。\n      中国平安的愿景是以保险、银行、投资三大业务为支柱，谋求企业的长期、稳定、健康发展，为企业各利益相关方创造持续增长的价值，成为国际领先的综合金融服务集团和百年老店。",nil];
	self.aboutArray=array;
	[array release];
	
	//http://www.wahart.com.hk/rgb.htm
	UIView *tableheaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(130,20,57,57)];
	imageView.image=[UIImage imageNamed:@"icon.png"];
	[tableheaderView addSubview:imageView];
    aboutTableView.tableHeaderView = tableheaderView;
	[imageView release];
	[tableheaderView release];
}
	

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
	
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if(section==0){
    return [aboutArray count];
	}
	else {
		return 2;
	}

	
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if(section == 0)
		return @"简介";
	else
		return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	
	if(section == 0)
		return @" ";
	else
		return @"Copyright©1985-2013 JustinJing All Rights Reserved.";
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	NSUInteger section=[indexPath section];
	UITableViewCell *cell = nil;
    if (section==0) {
		static NSString *CellIdentifier1 = @"myCell";
		
		 cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1] autorelease];
			cell.selectionStyle=UITableViewCellEditingStyleNone;
			//cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
			
			UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
			label.tag = 1;
			label.lineBreakMode = NSLineBreakByWordWrapping;
			label.highlightedTextColor = [UIColor whiteColor];
			label.numberOfLines = 0;
			label.textColor=[UIColor grayColor];
			label.opaque = NO; // 选中Opaque表示视图后面的任何内容都不应该绘制
			label.backgroundColor = [UIColor clearColor];
			[cell.contentView addSubview:label];
			[label release];
			
		}
		
		// Configure the cell...
		UILabel *label = (UILabel *)[cell viewWithTag:1];
		NSString *text= [aboutArray objectAtIndex:indexPath.row];
		CGRect cellFrame = [cell frame];
		cellFrame.origin = CGPointMake(0,0);
		cellFrame.size.width=cellFrame.size.width-14.0f;
		label.text = text;
		label.backgroundColor=[UIColor clearColor];
		CGRect rect = CGRectInset(cellFrame,2,2);
		label.frame = rect;
		[label sizeToFit];
		
		if (label.frame.size.height > 46) {
			
			cellFrame.size.height = 50 + label.frame.size.height - 46;
		}
		else {
			cellFrame.size.height = 50;
		}
		
		[cell setFrame:cellFrame];
	}
	else if(section==1){
		static NSString *SettingIdentifiter = @"DisplayCellWaring";
		cell = [tableView dequeueReusableCellWithIdentifier:SettingIdentifiter];
		if (cell == nil) 
		{
			cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: SettingIdentifiter] autorelease];
		    cell.selectionStyle=UITableViewCellStyleDefault;
		}
        if (indexPath.row==0) {
            cell.textLabel.text=@"检查更新";
        }else {
		cell.textLabel.text =cell.textLabel.text = NSLocalizedString(@"软件版本                           Ver.1.0.0",nil);
        }
	}
	cell.backgroundColor =[UIColor clearColor];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
	return cell.frame.size.height;
}



-(void)about2Setting{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
} 

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
   [super dealloc];
}


@end
