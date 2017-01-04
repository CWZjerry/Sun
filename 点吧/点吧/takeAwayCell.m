//
//  takeAwayCell.m
//  点吧
//
//  Created by Jerry on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "takeAwayCell.h"

@implementation takeAwayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setHomeInfo:(homeModel_info *)homeInfo
{
    self.store_name.text = homeInfo.store_name;
    [self.store_photo sd_setImageWithURL:[NSURL URLWithString:homeInfo.store_photo] placeholderImage:[UIImage imageNamed:@"img1"]];
}

@end
