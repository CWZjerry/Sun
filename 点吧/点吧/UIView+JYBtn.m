//
//  UIView+JYBtn.m
//  点吧
//
//  Created by Jenny on 2017/2/15.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "UIView+JYBtn.h"

@implementation UIView (JYBtn)
//1
-(void)setZLBS_width:(CGFloat)ZLBS_width
{
    CGRect frame = self.frame;
    frame.size.width = ZLBS_width;
    self.frame = frame;
}

-(CGFloat)ZLBS_width
{
    
    return self.frame.size.width;
}


//2
-(void)setZLBS_height:(CGFloat)ZLBS_height
{
    CGRect frame = self.frame;
    frame.size.height = ZLBS_height;
    self.frame = frame;
}

-(CGFloat)ZLBS_height
{
    
    return self.frame.size.height;
}


//3
-(void)setZLBS_x:(CGFloat)ZLBS_x
{
    CGRect frame = self.frame;
    frame.origin.x = ZLBS_x;
    self.frame = frame;
    
    
}

-(CGFloat)ZLBS_x
{
    
    return self.frame.origin.x;
}


//4
-(void)setZLBS_y:(CGFloat)ZLBS_y
{
    CGRect frame = self.frame;
    frame.origin.y = ZLBS_y;
    self.frame = frame;
    
}

-(CGFloat)ZLBS_y
{
    
    return self.frame.origin.y;
}


//5
-(void)setZLBS_centerX:(CGFloat)ZLBS_centerX
{
    CGPoint center = self.center;
    center.x = ZLBS_centerX;
    self.center = center;
}

-(CGFloat)ZLBS_centerX
{
    
    return self.center.x;
}

//6
-(void)setZLBS_centerY:(CGFloat)ZLBS_centerY
{
    CGPoint center = self.center;
    center.y = ZLBS_centerY;
    self.center = center;
    
}

-(CGFloat)ZLBS_centerY
{
    
    return self.center.y;
}



//7
-(void)setZLBS_right:(CGFloat)ZLBS_right
{
    self.ZLBS_x = ZLBS_right - self.ZLBS_width;
    
    
}

-(CGFloat)ZLBS_right
{
    
    //    return self.ZLBS_x +self.ZLBS_width;
    return CGRectGetMaxX(self.frame);
}



//8
-(void)setZLBS_bottom:(CGFloat)ZLBS_bottom
{
    self.ZLBS_y = ZLBS_bottom-self.ZLBS_height;
    
}

-(CGFloat)ZLBS_bottom
{
    return CGRectGetMaxY(self.frame);
}




+ (instancetype)viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}
@end
