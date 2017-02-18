//
//  rightCell.h
//  点吧
//
//  Created by Jerry on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hotPot.h"
@interface rightCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (nonatomic,assign) int number;

@property(nonatomic,strong) HotPot_Data_fix_list * hotFix;


@property (weak, nonatomic) IBOutlet UIImageView *fix_img;
@property (weak, nonatomic) IBOutlet UILabel *fix_name;
@property (weak, nonatomic) IBOutlet UILabel *fix_price;

@property (nonatomic,copy)void(^block)(CGPoint point);
@end
