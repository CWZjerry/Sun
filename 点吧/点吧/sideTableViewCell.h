//
//  sideTableViewCell.h
//  点吧
//
//  Created by Jerry on 2016/12/30.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hoteModel.h"
@interface sideTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *sideTitle;

@property(nonatomic,strong) hoteModel_type * hoteType;
@end
