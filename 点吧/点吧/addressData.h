//
//  addressData.h
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelAdd.h"

@interface addressData : NSObject

//单列类
+ (instancetype)shareWSDealData;

// 打开数据库
- (BOOL)openDB;

// 创建表
- (void)createTable;

// 增加数据
- (void)addData:(ModelAdd *)book;

// 删除数据
- (void)deleteData:(NSInteger)ID;

// 修改数据
- (void)updateData:(ModelAdd *)book withAnotherData:(ModelAdd *)another;

// 查找数据
- (NSMutableArray *)selectData;

// 关闭数据
- (void)closeDB;


@end
