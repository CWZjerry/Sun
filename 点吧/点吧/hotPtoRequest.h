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

typedef void (^SuccessHotPto)(id Value);
@interface hotPtoRequest : NSObject


+(void)getWithHotPto:(SuccessHotPto)successData failure:(FailureBlock)failureData;


@end
