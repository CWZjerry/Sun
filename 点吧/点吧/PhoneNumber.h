//
//  PhoneNumber.h
//  点吧
//
//  Created by Jenny on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@class phoneRequest;

@interface PhoneNumber : NSObject

/**
 判断手机号是否存在
 
 @param phoneNumber 手机号
 @param success 回调成功的时候调用
 @param failure 回到失败的时候调用
 */
+(void)phoneNumberIsExistsWithPgoneNumber:(NSString *)phoneNumber success:(void(^)(phoneRequest *result))success failure:(void(^)(NSError *error))failure;

@end
