//
//  PayTimeTableViewCell.m
//  点吧
//
//  Created by Pro on 2017/1/5.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "PayTimeTableViewCell.h"

@implementation PayTimeTableViewCell

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    //[UIFont systemFontOfSize:15] textColor:[GVColor hexStringToColor:@"#ffffff"]];
    UILabel *name = [[UILabel alloc]initWithText:@"支付剩余时间" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:@"#ffba14"]];
    _name = name;
    [self.contentView addSubview:self.name];
    CGRect rect1 =[TextRect labelTextRect:self.name withSuperView:self.contentView];
    _name.sd_layout
    .topSpaceToView(self.contentView,10)
    .centerXEqualToView(self.contentView)
    .widthIs(rect1.size.width)
    .heightIs(rect1.size.height);
    UILabel *time = [[UILabel alloc]initWithText:@"15:00" font:[UIFont systemFontOfSize:16] textColor:[GVColor hexStringToColor:@"#ffba14"]];
    time.textAlignment = NSTextAlignmentCenter;
    _time = time;
    [self.contentView addSubview:self.time];
    CGRect rect2 =[TextRect labelTextRect:self.time withSuperView:self.contentView];
    _time.sd_layout
    .topSpaceToView(self.name,5)
    .centerXEqualToView(self.contentView)
    .widthIs(rect2.size.width+10)
    .heightIs(rect2.size.height);
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
