//
//  ReturnViewController.m
//  点吧
//
//  Created by Jenny on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectResultData : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *user_id;
@property (nonatomic, strong) NSString *takeout_address;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *tel;
@property (nonatomic, strong) NSString *state;


+ (instancetype)feedDictaionary:(NSDictionary*)dicantionary;

- (instancetype)initDictaionary:(NSDictionary*)dicantionary;;
@end
