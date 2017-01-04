//
//  NetworkRequest.h
//  点吧
//
//  Created by Jenny on 2016/12/30.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id success);
typedef void(^FailureBlock)(id failure);

@interface NetworkRequest : NSObject<NSCopying>

+ (instancetype)shareInstance;

//网络请求
- (void)POST:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)succ Failure:(FailureBlock)fail;
//登录网络请求
+(void)LogininforRequestWithUrl:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)success Failure:(FailureBlock)failure;


//验证码
+(void)requestForPhoneCodeUrl:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)succ Failure:(FailureBlock)fail;

/**
 发送GET请求
 
 @param URLString 请求的基本的URL
 @param parameters 请求的参数
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError * error))failure;

/**
 发送POST请求
 
 @param URLString 请求的基本的URL
 @param parameters 请求的参数
 @param success 请求成功的回调
 @param failure 请求失败的回调
 */
+ (void)Post:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError * error))failure;


@end
