//
//  PayViewController.m
//  点吧
//
//  Created by Pro on 2017/1/5.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "PayViewController.h"
#import "PayTimeTableViewCell.h"
#import "CostTableViewCell.h"
#import "PayTableViewCell.h"
#import "DetailsView.h"
#import "AppDelegate.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Pay.h"

#define CREAT_ORDER_RETURN @"http://www.kdiana.com/index.php/Before/Orders/order_return"
#define ALIPAY @"http://www.kdiana.com/index.php/Before/Pay/app_pay"
@interface PayViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *bottomBtn;
@property(nonatomic,copy)  NSString * timer;
@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)UILabel *tmplable;
@property(nonatomic,strong)Pay *pay;
@property(nonatomic,strong)NSMutableArray *menu;
@property(nonatomic,strong)NSTimer *datetimer;
@end

@implementation PayViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    [self.navigationController setNavigationBarHidden:NO];
}
static NSTimer *ttimer;
static int  titt;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.datetimer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timersd:) userInfo:nil repeats:YES];
    self.navigationController.navigationBar.translucent = YES;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomBtn];
    _bottomBtn.sd_layout
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .widthIs([UIScreen mainScreen].bounds.size.width)
    .heightIs(49);
    [self.bottomBtn addTarget:self action:@selector(payBtn) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)loadData
{
    NSString *str = CREAT_ORDER_RETURN;
    NSDictionary *dic = @{@"order_id":[NSString stringWithFormat:@"%ld",self.orderSubMit.order_id]};
    [NetworkRequest Post:str parameters:dic success:^(id responseObject) {
        self.pay = [Pay yy_modelWithJSON:responseObject];
        NSString *str = [self.pay.out_time substringToIndex:3];
        titt = [str intValue];
        for (NSDictionary *dic in self.pay.menu_list) {
            MeMuList *menu = [MeMuList yy_modelWithJSON:dic];
            [self.menu addObject:menu];
        }
    } failure:^(NSError *error) {
        
    }];

}
-(void)payBtn
{
    NSDictionary *dic = @{@"order_no":self.pay.order_no};
    [[AFNManager sharedManager]requestType:POST URL:ALIPAY withparameters:dic success:^(id data) {
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        [[AlipaySDK defaultService]payOrder:str fromScheme:@"WeiDongDian" callback:^(NSDictionary *resultDic) {
            NSLog(@"%@",resultDic);
        }];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)timersd:(NSTimer *)timer
{
    titt--;
    NSString *str_minute = [NSString stringWithFormat:@"%02d",(titt%3600)/60];
    NSString *str_second = [NSString stringWithFormat:@"%02d",titt%60];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    self.timer = format_time;
    self.tmplable.text = [NSString stringWithFormat:@"%@",format_time];
    [self.tableView reloadData];
    if(titt==0){
        [timer invalidate];
    }
}
#pragma mark - UITableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 5) {
        DetailsView *view =[[DetailsView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        view.details.text = @"支付方式";
        return view;
    }
    return [[UIView alloc]init];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 55;
    }
    else if(indexPath.section == 1||indexPath.section == 4||indexPath.section == 5)
    {
        return 36;
    }
    else if (indexPath.section == 2|| indexPath.section == 3)
    {
        if (indexPath.row == 0) {
            return 36;
        }
        else{
             return 30;
        }
       
    }
    else
    {
        return 30;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 0.1;
            break;
        
        case 3:
            return 0.1;
            break;
        case 4:
            return 0.1;
            break;
        case 5:
            return 30;
            break;
        default:
            return 10;
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 4) {
        return 10;
    }
    return 0.1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2 )
    {
        return 6;
    }
    else if (section == 3)
    {
        return self.pay.menu_list.count+1;
        
    }
    else if (section == 4 || section == 5)
    {
        return 2;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CostTableViewCell *cell = [[CostTableViewCell alloc]init];
    if (indexPath.section == 0) {
        PayTimeTableViewCell *cell =[[PayTimeTableViewCell alloc]init];
        cell.time.text = self.timer;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        
        cell.money.textAlignment = NSTextAlignmentRight;
        cell.money.font =[UIFont systemFontOfSize:14];
        cell.freight.textColor = [GVColor hexStringToColor:@"#333333"];
        cell.freight.font = [UIFont systemFontOfSize:15];
        cell.freight.text = @"饭店名称";
        cell.money.text = self.pay.store_name;
        return cell;
    }
    else if (indexPath.section == 2 )
    {
        if (indexPath.row == 0) {
            cell.money.font =[UIFont systemFontOfSize:12];
            cell.freight.textColor = [GVColor hexStringToColor:@"#333333"];
            cell.freight.font = [UIFont systemFontOfSize:15];
            cell.freight.text = @"订单详情";
            cell.money.text = [NSString stringWithFormat:@"订单号：%ld",self.orderSubMit.order_no];
        }
        else if(indexPath.row == 1)
        {
            cell.freight.text = @"订单类型";
            cell.money.text = self.pay.type_name;
        }
        else if (indexPath.row == 2)
        {
            cell.freight.text = @"点餐模式";
            cell.money.text = self.pay.rel_mode;
        }
        else if (indexPath.row == 3)
        {
            cell.freight.text = @"就餐人数";
            cell.money.text = self.pay.people_num;
        }
        else if (indexPath.row == 4)
        {
            cell.freight.text = @"桌号";
            cell.money.text = self.pay.table_num;
        }
        else
        {
            cell.freight.text = @"到店时间";
            cell.money.text = self.pay.order_time;
        }
        return cell;
    }
    else if (indexPath.section == 3)
    {
        if (indexPath.row == 0) {
            cell.money.font =[UIFont systemFontOfSize:12];
            cell.freight.textColor = [GVColor hexStringToColor:@"#333333"];
            cell.freight.font = [UIFont systemFontOfSize:15];
            cell.freight.text = @"订单菜品";
            cell.money.text = @"^";
        }
        else
        {
            MeMuList *menu = self.menu[indexPath.row -1];
            cell.freight.text = menu.menu_name;
            cell.money.text = menu.count_price;
            
//            cell.freight.text =
        }
        return cell;
    }
    else if (indexPath.section == 4)
    {
        if (indexPath.row == 0) {
            cell.money.font =[UIFont systemFontOfSize:12];
            cell.freight.textColor = [GVColor hexStringToColor:@"#666666"];
            cell.freight.font = [UIFont systemFontOfSize:13];
            cell.freight.text = @"使用优惠卷";
            cell.money.text = @"满100减50";
            return cell;
        }
        else{
            cell.money.font =[UIFont systemFontOfSize:17];
            cell.freight.textColor = [GVColor hexStringToColor:@"#333333"];
            cell.freight.font = [UIFont systemFontOfSize:16];
            cell.freight.text = @"支付金额";
            cell.money.text = [NSString stringWithFormat:@"¥ %@",self.pay.order_price];
            cell.money.textColor = [GVColor hexStringToColor:@"#e4562f"];
            return cell;
        }
        
    }
    else if (indexPath.section == 5)
    {
        PayTableViewCell *cell = [[PayTableViewCell alloc]init];
        return cell;
    }
    
    return [[UITableViewCell alloc]init];
    
}
-(UIButton *)bottomBtn
{
    if (!_bottomBtn) {
        _bottomBtn = [[UIButton alloc]init];
        [_bottomBtn setTitle:@"确认支付" forState:UIControlStateNormal];
        _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        _bottomBtn.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
        [_bottomBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    }
    return _bottomBtn;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49) style:UITableViewStyleGrouped];
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 60, 0);
        _tableView.delegate = self;
        _tableView.dataSource= self;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _tableView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.datetimer invalidate];
}
-(NSMutableArray *)menu
{
    if (_menu == nil) {
        _menu = [NSMutableArray array];
    }
    return _menu;
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
