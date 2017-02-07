//
//  ReturnViewController.h
//  点吧
//
//  Created by Jenny on 2017/1/7.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^sendValue)(BOOL isJump);

@interface ReturnViewController : UIViewController

@property (nonatomic, copy)sendValue sendValueBlock;

@end
