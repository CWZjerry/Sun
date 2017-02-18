//
//  leftCell.m
//  点吧
//
//  Created by Jerry on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "leftCell.h"

@implementation leftCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setHotLeft:(HotPot_Data_fix_type *)hotLeft
{
    self.leftTitle.text = hotLeft.fixing_type;
}
@end
