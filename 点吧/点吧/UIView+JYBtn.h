//
//  UIView+JYBtn.h
//  点吧
//
//  Created by Jenny on 2017/2/15.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JYBtn)
@property (nonatomic, assign) CGFloat  ZLBS_width;
@property (nonatomic, assign) CGFloat  ZLBS_height;
@property (nonatomic, assign) CGFloat  ZLBS_x;
@property (nonatomic, assign) CGFloat  ZLBS_y;
@property (nonatomic, assign) CGFloat  ZLBS_centerX;
@property (nonatomic, assign) CGFloat  ZLBS_centerY;

@property (nonatomic, assign) CGFloat  ZLBS_right;
@property (nonatomic, assign) CGFloat  ZLBS_bottom;


+ (instancetype)viewFromXib;
@end
