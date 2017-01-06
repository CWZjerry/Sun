//
//  JudgmentParam.h
//  点吧
//
//  Created by Jenny on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JudgmentParam : NSObject
/**
 手机号
 */
@property (nonatomic , copy) NSString *contact_tel;

/**
 验证码
 */
@property (nonatomic , copy) NSString *sendCode;

@end
