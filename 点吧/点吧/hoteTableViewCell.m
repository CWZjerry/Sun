//
//  hoteTableViewCell.m
//  点吧
//
//  Created by Jerry on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "hoteTableViewCell.h"

@implementation hoteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.rightBtn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.leftBtn addTarget:self action:@selector(subBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)addBtn:(UIButton *)btn
{
    if([self.delegate respondsToSelector:@selector(goodsCount:andButtonTag:)])
    {
        [self.delegate goodsCount:self andButtonTag:btn.tag];
    }
}
-(void)subBtn:(UIButton *)btn
{
    if([self.delegate respondsToSelector:@selector(goodsCount:andButtonTag:)])
    {
        [self.delegate goodsCount:self andButtonTag:btn.tag];
    }
}
-(void)setHoteInfo:(hoteModel_menu_info *)hoteInfo
{
    self.foot_type.text = hoteInfo.menu_name;
    [self.photo sd_setImageWithURL:[NSURL URLWithString:hoteInfo.photo] placeholderImage:[UIImage imageNamed:@"img1"]];
    self.menu_price.text = hoteInfo.menu_price;
    self.numLabel.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
    
//    if(hoteInfo.count_num < 1)
//    {
//        _numLabel.text = @"0";
//    }else
//    {
//        _numLabel.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
//    }
    
}
//-(void)btnNum:(UIButton *)sender
//{
//
//    if(_number <= 100)
//    {
//        _number ++;
//        _blockNum(_number);
//        [self updataNumbel];
//    }
//}
//-(void)subNum:(UIButton *)sender
//{
//    if(_number == 0)
//    {
//        return;
//    }
//    else
//    {
//        _number --;
//        _blockNum(_number);
//        [self updataNumbel];
//    }
//}
//-(void)updataNumbel
//{
//    _numLabel.text = [NSString stringWithFormat:@"%zd",_number];
//}

//-(void)leftAction:(UIButton *)button
//{
//   if([self.delegate respondsToSelector:@selector(leftNewHotelTableViewCell:)])
//   {
//       [self.delegate leftNewHotelTableViewCell:self];
//   }
//}
//-(void)rightAction:(UIButton *)button
//{
//    if([self.delegate respondsToSelector:@selector(rightNewHotelTableViewCell:)])
//    {
//        [self.delegate rightNewHotelTableViewCell:self];
//    }
//}


@end
