//
//  leftCell.h
//  点吧
//
//  Created by Jerry on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotPot.h"
@interface leftCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftTitle;

@property(nonatomic,strong) HotPot_Data_fix_type * hotLeft;
@end
