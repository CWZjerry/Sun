//
//  Judge.h
//  点吧
//
//  Created by Pro on 2017/2/14.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@class menu_list;
@interface Judge : NSObject
@property(nonatomic,strong)NSString *eat_type;
@property(nonatomic,strong)NSString *rel_mode;
@property(nonatomic,strong)NSString *store_name;
@property(nonatomic,strong)NSString *store_photo;
@property(nonatomic,strong)NSString *order_no;
@property(nonatomic,strong)NSString *people_num;
@property(nonatomic,strong)NSString *table_name;
@property(nonatomic,strong)NSString *order_time;
@property(nonatomic,strong)NSString *order_id;
@property(nonatomic,strong)NSArray *menu_list;
@end

@interface menu_list : NSObject
@property(nonatomic,strong)NSString *menu_name;
@end
