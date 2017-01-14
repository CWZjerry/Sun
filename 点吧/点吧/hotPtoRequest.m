//
//  hotPtoRequest.m
//  点吧
//
//  Created by Jerry on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "hotPtoRequest.h"

@implementation hotPtoRequest


+(void)getWithHotPto:(SuccessHotPto)successData failure:(FailureBlock)failureDataw
{
    [[NetworkRequest shareInstance] POST:@"http://www.kdiana.com/index.php/Before/Orders/fix_type_sel" parameters:nil Success:^(id success) {
        
        NSLog(@"%@",success);
        
    } Failure:^(id failure) {
        
        
    }];
}
@end
