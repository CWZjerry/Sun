//
//  hotPot.h
//  点吧
//
//  Created by Jerry on 2017/2/7.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class hotPot_fix_list;
//@class hotPot_left;
//@class hotPot_Data_left;

//@interface hotPot : NSObject
//@property(nonatomic,strong) NSArray * fix_list;
//@end
//
//@interface hotPot_fix_list : NSObject
//@property(nonatomic,strong) NSString * fix_img;
//@property(nonatomic,strong) NSString * fix_name;
//@property(nonatomic,strong) NSString * fix_price;
//@property(nonatomic,strong) NSString * fix_sock;
//@property(nonatomic,strong) NSString * fix_type;
//@property(nonatomic,assign) NSInteger id;
//@end
//
//@interface hotPot_Data_left : NSObject
//@property(nonatomic,strong) NSArray * data;
//@end
//
//@interface hotPot_left : NSObject
//@property(nonatomic,strong) NSString * id;
//@property(nonatomic,strong) NSString * fixing_type;
//@end

@class HotPot_Data;
@class HotPot_Data_fix_list;
@class HotPot_Data_fix_type;

@interface HotPot_Data : NSObject
@property(nonatomic,strong) NSArray * fix_list;
@property(nonatomic,strong) NSArray * fix_type;
@end

@interface HotPot_Data_fix_list : NSObject
@property(nonatomic,strong) NSString * fix_id;
@property(nonatomic,strong) NSString * fix_name;
@property(nonatomic,strong) NSString * fix_num;
@property(nonatomic,strong) NSString * fix_price;
@property(nonatomic,strong) NSString * fix_type;
@end

@interface HotPot_Data_fix_type : NSObject
@property(nonatomic,strong) NSString * fixing_type;
@property(nonatomic,strong) NSString * id;
@end
