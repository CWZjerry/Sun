//
//  OrderSubMitViewController.m
//  点吧
//
//  Created by Pro on 2017/1/4.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "OrderSubMitViewController.h"
#import "HeadTableViewCell.h"
#import "DetailsMessage.h"
#import "VegeTableViewCell.h"
#import "CostTableViewCell.h"
#import "RemarsTableViewCell.h"
#import "DetailsView.h"
#import "PayTableViewCell.h"
#import "BottomView.h"
#import <UIView+SDAutoLayout.h>
#import "PayViewController.h"
@interface OrderSubMitViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BottomView *bottomView;
@end

@implementation OrderSubMitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.view insertSubview:self.bottomView aboveSubview:self.tableView];
   }
-(BottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 49 , [UIScreen mainScreen].bounds.size.width, 49)];
        [_bottomView.SubMit addTarget:self action:@selector(SubMitClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomView;
}
-(void)SubMitClick:(UIButton *)button
{
    PayViewController *pay =[[PayViewController alloc]init];
    [self.navigationController pushViewController:pay animated:YES];
    
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 6) {
        DetailsView *view =[[DetailsView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        view.details.text = @"支付方式";
        return view;
    }
    else
    {
        return [[UIView alloc]init];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        return 10;
    }
    else{
    return 0.001;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==3||section==4) {
        return 0.001;
    }
    else if (section == 6)
    {
        return 37;
    }
    else{
    return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2||indexPath.section == 6) {
        return 42;
    }
    else if (indexPath.section == 5)
    {
        return 67;
    }
    return 37;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        return 4;
    }
    else if (section == 4||section == 6)
    {
        return 2;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HeadTableViewCell *cell = [[HeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        return cell;
    }
    else if (indexPath.section == 1)
    {
        HeadTableViewCell *cell = [[HeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.name.text = @"送达时间";
        cell.message.text = @"请选择";
        return cell;
    }
    else if (indexPath.section == 2)
    {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
            DetailsMessage *message = [[DetailsMessage alloc]init];
            [cell.contentView addSubview:message];
             return cell;
    }
    else if(indexPath.section == 3)
    {
        VegeTableViewCell *cell =[[VegeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        return cell;
    }
    else if (indexPath.section == 4)
    {
        CostTableViewCell *cell = [[CostTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        if (indexPath.row == 1) {
            cell.freight.text = @"优惠卷";
            cell.money.textColor = [GVColor hexStringToColor:@"#ff1e00"];
        }
        return cell;
    }
    else if (indexPath.section == 5)
    {
        RemarsTableViewCell *cell =[[RemarsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        return cell;
    }
    else
    {
        PayTableViewCell *cell = [[PayTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
        return cell;
    }
    
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource= self;
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
