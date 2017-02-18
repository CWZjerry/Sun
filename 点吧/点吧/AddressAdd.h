//
//  ReturnViewController.m
//  点吧
//
//  Created by Jenny on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressAdd : UIView

/**
 姓名
 */
@property (weak, nonatomic) IBOutlet UITextField *Name;

/**
 电话
 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

/**
 地址
 */
@property (weak, nonatomic) IBOutlet UITextView *Address;

/**
 男
 */
@property (weak, nonatomic) IBOutlet UIButton *manButton;


/**
 女
 */
@property (weak, nonatomic) IBOutlet UIButton *womanButton;

/**
 提交按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *commitButton;

@end
