//
//  User.m
//  点吧
//
//  Created by Jenny on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "User.h"






#define nicKEY @"nickname"
#define youKEY @"yourname"
#define headKEY @"image"


@implementation User
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.image forKey:@"image"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.phoneNum forKey:@"phoneNum"];
    [aCoder encodeObject:self.password forKey:@"password"];
    
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ([self init]) {
        //解压过程
        self.image=[aDecoder decodeObjectForKey:@"image"];
        self.name= [aDecoder decodeObjectForKey:@"name"];
        self.birthday=[aDecoder decodeObjectForKey:@"birthday"];
        self.phoneNum=[aDecoder decodeObjectForKey:@"phoneNum"];
        self.password=[aDecoder decodeObjectForKey:@"password"];
        
    }
    return self;
    
    
}
singleton_implementation(User)


-(NSUserDefaults*)saveUserInofFromSanbox{
    self.defts = [NSUserDefaults standardUserDefaults];
//    [defaults setValue:self.nickName forKey:nicKEY];
//    [defaults setValue:self.yourName forKey:youKEY];
    [self.defts setObject:@"pomelo" forKey:@"nickname"];
//    [self.defts synchronize];
    return self.defts;
}

- (NSString*)loadUserInofFromSanbox:(NSUserDefaults*)defaults{
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    self.nickName = [defaults objectForKey:nicKEY];
//    self.yourName = [defaults objectForKey:youKEY];
//    @"yuioiooiuuioou" = [defaults objectForKey:@"birthday"];
    NSLog(@"%@",[defaults objectForKey:@"nickname"]);
    NSString *str = [defaults objectForKey:@"nickname"];
    return str;
}



@end
