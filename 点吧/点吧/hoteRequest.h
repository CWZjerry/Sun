//
//  hoteRequest.h
//  点吧
//
//  Created by Jerry on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "hoteModel.h"
typedef void(^SuccessHoteData)(id Value,id typeValue,id arrAll);

@interface hoteRequest : NSObject

//堂食
+(void)GetWithRequest:(SuccessHoteData)successData dicSTR:(NSDictionary *)dicStr failure:(FailureBlock)failureData;

//外卖
+(void)GetWithRequestTakeOut:(SuccessHoteData)successTakeOut dicStr:(NSDictionary *)dicStr failure:(FailureBlock)failureData;
@end
