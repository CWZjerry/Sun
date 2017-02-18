//
//  ReturnViewController.m
//  点吧
//
//  Created by Jenny on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectResultData.h"

@interface AddressTableViewCell : UITableViewCell

/**
 名字
 */
@property (weak, nonatomic) IBOutlet UILabel *Name;

/**
 性别
 */
@property (weak, nonatomic) IBOutlet UILabel *Sex;

/**
 联系电话
 */
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;

/**
 收货地址
 */
@property (weak, nonatomic) IBOutlet UILabel *Adress;

/**
 选中小按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

/**
 默认地址label
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tacitlyAddress;

/**
 编辑地址按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *Edit;

/**
 删除地址按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *Delete;

@property (nonatomic, strong) SelectResultData *selectData;
@end
