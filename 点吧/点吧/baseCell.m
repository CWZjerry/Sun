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
    [self.addBtn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.subtractBtn addTarget:self action:@selector(subBtn:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)addBtn:(UIButton *)btn
{
    if([self.delegate respondsToSelector:@selector(baseCount:andButtonTag:)])
    {
        [self.delegate baseCount:self andButtonTag:btn.tag];
    }
    NSLog(@"+");
}
-(void)subBtn:(UIButton *)btn
{
    if([self.delegate respondsToSelector:@selector(baseCount:andButtonTag:)])
    {
        [self.delegate baseCount:self andButtonTag:btn.tag];
    }
    NSLog(@"-");
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
