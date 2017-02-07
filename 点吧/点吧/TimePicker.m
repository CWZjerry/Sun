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
        self.datePickerMode = UIDatePickerModeDateAndTime;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
