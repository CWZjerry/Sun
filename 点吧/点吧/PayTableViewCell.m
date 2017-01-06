//
//  PayTableViewCell.m
//  点吧
//
//  Created by Pro on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "PayTableViewCell.h"
#import "UILabel+OGLabel.h"
#import <UIView+SDAutoLayout.h>




@interface PayTableViewCell  ()
@property(nonatomic,strong)UIButton*judgeBth;

@end
@implementation PayTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    UIImageView *payImage = [[UIImageView alloc]init];
    payImage.image = [UIImage imageNamed:@"alipay"];
    _payImage = payImage;
    [self.contentView addSubview:self.payImage];
    _payImage.sd_layout
    .leftSpaceToView(self.contentView,12)
    .topSpaceToView(self.contentView,10)
    .widthIs(22)
    .heightIs(22);
    UILabel *name = [[UILabel alloc]initWithText:@"支付宝支付" font:[UIFont systemFontOfSize:15]  textColor:[GVColor hexStringToColor:@"#333333"]];
    _name = name;
    [self.contentView addSubview:self.name];
    _name.sd_layout
    .leftSpaceToView(self.payImage,14)
    .centerYEqualToView(self.payImage)
    .widthIs(100)
    .autoHeightRatio(0);
    UIButton *round =[[UIButton alloc]init];
    [round setImage:[UIImage imageNamed:@"paydown"] forState:UIControlStateNormal];
    [round setImage:[UIImage imageNamed:@"payup"] forState:UIControlStateSelected];
    [round addTarget:self action:@selector(bthClick:) forControlEvents:UIControlEventTouchUpInside];
    _round = round;
    [self.contentView addSubview:self.round];
    _round.sd_layout
    .rightSpaceToView(self.contentView,12)
    .centerYEqualToView(self.contentView)
    .widthIs(13)
    .heightIs(13);
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
