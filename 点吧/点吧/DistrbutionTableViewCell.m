//
//  DistrbutionTableViewCell.m
//  点吧
//
//  Created by Pro on 2017/2/13.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "DistrbutionTableViewCell.h"

@implementation DistrbutionTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    UILabel *textLable =[[UILabel alloc]initWithText:@"订单号码：" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:@"#777777"]];
    
    self.textLable = textLable;
    [self.contentView addSubview:self.textLable];
    CGRect rect =[TextRect labelTextRect:self.textLable withSuperView:self.contentView];
    _textLable.sd_layout
    .leftSpaceToView(self.contentView,12)
    .centerYEqualToView(self.contentView)
    .widthIs(rect.size.width)
    .autoHeightRatio(0);
    UILabel *detaila = [[UILabel alloc]initWithText:@"" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:@"#777777"]];
    self.detailTextLable = detaila;
    [self.contentView addSubview:self.detailTextLable];
    _detailTextLable.sd_layout
    .leftSpaceToView(self.textLable,5)
    .topEqualToView(self.textLable)
    .rightEqualToView(self.contentView)
    .autoHeightRatio(0);
    
    
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
