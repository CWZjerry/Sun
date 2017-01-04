//
//  LoginViewController.m
//  点吧
//
//  Created by Jenny on 2016/1/4.
//  Copyright © 2016年 OneGroup. All rights reserved.


#import "SendVerificationCode.h"
#import "Sendparam.h"
#import "SendResult.h"
#import "NetworkRequest.h"
#import "MJExtension.h"

@implementation SendVerificationCode

+(void)SendVerificationCodeWithPhoneNumber:(NSString *)phoneNumber success:(void (^)(SendResult *))success failure:(void (^)(NSError *))failure{
    
    // 创建模型
    Sendparam *param = [[Sendparam alloc] init];
    param.tel = phoneNumber;
    
    [NetworkRequest Post:@"http://www.kdiana.com/index.php/home/seller/sendMessage" parameters:param.mj_keyValues success:^(id responseObject) {
        
        SendResult *result = [[SendResult alloc] init];
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
