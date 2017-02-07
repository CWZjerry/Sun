//
//  hotPtoRequest.m
//  点吧
//
//  Created by Jerry on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "hotPtoRequest.h"

@implementation hotPtoRequest


+(void)getWithHotPto:(SuccessHotPto)successData failure:(FailureBlock)failureDataw
{
    NSDictionary * dicINfo = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"store_id",@"1",@"is_outsite", nil];
    [[NetworkRequest shareInstance] POST:@"http://www.kdiana.com/index.php/Before/Orders/fix_type_sel" parameters:dicINfo Success:^(id success) {
        NSLog(@"%@",success);
        
        hotPot * hot = [[hotPot alloc]init];
        [hot setValuesForKeysWithDictionary:success];
        
        NSMutableArray * hotArr = [NSMutableArray array];
        
        for (NSDictionary * dic in hot.fix_list) {
            hotPot_fix_list *  fotFix = [[hotPot_fix_list alloc]init];
            [fotFix setValuesForKeysWithDictionary:dic];
            [hotArr addObject:fotFix];
        }
        
        successData(hotArr);
    } Failure:^(id failure) {
        
        
    }];
}
@end
