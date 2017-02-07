//
//  hotPot.h
//  点吧
//
//  Created by Jerry on 2017/2/7.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@class hotPot_fix_list;

@interface hotPot : NSObject
@property(nonatomic,strong) NSArray * fix_list;

@end

@interface hotPot_fix_list : NSObject
@property(nonatomic,strong) NSString * fix_img;
@property(nonatomic,strong) NSString * fix_name;
@property(nonatomic,strong) NSString * fix_price;
@property(nonatomic,strong) NSString * fix_sock;
@property(nonatomic,strong) NSString * fix_type;
@property(nonatomic,assign) NSInteger id;
@end
