//
//  SexView.m
//  点吧
//
//  Created by Pro on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "SexView.h"

@implementation SexView
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
    UILabel *name = [[UILabel alloc]initWithText:@"手机号" font:[UIFont systemFontOfSize:15]textColor:[GVColor hexStringToColor:@"#333333"]];
    _name = name;
    [self addSubview:self.name];
    CGRect rect1 = [TextRect labelTextRect:self.name withSuperView:self];
    _name.sd_layout
    .leftSpaceToView(self,12)
    .centerYEqualToView(self)
    .widthIs(rect1.size.width)
    .autoHeightRatio(0);
    UITextField *teleph = [[UITextField alloc]init];
    teleph.placeholder = @"请输入您的姓名";
    _telephone = teleph;
    [self addSubview:self.telephone];
    _telephone.sd_layout
    .leftSpaceToView(self.name,10)
    .centerYEqualToView(self)
    .widthIs(150)
    .autoHeightRatio(0);
    UIButton *man = [[UIButton alloc]init];
    [man setTitle:@"男士" forState:UIControlStateNormal];
    [man setTitleColor:[GVColor hexStringToColor:@"#cccccc"] forState:UIControlStateNormal];
    [man setTitleColor:[GVColor hexStringToColor:@"#555555"] forState:UIControlStateSelected];
    man.titleLabel.font = [UIFont systemFontOfSize:13];
    _man = man;
    [self addSubview:self.man];
    CGRect rect2 = [TextRect labelTextRect:self.man.titleLabel withSuperView:self];
    _man.sd_layout
    .rightSpaceToView(self,12)
    .centerYEqualToView(self)
    .widthIs(rect2.size.width)
    .heightIs(rect2.size.height);
    

    UIButton *manBtn = [[UIButton alloc]init];
    [manBtn setImage:[UIImage imageNamed:@"paydown"] forState:UIControlStateNormal];
    [manBtn setImage:[UIImage imageNamed:@"payup"] forState:UIControlStateSelected];
    _manBtn = manBtn;
    [self addSubview:self.manBtn];
    _manBtn.sd_layout
    .rightSpaceToView(self.man,8)
    .centerYEqualToView(self)
    .widthIs(9)
    .heightIs(9);
    
    UIButton *lady = [[UIButton alloc]init];
    [lady setTitle:@"女士" forState:UIControlStateNormal];
    [lady setTitleColor:[GVColor hexStringToColor:@"#cccccc"] forState:UIControlStateNormal];
    [lady setTitleColor:[GVColor hexStringToColor:@"#555555"] forState:UIControlStateSelected];
    lady.titleLabel.font = [UIFont systemFontOfSize:13];
    _lady = lady;
    [self addSubview:self.lady];
    _lady.sd_layout
    .rightSpaceToView(self.manBtn,15)
    .centerYEqualToView(self)
    .widthIs(rect2.size.width)
    .heightIs(rect2.size.height);
    UIButton *ladyImage = [[UIButton alloc]init];
    [ladyImage setImage:[UIImage imageNamed:@"paydown"] forState:UIControlStateNormal];
    [ladyImage setImage:[UIImage imageNamed:@"payup"] forState:UIControlStateSelected];
    _ladyBtn = ladyImage;
    [self addSubview:self.ladyBtn];
    _ladyBtn.sd_layout
    .rightSpaceToView(self.lady,9)
    .centerYEqualToView(self)
    .widthIs(9)
    .heightIs(9);
//
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
