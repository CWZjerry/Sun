//
//  BottomView.m
//  点吧
//
//  Created by Pro on 2017/1/5.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "BottomView.h"
#import "UILabel+OGLabel.h"
#import "GVColor.h"
#import <UIView+SDAutoLayout.h>
@implementation BottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    UIView *left = [[UIView alloc]init];
    left.backgroundColor = [GVColor hexStringToColor:@"#444444"];
    _leftView = left;
    [self addSubview:self.leftView];
    _leftView.sd_layout
    .leftEqualToView(self)
    .topEqualToView(self)
    .widthIs(258)
    .bottomEqualToView(self);
    UILabel *money = [[UILabel alloc]initWithText:@"共计 ¥" font:[UIFont systemFontOfSize:15] textColor:[GVColor hexStringToColor:@"#ffffff"]];
    _money = money;
    [self.leftView addSubview:self.money];
    _money.sd_layout
    .leftSpaceToView(self.leftView,12)
    .centerYEqualToView(self.leftView)
    .widthIs(50)
    .autoHeightRatio(0);
    UILabel *number =[[UILabel alloc]initWithText:@"168.00" font:[UIFont systemFontOfSize:19] textColor:[GVColor hexStringToColor:@"#ffffff"]];
    _number = number;
    
    [self.leftView addSubview:self.number];
    _number.sd_layout
    .leftSpaceToView(self.money,0)
    .centerYEqualToView(self.leftView)
    .widthIs(130)
    .autoHeightRatio(0);
    UIButton *submit =[[UIButton alloc]init];
    [submit setTitle:@"提交订单" forState:UIControlStateNormal];
    submit.titleLabel.font = [UIFont systemFontOfSize:17];
    submit.titleLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
    submit.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
    _SubMit = submit;
    [self addSubview:self.SubMit];
    _SubMit.sd_layout
    .leftSpaceToView(self.leftView,0)
    .rightEqualToView(self)
    .topEqualToView(self)
    .bottomEqualToView(self);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
