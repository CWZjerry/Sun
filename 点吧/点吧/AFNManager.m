//
//  AFNManager.m
//  点吧
//
//  Created by Pro on 2016/12/27.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "AFNManager.h"

@implementation AFNManager

static AFNManager * manager = nil;

+(instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFNManager alloc]init];
        
        
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        //增加这几行代码；
        AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
        [securityPolicy setAllowInvalidCertificates:YES];
        
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        
//        [html] view plain copy
//        print?
        
        //这里进行设置；
        [manager setSecurityPolicy:securityPolicy];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        

    });
    return manager;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (manager == nil) {
        manager = [super allocWithZone:zone];
    }
    return manager;
}
-(void)requestType:(REQUEST *)type URL:(NSString*)url withparameters:(NSDictionary *)parameters success:(HttpSuccess )success failure:(HttpFailure)failure
{
    if (type == GET) {
        [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
    else
    {
        [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
    
    
    
}
@end
