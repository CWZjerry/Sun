//
//  JudgmentCode.h
//  点吧
//
//  Created by Jenny on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JudgmentResult;

@interface JudgmentCode : NSObject

+(void)judgmentVerificationCodeWithPhoneNumber:(NSString *)phoneNumber andCode:(NSString *)code success:(void(^)(JudgmentResult *result))success failure:(void(^)(NSError *error))failure;

@end
