//
//  baseCell.h
//  点吧
//
//  Created by Jerry on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
@class baseCell;
#import "hoteModel.h"

@protocol baseCellDelegate <NSObject>

- (void)baseCount:(baseCell *)cell andButtonTag:(NSInteger)AddOrSubTag;
@end

@interface baseCell : UITableViewCell

@property(nonatomic,weak) id <baseCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;//加

@property (weak, nonatomic) IBOutlet UILabel *clearNum;//数量
@property (weak, nonatomic) IBOutlet UIButton *subtractBtn;//减
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;//价格
@property (weak, nonatomic) IBOutlet UILabel *titleName;//菜名

@property(nonatomic,strong) hoteModel_menu_info * hoteInfo;
@end
