//
//  MyInfoViewController.h
//  点吧
//
//  Created by Jenny on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
typedef void (^ReturnTextBlock)(NSString *showTextss);

@interface MyInfoViewController : UIViewController

@property (nonatomic,strong) User *user;
@property (nonatomic, copy) ReturnTextBlock returnTextBlock;
- (void)returnText:(ReturnTextBlock)block;

@end
