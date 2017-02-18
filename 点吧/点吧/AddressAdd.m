//
//  ReturnViewController.m
//  点吧
//
//  Created by Jenny on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AddressAdd.h"

@implementation AddressAdd
- (IBAction)manClick:(id)sender {
    self.manButton.selected =!self.manButton.selected;
}
- (IBAction)woManClick:(id)sender {
    self.womanButton.selected =!self.womanButton.selected;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
