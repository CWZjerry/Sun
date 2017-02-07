//
//  hoteRequest.m
//  点吧
//
//  Created by Jerry on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "hoteRequest.h"

@implementation hoteRequest

//堂食
+(void)GetWithRequest:(SuccessHoteData)successData dicSTR:(NSDictionary *)dicStr failure:(FailureBlock)failureData
{
    [[NetworkRequest shareInstance]POST:@"http://www.kdiana.com/index.php/Before/Orders/menu_list" parameters:dicStr Success:^(id success) {
        
        hoteModel * hoteM = [[hoteModel alloc]init];
        [hoteM setValuesForKeysWithDictionary:success];
        //NSLog(@"123%@",success);
        
        NSMutableArray * infoArr = [NSMutableArray array];
        NSMutableArray * typeArr = [NSMutableArray array];
        
        for (NSDictionary * infoDic in hoteM.menu_info) {
            hoteModel_menu_info * hInfo = [[hoteModel_menu_info alloc]init];
            [hInfo setValuesForKeysWithDictionary:infoDic];
            
            [infoArr addObject:hInfo];
        }
        
        for (NSDictionary * typeDic in hoteM.type) {
            hoteModel_type * typeModel = [[hoteModel_type alloc]init];
            [typeModel setValuesForKeysWithDictionary:typeDic];
            [typeArr addObject:typeModel];
            
        }
#pragma mark -- 二维数组
        NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:typeArr.count];
        for (int i = 0; i < typeArr.count; i ++) {
            
            NSMutableArray *arr = [NSMutableArray array];
            hoteModel_type * typeModel = typeArr[i];
            
            
            for (NSDictionary * dic  in  hoteM.menu_info) {
                hoteModel_menu_info * hInfo = [[hoteModel_menu_info alloc]init];
                [hInfo setValuesForKeysWithDictionary:dic];
                
                if ([hInfo.foot_type isEqualToString:typeModel.foot_type]) {
                    
                    [arr addObject:hInfo];
                    
                }
            }
            
            [tmpArray addObject:arr];
        }
        successData(infoArr,typeArr,tmpArray);
        
    } Failure:^(id failure) {
        
        
    }];
}

//外卖
+(void)GetWithRequestTakeOut:(SuccessHoteData)successTakeOut dicStr:(NSDictionary *)dicStr failure:(FailureBlock)failureData
{
    [[NetworkRequest shareInstance]POST:@"http://www.kdiana.com/index.php/Before/Orders/menu_out" parameters:dicStr Success:^(id success) {
       
        //NSLog(@"321%@",success);
        hoteModel * hote = [[hoteModel alloc]init];
        [hote setValuesForKeysWithDictionary:success];
        
        NSMutableArray * infoArr = [NSMutableArray array];
        NSMutableArray * typeArr = [NSMutableArray array];
        
        for (NSDictionary * infoDic in hote.menu_info) {
            hoteModel_menu_info * hInfo = [[hoteModel_menu_info alloc]init];
            [hInfo setValuesForKeysWithDictionary:infoDic];
           
            [infoArr addObject:hInfo];
        }
        
        for (NSDictionary * typeDic in hote.type) {
            hoteModel_type * typeModel = [[hoteModel_type alloc]init];
            [typeModel setValuesForKeysWithDictionary:typeDic];
            
            [typeArr addObject:typeModel];
            
        }
        
#pragma mark -- 二维数组
        NSMutableArray * tmpArr = [NSMutableArray arrayWithCapacity:typeArr.count];
        for (int i= 0; i< typeArr.count; i++) {
            NSMutableArray * arr = [NSMutableArray array];
            hoteModel_type * hT = typeArr[i];
            
            for (NSDictionary * dic  in  hote.menu_info) {
                
                hoteModel_menu_info * hInfo = [[hoteModel_menu_info alloc]init];
                [hInfo setValuesForKeysWithDictionary:dic];
                
                if([hInfo.foot_type isEqualToString:hT.foot_type])
                {
                    [arr addObject:hInfo];
                }
            }
            [tmpArr addObject:arr];
        }
        
        successTakeOut(typeArr,infoArr,tmpArr);
        
    } Failure:nil];
}
@end
