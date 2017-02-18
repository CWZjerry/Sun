//
//  hotPtoRequest.h
//  点吧
//
//  Created by Jerry on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkRequest.h"
#import "hotPot.h"

//typedef void (^SuccessHotPto)(id Value);
typedef void (^SuccessHotPtoData)(id left, id right, id allMarr);
@interface hotPtoRequest : NSObject

//
//+(void)getWithHotPto:(SuccessHotPto)successData failure:(FailureBlock)failureData;
//
//+(void)getWithHotLeft:(SuccessHotPto)successData failure:(FailureBlock)failureData;


+(void)getWithHotPtoLeftAndRight:(SuccessHotPtoData)succesData failure:(FailureBlock)failureData;
@end
