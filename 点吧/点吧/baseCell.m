//
//  baseCell.m
//  点吧
//
//  Created by Jerry on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "baseCell.h"

@implementation baseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setHoteInfo:(hoteModel_menu_info *)hoteInfo
{
    self.titleName.text = hoteInfo.menu_name;
    self.priceLabel.text= hoteInfo.menu_price;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
