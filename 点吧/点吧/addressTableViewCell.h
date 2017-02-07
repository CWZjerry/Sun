//
//  addressTableViewCell.h
//  点吧
//
//  Created by Jenny on 2017/1/12.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addressTableViewCell : UITableViewCell

@property (nonatomic ,strong) UILabel *namelab;
@property (nonatomic ,strong) UILabel *addresslab;
@property (nonatomic ,strong) UILabel *sexlab;
@property (nonatomic ,strong) UILabel *numberlab;

@property (nonatomic ,strong) UIButton *addressbtn;
@property (nonatomic ,strong) UIButton *editBtn;
@property (nonatomic ,strong) UIButton *deleteBtn;




@end
