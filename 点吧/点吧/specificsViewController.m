//
//  specificsViewController.m
//  点吧
//
//  Created by Jerry on 2017/1/6.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "specificsViewController.h"
#import "specificsCell.h"
#import "specificsCell1.h"
#import "specificsCell2.h"
#import "specificsCell3.h"

@interface specificsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * fineTableView;
@property(nonatomic,strong) UIImageView * fineImage;
@end

@implementation specificsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.fineTableView];
}
#pragma mark -- 详情tableViewDataSoure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return 115;
    }
    else if (indexPath.row == 1)
    {
        return 120;
    }
    else if (indexPath.row == 2)
    {
        return 115;
    }
    else
    {
        return 60;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        static NSString * cellStr = @"specificsCell";
        specificsCell * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        return cell;
    }
    else if (indexPath.row == 1)
    {
        static NSString * cellStr = @"specificsCell1";
        specificsCell1 * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        return cell;
    }
    else if (indexPath.row == 2)
    {
        static NSString * cellStr = @"specificsCell2";
        specificsCell2 * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        return cell;
    }
    else
    {
        static NSString * cellStr = @"specificsCell3";
        specificsCell3 * cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        return cell;
    }
    
}

#pragma mark -- 详情tableViewheader
-(UIView *)fineHeader
{
    UIView * fineHeader = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds+20, 308)];
    fineHeader.backgroundColor = [UIColor redColor];
    
    //商家背景头像
    _fineImage = [[UIImageView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 308)];
    _fineImage.userInteractionEnabled = YES;
    _fineImage.image = [UIImage imageNamed:@"img1"];
    [fineHeader addSubview:self.fineImage];
    
    //返回按钮
    UIButton *fineBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    fineBtn.frame=CGRectMake(12, 28, 28, 28);
    [fineBtn setImage:[UIImage imageNamed:@"the-arrow-"] forState:UIControlStateNormal];
     [fineBtn addTarget:self action:@selector(senderCome) forControlEvents:UIControlEventTouchUpInside];
    [_fineImage addSubview:fineBtn];
    
    
    return fineHeader;
}
//返回按钮事件
-(void)senderCome
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -- 初始化详情tableView
-(UITableView *)fineTableView
{
    if(_fineTableView == nil)
    {
        _fineTableView = [[UITableView alloc]initWithFrame:FrameBounds style:UITableViewStylePlain];
        _fineTableView.delegate = self;
        _fineTableView.dataSource =self;
        _fineTableView.tableHeaderView = [self fineHeader];
        
        [_fineTableView registerNib:[UINib nibWithNibName:NSStringFromClass([specificsCell class]) bundle:nil] forCellReuseIdentifier:@"specificsCell"];
        
        [_fineTableView registerNib:[UINib nibWithNibName:NSStringFromClass([specificsCell1 class]) bundle:nil] forCellReuseIdentifier:@"specificsCell1"];
        
        [_fineTableView registerNib:[UINib nibWithNibName:NSStringFromClass([specificsCell2 class]) bundle:nil] forCellReuseIdentifier:@"specificsCell2"];
        
        [_fineTableView registerNib:[UINib nibWithNibName:NSStringFromClass([specificsCell3 class]) bundle:nil] forCellReuseIdentifier:@"specificsCell3"];
    }
    return _fineTableView;
}
@end
