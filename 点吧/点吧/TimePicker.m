//
//  TimePicker.m
//  点吧
//
//  Created by Pro on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "TimePicker.h"

@implementation TimePicker
- (instancetype)init
{
    self = [super init];
    if (self) {
//
        
        [self setupUI];
    }
    return self;
}
-(void)setupUI
{
    UIDatePicker *picker = [[UIDatePicker alloc]init];
    picker.datePickerMode = UIDatePickerModeDateAndTime;
            picker.backgroundColor = [UIColor orangeColor];
    self.datePicker = picker;
    [self addSubview:self.datePicker];
    _datePicker.sd_layout
    .leftEqualToView(self)
    .topSpaceToView(self,30)
    .rightEqualToView(self)
    .bottomEqualToView(self);
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    [button setUserInteractionEnabled:YES];
    self.bth = button;
    [self addSubview:self.bth];
    _bth.sd_layout
    .rightSpaceToView(self,30)
    .topEqualToView(self)
    .widthIs(40)
    .heightIs(30);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
