//
//  OrderSubMit.h
//  点吧
//
//  Created by Pro on 2017/2/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderSubMit : NSObject
@property(nonatomic,assign)NSInteger code;
@property(nonatomic,assign)NSInteger order_id;
@property(nonatomic,assign)NSInteger order_no;
@property(nonatomic,strong)NSString *message;

@end
