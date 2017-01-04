//
//  LoginViewController.m
//  点吧
//
//  Created by Jenny on 2016/1/4.
//  Copyright © 2016年 OneGroup. All rights reserved.


#import <Foundation/Foundation.h>

@class SendResult;

@interface SendVerificationCode : NSObject

+(void)SendVerificationCodeWithPhoneNumber:(NSString *)phoneNumber success:(void(^)(SendResult *result))success failure:(void(^)(NSError *error))failure;

@end
