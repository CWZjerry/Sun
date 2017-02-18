//
//  Details.h
//  点吧
//
//  Created by Pro on 2017/2/13.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Menu_list;
@class State_type;

@interface Details : NSObject
@property(nonatomic,copy)NSString *order_id;
@property(nonatomic,copy)NSString *send_time;
@property(nonatomic,copy)NSString *order_address;
@property(nonatomic,copy)NSString *store_name;
@property(nonatomic,copy)NSString *store_photo;
@property(nonatomic,copy)NSString *order_no;
@property(nonatomic,copy)NSString *order_time;
@property(nonatomic,copy)NSString *pay_type;
@property(nonatomic,copy)NSString *return_pay_price;
@property(nonatomic,copy)NSString *people_num;
@property(nonatomic,copy)NSString *eat_type;
@property(nonatomic,copy)NSString *eat_id;
@property(nonatomic,copy)NSString *rel_mode;
@property(nonatomic,copy)NSString *arrival;
@property(nonatomic,copy)NSString *order_people;
@property(nonatomic,copy)NSString *finish_state;
@property(nonatomic,copy)NSString *takeout_address;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *tel;
@property(nonatomic,copy)NSString *is_rated;
@property(nonatomic,copy)NSDictionary *state_type;
@property(nonatomic,copy)NSArray *menu_list;
@end


@interface Menu_list : NSObject
@property(nonatomic,strong)NSString *menu_name;
@property(nonatomic,strong)NSString *menu_order_price;
@property(nonatomic,strong)NSString *menu_order_num;
@property(nonatomic,strong)NSString *menu_id;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *star;
@end

@interface State_type : NSObject
@property(nonatomic,strong)NSString *state;
@property(nonatomic,strong)NSString *photo;
@property(nonatomic,strong)NSString *explain;
@end
