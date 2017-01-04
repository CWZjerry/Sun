//
//  JudgmentCode.m
//  点吧
//
//  Created by Jenny on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "JudgmentCode.h"
#import "JudgmentResult.h"
#import "JudgmentParam.h"
#import "MJExtension.h"
#import "NetworkRequest.h"
@implementation JudgmentCode

+(void)judgmentVerificationCodeWithPhoneNumber:(NSString *)phoneNumber andCode:(NSString *)code success:(void (^)(JudgmentResult *))success failure:(void (^)(NSError *))failure{
    
    JudgmentParam *param = [[JudgmentParam alloc] init];
    param.contact_tel = phoneNumber;
    param.sendCode = code;
    
    [NetworkRequest Post:@"http://www.kdiana.com/index.php/home/seller/checkTelCaptcha" parameters:param.mj_keyValues success:^(id responseObject) {
        
        JudgmentResult *result = [[JudgmentResult alloc] init];
        result.message = responseObject[@"message"];
        result.code = responseObject[@"code"];
        
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}
@end
