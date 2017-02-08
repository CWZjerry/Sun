//
//  HeadTableViewCell.m
//  点吧
//
//  Created by Pro on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "HeadTableViewCell.h"
#import "UILabel+OGLabel.h"
#import <UIView+SDAutoLayout.h>
@implementation HeadTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    UILabel *name = [[UILabel alloc]initWithText:@"送餐信息" font:[UIFont systemFontOfSize:15] textColor:[GVColor hexStringToColor:@"#333333"]];
    _name = name;
    [self.contentView addSubview:self.name];
    _name.sd_layout
    .leftSpaceToView(self.contentView,12)
    .centerYEqualToView(self.contentView)
    .autoHeightRatio(0)
    .widthIs(100);
    
    UIImageView *ordow = [[UIImageView alloc]init];
    ordow.image = [UIImage imageNamed:@"Menu_Enter"];
    _arrowHead = ordow;
    [self.contentView addSubview:self.arrowHead];
    _arrowHead.sd_layout
    .rightSpaceToView(self.contentView,12)
    .centerYEqualToView(self.contentView)
    .widthIs(6)
    .heightIs(8);
    
    UILabel *message = [[UILabel alloc]initWithText:@"请添加送餐信息" font:[UIFont systemFontOfSize:13] textColor:[GVColor hexStringToColor:@"#cccccc"]];
    message.textAlignment = NSTextAlignmentRight;
    _message = message;
    [self.contentView addSubview:self.message];
    _message.sd_layout
    .rightSpaceToView(self.arrowHead,8)
    .centerYEqualToView(self.contentView)
    .autoHeightRatio(0)
    .leftSpaceToView(self.name,0);
    
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
