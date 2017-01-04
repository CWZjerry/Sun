//
//  sideTableViewCell.m
//  点吧
//
//  Created by Jerry on 2016/12/30.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "sideTableViewCell.h"

@implementation sideTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setHoteType:(hoteModel_type *)hoteType
{
    self.sideTitle.text = hoteType.foot_type;
}
@end
