//
//  ReturnViewController.m
//  点吧
//
//  Created by Jenny on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

- (void)setSelectData:(SelectResultData *)selectData{
    _selectData =selectData;
    self.Name.text =selectData.username;
    self.phoneNumber.text =selectData.tel;
    self.Adress.text =selectData.takeout_address;
    
    if ([selectData.sex isEqualToString:@"1"]) {
        self.Sex.text = @"男";
    }else{
        self.Sex.text = @"女";
    }
    
    if ([selectData.state isEqualToString:@"1"]) {
        self.selectButton.selected = YES;
    }else{
        self.selectButton.selected = NO;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
