//
//  AddrssTableViewCell.h
//  点吧
//
//  Created by Pro on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddrssTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel*name;
@property(nonatomic,strong)UILabel*sax;
@property(nonatomic,strong)UILabel *telephone;
@property(nonatomic,strong)UILabel *address;
@property(nonatomic,strong)UILabel *line;
@property(nonatomic,strong)UIButton *btnImage;
@property(nonatomic,strong)UIButton *defaults;
@property(nonatomic,strong)UIButton *edit;
@property(nonatomic,strong)UIButton *deleta;
@property(nonatomic,strong)UIImageView *deletaImage;
@property(nonatomic,strong)UIImageView *editImage;

@end
