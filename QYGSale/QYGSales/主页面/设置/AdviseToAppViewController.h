//
//  AdviseToAppViewController.h
//  PAPortalNew
//
//  Created by da zhan on 12-11-21.
//  Copyright (c) 2012年 da zhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdviseToAppViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>{
    
    UITextView *adviseTV;
    UILabel *textviewLabel1;
    UILabel *numbercountLabel;
    UITextField *emailTF;
}

@end
