//
//  PhoneNumber.m
//  点吧
//
//  Created by Jenny on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "PhoneNumber.h"
#import "PhoneParam.h"
#import "NetworkRequest.h"
#import "MJExtension.h"
#import "phoneRequest.h"
#import "PhoneParam.h"
@implementation PhoneNumber
+(void)phoneNumberIsExistsWithPgoneNumber:(NSString *)phoneNumber success:(void (^)(phoneRequest *))success failure:(void (^)(NSError *))failure{
    

    PhoneParam *param = [[PhoneParam alloc] init];
    param.contact_tel = phoneNumber;
    
    [NetworkRequest Post:@"http://www.kdiana.com/index.php/home/seller/checkContactel" parameters:param.mj_keyValues success:^(id responseObject) {
        
        phoneRequest *result = [[phoneRequest alloc] init];
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
