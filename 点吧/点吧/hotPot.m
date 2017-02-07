//
//  hotPot.m
//  点吧
//
//  Created by Jerry on 2017/2/7.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "hotPot.h"

@implementation hotPot
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefinedKey:%@",key);
}
@end

@implementation hotPot_fix_list

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"undefinedKey:%@",key);
}

@end
