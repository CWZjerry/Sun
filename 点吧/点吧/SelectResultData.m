//
//  ReturnViewController.m
//  点吧
//
//  Created by Jenny on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "SelectResultData.h"

@implementation SelectResultData

+ (instancetype)feedDictaionary:(NSDictionary *)dicantionary{
    return [[self alloc] initWithDictionary:dicantionary];
}

- (instancetype)initDictaionary:(NSDictionary *)dicantionary{
    self = [super init];
    if (self ) {
        self.id=[dicantionary objectForKey:@"id"];
        self.user_id=[dicantionary objectForKey:@"user_id"];
        self.takeout_address=[dicantionary objectForKey:@"takeout_address"];
        self.sex=[dicantionary objectForKey:@"sex"];
        self.tel=[dicantionary objectForKey:@"tel"];
        self.state=[dicantionary objectForKey:@"state"];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"");
}


@end

