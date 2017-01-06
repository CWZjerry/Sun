//
//  Timer.m
//  点吧
//
//  Created by Pro on 2017/1/6.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "Timer.h"

@implementation Timer
static Timer *timer;
static NSTimer *ttimer;
static int  titt = 900;
+(instancetype)sharedTimer
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timer = [[Timer alloc]init];
    });
    
    return timer;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (!timer) {
        timer = [super allocWithZone:zone];
    }
    return timer;
}
-(void)time
{
    if (ttimer == nil) {
        ttimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeClick:) userInfo:nil repeats:YES];
    }
   
}
-(void)timeClick:(NSTimer *)timer
{
    
    titt--;
    
    //        NSLog(@"%@",timer);
    //倒计时-1
    
//      NSString *str_hour = [NSString stringWithFormat:@"%02ld",secondsCountDown/3600];
//        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time) userInfo:nil repeats:YES];    };
    
        NSString *str_minute = [NSString stringWithFormat:@"%02d",(titt%3600)/60];
    
        NSString *str_second = [NSString stringWithFormat:@"%02d",titt%60];
    
        NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    self.timer = format_time;
//    NSLog(@"%@",self.timer);
    //    //修改倒计时标签及显示内容
    //
    //    //    dispatch_async(dispatch_get_main_queue(), ^{
    //    //        NSIndexSet *index = [[NSIndexSet alloc]initWithIndex:0];
    //    //        [self.tableView reloadSections:index withRowAnimation:UITableViewRowAnimationAutomatic];
    //    //    });
    //
    //
    //    //当倒计时到0时做需要的操作，销毁
    //    if(titt==0){
    //        
    //        [timer invalidate];
    //    }
}
@end
