//
//  addressData.m
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "addressData.h"
#import <sqlite3.h>
sqlite3 *sqliteDB;
static addressData *dealData=nil;
//创建静态对象为空
static addressData *data=nil;
@implementation addressData
//单列类
+ (instancetype)shareWSDealData
{
    if (dealData == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dealData = [[addressData alloc]init];
        });
    }
    return dealData;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (!dealData) {
        dealData = [super allocWithZone:zone];
    }
    return dealData;
}
#pragma mark - 打开数据库
- (BOOL)openDB
{
    // 获取doc路径
    NSString *str = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    // 获取数据库
    NSString *filePath = [str stringByAppendingPathComponent:@"ws.db"];
    NSLog(@"11%@",filePath);
    
    // 打开数据库（没有则创建）数据库连接指针&sqliteDB
    int result = sqlite3_open([filePath UTF8String], &sqliteDB);
    
    // 判断创建数据库是否成功
    if (result == SQLITE_OK) {
        // 打开数据库成功
        NSLog(@"数据库代开成功");
        
        
        return YES;
    }
    else
    {
        // 打开失败
        NSLog(@"数据库打开失败");
        return NO;
    }
    return NO;
    
}
// 创建表
- (void)createTable
{
    if ([self openDB] == YES) {
        const char *sql = "create table bookList2(id integer primary key,name text, author text)";
        // 创建预编译指针
        sqlite3_stmt *stmt;
        // 将sql语句编译到预编译指针中(-1)执行整条sql语句
        sqlite3_prepare_v2(sqliteDB, sql, -1, &stmt, nil);
        // 执行预编译指针
        int result = sqlite3_step(stmt);
        if (result == SQLITE_DONE) {
            NSLog(@"创建表成功");
        }
        
        // 销毁欲编译指针
        sqlite3_finalize(stmt);
    }
}
// 增加数据
- (void)addData:(ModelAdd *)book
{
    // 创建sql语句
    const char *sql = "insert into bookList2 values(null,?,?)";
    // 创建预编译指针
    sqlite3_stmt *stmt;
    // 将sql语句编译到预编译指针中
    sqlite3_prepare_v2(sqliteDB, sql, -1, &stmt, nil);
    // 设置绑定符（第一个问号） 1
    sqlite3_bind_text(stmt, 1,[book.name UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 2, [book.author UTF8String], -1, SQLITE_TRANSIENT);
    
    // 执行预编译指针
    int result = sqlite3_step(stmt);
    if (result == SQLITE_DONE) {
        NSLog(@"数据添加成功");
    }
    else
    {
        NSLog(@"数据库添加失败");
    }
    
    // 销毁预编译指针
    sqlite3_finalize(stmt);
}
// 删除数据
- (void)deleteData:(NSInteger)ID
{
    // 创建sql语句
    const char *sql = "delete from bookList2 where id = ?";
    // 创建预编译指针
    sqlite3_stmt *stmt;
    // 将sql语句编译到预编译指针
    sqlite3_prepare_v2(sqliteDB, sql, -1, &stmt, nil);
    // 设置绑定符
    sqlite3_bind_int(stmt, 1, (int)ID);
    
    // 执行预编译指针
    sqlite3_step(stmt);
    // 销毁指针
    sqlite3_finalize(stmt);
}
// 修改数据
- (void)updateData:(ModelAdd *)book withAnotherData:(ModelAdd *)another
{
    // 创建sql语句
    const char *sql = "update bookList2 set name = ?,author = ?where id = ?";
    // 创建预编译指针
    sqlite3_stmt *stmt;
    // 将sql语句编译到预编译指针
    sqlite3_prepare_v2(sqliteDB, sql, -1, &stmt, nil);
    // 设置绑定符
    sqlite3_bind_text(stmt, 1, [another.name UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(stmt, 2, [another.author UTF8String], -1, SQLITE_TRANSIENT);
    //    sqlite3_bind_int64(stmt, 3, [another.bookID ], -1, SQLITE_TRANSIENT);
    sqlite3_bind_int(stmt, 3, (int)book.bookID);
    // 执行预编译指针
    sqlite3_step(stmt);
    // 销毁指针
    sqlite3_finalize(stmt);
}
#pragma mark - 获取数据
- (NSMutableArray *)selectData
{
    // 创建sql语句
    const char *sql = "select * from bookList2";
    //创建预编译指针z
    sqlite3_stmt *stmt;
    // 将sql编译到预编译指针
    sqlite3_prepare_v2(sqliteDB, sql, -1, &stmt, nil);
    // 初始化数组用于接收查找到的数据
    NSMutableArray *Marr = [NSMutableArray array];
    //查找数据
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        ModelAdd *book = [[ModelAdd alloc]init];
        // 获取每行每列查找到的数据
        book.bookID = sqlite3_column_int(stmt, 0);
        book.name = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 1)];
        book.author = [NSString stringWithUTF8String:(const char*)sqlite3_column_text(stmt, 2)];
        // 将查找到的数据存入数组
        [Marr addObject:book];
    }
    
    sqlite3_finalize(stmt);
    
    return Marr;
}
// 关闭数据
- (void)closeDB
{
    sqlite3_close(sqliteDB);
}


@end
