//
//  AddrssTableViewCell.m
//  点吧
//
//  Created by Pro on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AddrssTableViewCell.h"
#define BLACK @"#333333"
@implementation AddrssTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    UILabel *name = [[UILabel alloc]initWithText:@"马薇薇" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:BLACK]];
    _name = name;
    [self.contentView addSubview:self.name];
    _name.sd_layout
    .topSpaceToView(self.contentView,15)
    .leftSpaceToView(self.contentView,12)
    .widthIs(45)
    .autoHeightRatio(0);
    UILabel *sax = [[UILabel alloc]initWithText:@"女士" font:[UIFont systemFontOfSize:12] textColor:[GVColor hexStringToColor:@"#888888"]];
    _sax = sax;
    [self.contentView addSubview:self.sax];
    _sax.sd_layout
    .leftSpaceToView(self.name,5)
    .centerYEqualToView(self.name)
    .widthIs(50)
    .autoHeightRatio(0);
    UILabel*telephone = [[UILabel alloc]initWithText:@"12122222222" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:BLACK]];
    telephone.textAlignment = NSTextAlignmentRight;
    _telephone = telephone;
    [self.contentView addSubview:self.telephone];
    _telephone.sd_layout
    .rightSpaceToView(self.contentView,12)
    .topEqualToView(self.name)
    .widthIs(150)
    .autoHeightRatio(0);
    UILabel*address = [[UILabel alloc]initWithText:@"看见电视里看手机翻开历史的肌肤轮廓" font:[UIFont systemFontOfSize:14] textColor:[GVColor hexStringToColor:BLACK]];
    _address = address;
    [self.contentView addSubview:self.address];
    _address.sd_layout
    .leftEqualToView(self.name)
    .topSpaceToView(self.name,15)
    .widthIs(self.frame.size.width)
    .autoHeightRatio(0);
    UILabel *line = [[UILabel alloc]init];
    line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    _line = line;
    [self.contentView addSubview:self.line];
    _line.sd_layout
    .leftEqualToView(self.name)
    .topSpaceToView(self.address,15)
    .rightSpaceToView(self.contentView,12)
    .heightIs(1);
    UIButton *btnImage = [[UIButton alloc]init];
    [btnImage setImage:[UIImage imageNamed:@"paydown"] forState:UIControlStateNormal];
    [btnImage setImage:[UIImage imageNamed:@"payup"] forState:UIControlStateSelected];
    _btnImage = btnImage;
    [self.contentView addSubview:self.btnImage];
    _btnImage.sd_layout
    .leftEqualToView(self.name)
    .topSpaceToView(self.line,10)
    .widthIs(9)
    .heightIs(9);
    UIButton *defaults = [[UIButton alloc]init];
    [defaults setTitle:@"管理地址" forState:UIControlStateNormal];
    [defaults setTitleColor:[GVColor hexStringToColor:@"#aaaaaa"] forState:UIControlStateNormal];
    [defaults setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateSelected];
    defaults.titleLabel.font = [UIFont systemFontOfSize:12];
    defaults.titleLabel.textAlignment = NSTextAlignmentLeft;
    _defaults = defaults;
    [self.contentView addSubview:self.defaults];
    _defaults.sd_layout
    .leftSpaceToView(self.btnImage,5)
    .centerYEqualToView(self.btnImage)
    .widthIs(50)
    .autoHeightRatio(0);
    UIButton *dele = [[UIButton alloc]init];
    [dele setTitle:@"删除" forState:UIControlStateNormal];
    dele.titleLabel.font = [UIFont systemFontOfSize:13];
    [dele setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal];
    _deleta = dele;
    [self.contentView addSubview:self.deleta];
    _deleta.sd_layout
    .topEqualToView(self.defaults)
    .rightSpaceToView(self.contentView,12)
    .widthIs(30)
    .autoHeightRatio(0);
    UIImageView *deleImage = [[UIImageView alloc]init];
    deleImage.image = [UIImage imageNamed:@"del"];
    _deletaImage = deleImage;
    [self.contentView addSubview:self.deletaImage];
    _deletaImage.sd_layout
    .rightSpaceToView(self.deleta,5)
    .centerYEqualToView(self.deleta)
    .widthIs(12)
    .heightIs(12);
    UIButton *edit = [[UIButton alloc]init];
    [edit setTitle:@"编辑" forState:UIControlStateNormal];
    edit.titleLabel.font = [UIFont systemFontOfSize:13];
    [edit setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal];
    _edit = edit;
    [self.contentView addSubview:self.edit];
    _edit.sd_layout
    .rightSpaceToView(self.deletaImage,20)
    .topEqualToView(self.deleta)
    .widthIs(30)
    .autoHeightRatio(0);
    UIImageView *editImage = [[UIImageView alloc]init];
    editImage.image = [UIImage imageNamed:@"compile"];
    _editImage = editImage;
    [self.contentView addSubview:self.editImage];
    _editImage.sd_layout
    .rightSpaceToView(self.edit,5)
    .centerYEqualToView(self.deleta)
    .widthIs(12)
    .heightIs(12);
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
