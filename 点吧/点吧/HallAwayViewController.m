//
//  HallAwayViewController.m
//  点吧
//
//  Created by Pro on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "HallAwayViewController.h"
#import "HeadTableViewCell.h"
#import "SexView.h"
#import "RemarsTableViewCell.h"
#import "DetailsMessage.h"
#import "VegeTableViewCell.h"
#import "MoneyView.h"
#import "BottomView.h"
#import "PayViewController.h"
@interface HallAwayViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BottomView *bottomView;
@property(nonatomic,copy) NSString * type;
@end

@implementation HallAwayViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.view insertSubview:self.bottomView aboveSubview:self.tableView];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 4) {
        DetailsMessage *message = [[DetailsMessage alloc]init];
        return message;
    }
    else
    {
        return nil;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 4) {
        MoneyView *money = [[MoneyView alloc]init];
        money.amount.text = @"共计";
        money.amount.font = [UIFont systemFontOfSize:11];
        money.amount.textColor = [GVColor hexStringToColor:@"#555555"];
        money.money.text = @"¥1060";
        money.money.font = [UIFont systemFontOfSize:15];
        money.money.textColor = [GVColor hexStringToColor:@"#555555"];
        return money;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self TypeClick];
    }
    else if (indexPath.section == 5)
    {
        
    }
}
#pragma mark - 使用优惠卷
-(void)preferential
{
    
}
#pragma mark - 选择点餐模式
-(void)TypeClick
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"店内" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.type = @"店内";
        [self.tableView reloadData];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"店外" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.type = @"店外";
        [self.tableView reloadData];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.type = nil;
        [self.tableView reloadData];
    }];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController addAction:action3];
    [self presentViewController:alertController animated:NO completion:^{
        
    }];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 3) {
        return 57;
    }
    else
    {
        return 37;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 10;
    }
    else if (section == 4)
    {
        return 40;
    }
    else
    {
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 4) {
        return 40;
    }
    return 10;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 37;
//}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1||section == 2)
    {
        return 2;
    }
    else if (section == 3)
    {
        return 1;
    }
    else if (section == 4)
    {
        return 4;
    }
    else
    {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    if (indexPath.section == 0) {
        HeadTableViewCell *HeadCell = [[HeadTableViewCell alloc]init];
        
        HeadCell.contentView.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 37.5);
        
        HeadCell.name.text = @"点餐模式";
        if (self.type == nil) {
            HeadCell.message.text = @"请选择";
        }
        else
        {
            HeadCell.message.text = self.type;
            HeadCell.message.textColor = [GVColor hexStringToColor:@"#333333"];
            HeadCell.arrowHead.hidden = YES;
        }
//        HeadCell.bounds = cell.bounds;
        [cell.contentView  addSubview:HeadCell.contentView];
    }
    else if (indexPath.section == 1)
    {
        HeadTableViewCell *HeadCell = [[HeadTableViewCell alloc]init];
        HeadCell.contentView.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 37.5);
        if (indexPath.row == 0) {
            HeadCell.name.text = @"人数";
        }
        else
        {
            HeadCell.name.text = @"时间";
        }
         HeadCell.message.text = @"请选择";
        [cell.contentView  addSubview:HeadCell.contentView];
    }
    else if (indexPath.section == 2)
    {
        SexView *sexView= [[SexView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 37)];
        if (indexPath.row == 0) {
            sexView.name.text =@"姓名";
            
        }
        else if (indexPath.row == 1)
        {
            sexView.telephone.placeholder = @"请输入您的手机号";
            sexView.telephone.keyboardType = UIKeyboardTypeNumberPad;
            [sexView.ladyBtn removeFromSuperview];
            [sexView.lady removeFromSuperview];
            [sexView.manBtn removeFromSuperview];
            [sexView.man removeFromSuperview];
        }
//        sexView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 37);
        [cell.contentView addSubview:sexView];
    }
    else if (indexPath.section == 3)
    {
        RemarsTableViewCell *remars = [[RemarsTableViewCell alloc]init];
        remars.remarks.text = @"备注";
        [cell.contentView addSubview:remars.contentView];
    }
    else if (indexPath.section == 4)
    {
        VegeTableViewCell *vegatab = [[VegeTableViewCell alloc]init];
        vegatab.contentView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 37);
        
        [cell.contentView addSubview:vegatab.contentView];
    }
    else if (indexPath.section == 5)
    {
        HeadTableViewCell *HeadCell = [[HeadTableViewCell alloc]init];
        
        HeadCell.contentView.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 37.5);
        HeadCell.name.text = @"使用优惠卷";
        HeadCell.message.text = @"满100减50";
        //        HeadCell.bounds = cell.bounds;
        [cell.contentView  addSubview:HeadCell.contentView];
    }
    return cell;
}
-(void)SubMitClick:(UIButton *)button
{
    PayViewController *pay =[[PayViewController alloc]init];
    [self.navigationController pushViewController:pay animated:YES];
    
    
}
-(BottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 49 , [UIScreen mainScreen].bounds.size.width, 49)];
        [_bottomView.SubMit addTarget:self action:@selector(SubMitClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomView;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
