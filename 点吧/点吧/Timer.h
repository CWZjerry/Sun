//
//  Timer.h
//  点吧
//
//  Created by Pro on 2017/1/6.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject
@property(nonatomic,copy)NSString *timer;
+(instancetype)sharedTimer;
-(void)time;
@end
