//
//  Pay.h
//  点吧
//
//  Created by Pro on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MeMuList;

@interface Pay : NSObject
@property(nonatomic,strong)NSArray *menu_list;
@property(nonatomic,strong)NSString *arrival;
@property(nonatomic,strong)NSString *mode_id;
@property(nonatomic,strong)NSString *order_id;
@property(nonatomic,strong)NSString *order_no;
@property(nonatomic,strong)NSString *order_price;
@property(nonatomic,strong)NSString *order_time;
@property(nonatomic,strong)NSString *out_time;
@property(nonatomic,strong)NSString *people_num;
@property(nonatomic,strong)NSString *rel_mode;
@property(nonatomic,strong)NSString *store_id;
@property(nonatomic,strong)NSString *store_name;
@property(nonatomic,strong)NSString *table_name;
@property(nonatomic,strong)NSString *table_num;
@property(nonatomic,strong)NSString *type_name;

@end



@interface MeMuList : NSObject

@property(nonatomic,strong)NSString *count_price;
@property(nonatomic,strong)NSString *menu_name;
@property(nonatomic,strong)NSString *menu_order_price;
@property(nonatomic,strong)NSString *menu_order_num;

@end
