//
//  PreferentialView.m
//  点吧
//
//  Created by Pro on 2017/1/12.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "PreferentialView.h"

@implementation PreferentialView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}
-(void)setUpUI
{
    UIImageView *imageView = [[UIImageView alloc]init];
    _imageView = imageView;
    [self addSubview:self.imageView];
    _imageView.sd_layout
    .leftSpaceToView(self,12)
    .topSpaceToView(self,10)
    .widthIs(290)
    .heightIs(89);
    UIButton *selectBtn = [[UIButton alloc]init];
    [selectBtn setImage:[UIImage imageNamed:@"paydown"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"payup"] forState:UIControlStateSelected];
    _selctedBtn = selectBtn;
    [self addSubview:self.selctedBtn];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
