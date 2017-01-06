//
//  NetworkRequest.m
//  点吧
//
//  Created by Jenny on 2016/12/30.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "NetworkRequest.h"
#import <AFNetworking/AFNetworking.h>

@implementation NetworkRequest
static NetworkRequest *request = nil;
+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[NetworkRequest alloc] init];
    });
    return request;
}
- (id)copyWithZone:(NSZone *)zone{
    return request;
}

- (void)POST:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)succ Failure:(FailureBlock)fail{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = nil;
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succ(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}
+(void)LogininforRequestWithUrl:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)success Failure:(FailureBlock)failure
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[[AFHTTPSessionManager alloc] init]initWithSessionConfiguration:configuration];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.securityPolicy setAllowInvalidCertificates:NO];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}
+(void)requestForPhoneCodeUrl:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)success Failure:(FailureBlock)failurl
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer.acceptableContentTypes =nil;
    [manager.securityPolicy setAllowInvalidCertificates:NO];
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failurl(error);
    }];
}

+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError * error))failure{
    
    // 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //AFN请求成功的时候调用block
        // 先把请求成功要做的事情，保存到这个代码块
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}

+(void)Post:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    // 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}




@end
