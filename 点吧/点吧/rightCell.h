//
//  rightCell.h
//  点吧
//
//  Created by Jerry on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rightCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (nonatomic,assign) int number;

@property (nonatomic,copy)void(^block)(CGPoint point);
@end
