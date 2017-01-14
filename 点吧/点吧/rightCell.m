//
//  rightCell.m
//  点吧
//
//  Created by Jerry on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "rightCell.h"

@implementation rightCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    [self.addBtn addTarget:self action:@selector(addNum:) forControlEvents:UIControlEventTouchUpInside];
    [self.subBtn addTarget:self action:@selector(subNum:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addNum:(UIButton *)sender
{
    if(_number <= 100)
    {
        _number ++;
        [self updataNumbel];
    }
    CGPoint btnPoint = [self convertPoint:sender.center toView:self.superview];
    self.block(btnPoint);
}
-(void)subNum:(UIButton *)sender
{
    if(_number == 0)
    {
        return;
    }
    else
    {
        _number --;
        [self updataNumbel];
    }
}
-(void)updataNumbel
{
    _numLabel.text = [NSString stringWithFormat:@"%zd",_number];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
