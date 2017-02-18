//
//  hotPtoRequest.m
//  点吧
//
//  Created by Jerry on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "hotPtoRequest.h"

@implementation hotPtoRequest


//+(void)getWithHotPto:(SuccessHotPto)successData failure:(FailureBlock)failureDataw
//{
//    NSDictionary * dicINfo = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"store_id",@"1",@"is_outsite", nil];
//    [[NetworkRequest shareInstance] POST:@"http://www.kdiana.com/index.php/Before/Orders/fix_type_sel" parameters:dicINfo Success:^(id success) {
////        NSLog(@"123%@",success);
//        
//        hotPot * hot = [[hotPot alloc]init];
//        [hot setValuesForKeysWithDictionary:success];
//        
//        NSMutableArray * hotArr = [NSMutableArray array];
//        
//        for (NSDictionary * dic in hot.fix_list) {
//            hotPot_fix_list *  fotFix = [[hotPot_fix_list alloc]init];
//            [fotFix setValuesForKeysWithDictionary:dic];
//            [hotArr addObject:fotFix];
//        }
//        
//        successData(hotArr);
//    } Failure:^(id failure) {
//        
//        
//    }];
//}
//+(void)getWithHotLeft:(SuccessHotPto)successData failure:(FailureBlock)failureData
//{
//    [[NetworkRequest shareInstance] POST:@"http://www.kdiana.com/index.php/home/StoreMenu/classification" parameters:nil Success:^(id success) {
//        
//        NSMutableArray * marr = [NSMutableArray array];
//        hotPot_Data_left * hotData = [[hotPot_Data_left alloc]init];
//        [hotData setValuesForKeysWithDictionary:success];
//        for (NSDictionary * dic in hotData.data) {
//            hotPot_left * hotLeft = [[hotPot_left alloc]init];
//            [hotLeft setValuesForKeysWithDictionary:dic];
//            
//            [marr addObject:hotLeft];
//        }
//        
//        successData(marr);
//    } Failure:^(id failure) {
//        
//        
//    }];
//}


+(void)getWithHotPtoLeftAndRight:(SuccessHotPtoData)succesData failure:(FailureBlock)failureData
{
    [[NetworkRequest shareInstance] POST:@"http://www.kdiana.com/index.php/Before/Staff/fix_list" parameters:@{@"store_id":@"1"} Success:^(id success) {
        
        HotPot_Data * hotData = [[HotPot_Data alloc]init];
        [hotData setValuesForKeysWithDictionary:success];
        NSLog(@"%@",success);
        
        NSMutableArray * arrL= [NSMutableArray array];
        NSMutableArray * arrR  =[NSMutableArray array];
        
        //右
        for (NSDictionary * dic in hotData.fix_list) {
            HotPot_Data_fix_list * hF = [[HotPot_Data_fix_list alloc]init];
            [hF setValuesForKeysWithDictionary:dic];
           
            [arrR addObject:hF];
        }
        //左
        for (NSDictionary * dic2 in hotData.fix_type) {
            HotPot_Data_fix_type * hT = [[HotPot_Data_fix_type alloc]init];
            [hT setValuesForKeysWithDictionary:dic2];
            
            [arrL addObject:hT];
        }
        
        //二维数组
        NSInteger teger = arrL.count;
        NSMutableArray * arrAll = [NSMutableArray arrayWithCapacity:teger];
        [arrAll addObject:arrR];//把全部元素加入到数组中作为0个
        
        //左
        for (int i=0; i<teger-1; i++) {
            HotPot_Data_fix_type * hType = arrL[i+1];
            NSMutableArray * arr1 = [NSMutableArray array];
            //右
            for(int ii = 0; ii<arrR.count; ii++)
            {
                HotPot_Data_fix_list * hFix = arrR[ii];
                if([hType.id isEqualToString:hFix.fix_type])
                {
                    
                    [arr1 addObject:hFix];
                }
            }
            [arrAll addObject:arr1];
        }
        
        
        succesData(arrL,arrR,arrAll);
    } Failure:^(id failure) {
        
        
    }];
}
@end
