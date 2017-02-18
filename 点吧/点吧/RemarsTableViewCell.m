//
//  RemarsTableViewCell.m
//  点吧
//
//  Created by Pro on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "RemarsTableViewCell.h"
#import "UILabel+OGLabel.h"
#import <UIView+SDAutoLayout.h>
@implementation RemarsTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    UILabel *remarks = [[UILabel alloc]initWithText:@"订单备注" font:[UIFont systemFontOfSize:15] textColor:[GVColor hexStringToColor:@"#333333"]];
    _remarks = remarks;
    [self.contentView addSubview:self.remarks];
    _remarks.sd_layout
    .leftSpaceToView(self.contentView,12)
    .topSpaceToView(self.contentView,10)
    .widthIs(63)
    .autoHeightRatio(0);
    UITextField *tates = [[UITextField alloc]init];
//    tates.backgroundColor = [UIColor orangeColor];
    tates.placeholder = @"请输入备注";
    
    _tates = tates;
    [self.contentView addSubview:self.tates];
    _tates.sd_layout
    .leftSpaceToView(self.remarks,15)
    .topEqualToView(self.remarks)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.remarks);
    
    
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
