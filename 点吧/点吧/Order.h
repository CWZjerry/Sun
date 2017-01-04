//
//  Order.h
//  点吧
//
//  Created by Pro on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject
@property(nonatomic,copy)NSString *eat_type;
@property(nonatomic,copy)NSString *finish_state;
@property(nonatomic,copy)NSString *order_time;
@property(nonatomic,copy)NSString *store_name;
@property(nonatomic,copy)NSString *store_photo;
@property(nonatomic,strong)NSNumber *order_id;
@property(nonatomic,strong)NSNumber *order_no;
@property(nonatomic,strong)NSNumber *order_price;
@property(nonatomic,strong)NSNumber *state_id;
@property(nonatomic,strong)NSNumber *store_id;

@end
