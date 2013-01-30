

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	
	UITableView *aboutTableView;
	NSMutableArray *aboutArray;
}

@property(retain,nonatomic)NSMutableArray *aboutArray;

@end
