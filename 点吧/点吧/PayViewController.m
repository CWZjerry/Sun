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
#import "Timer.h"
#import <AlipaySDK/AlipaySDK.h>
#define CREAT_ORDER_RETURN @"http://www.kdiana.com/index.php/Before/Orders/order_return"
#define ALIPAY @"http://www.kdiana.com/index.php/Before/Pay/app_pay"
@interface PayViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *bottomBtn;
@property(nonatomic,copy)  NSString * timer;
@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)UILabel *tmplable;
@end

@implementation PayViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    [self.navigationController setNavigationBarHidden:NO];
}
static NSTimer *ttimer;
static int  titt = 900;
- (void)viewDidLoad {
    
    
    NSString *str = CREAT_ORDER_RETURN;
    NSDictionary *dic = @{@"order_id":@"1"};
    
    [[AFNManager sharedManager]requestType:POST URL:str withparameters:dic success:^(id data) {
        NSLog(@"data == %@",data);
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = YES;
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.tmplable = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 100)];
    self.tmplable.backgroundColor = [UIColor grayColor];
    self.tmplable.textColor = [UIColor redColor];
    [self.view addSubview:self.tmplable];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomBtn];
    
    _bottomBtn.sd_layout
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .widthIs([UIScreen mainScreen].bounds.size.width)
    .heightIs(49);
    [self.bottomBtn addTarget:self action:@selector(payBtn) forControlEvents:UIControlEventTouchUpInside];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    
//    static dispatch_once_t onceToken;
   // dispatch_once(&onceToken, ^{
     
 //   });
//    AppDelegate *delagete = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    
//      delagete.ttimer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timersd) userInfo:nil repeats:YES];
//    NSString *str_minute = [NSString stringWithFormat:@"%02d",(titt%3600)/60];
//    
//    NSString *str_second = [NSString stringWithFormat:@"%02d",titt%60];
//    
//    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
//    self.tmplable.text = format_time;
//    _lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    _lable.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.lable];
//    [self.view insertSubview:view aboveSubview:self.tableView];
    [[Timer sharedTimer] time];
    self.timer = [Timer sharedTimer].timer;
    [self.tableView reloadData];
}
-(void)payBtn
{
    NSDictionary *dic = @{@"order_no":@"20170106185215100001798641"};
    [[AFNManager sharedManager]requestType:POST URL:ALIPAY withparameters:dic success:^(id data) {
        
        
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        [[AlipaySDK defaultService]payOrder:str fromScheme:@"WeiDongDian" callback:^(NSDictionary *resultDic) {
            NSLog(@"%@",dic);
        }];
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
-(void)timersd
{
    titt--;

//        NSLog(@"%@",timer);
    //倒计时-1
    
    //重新计算 时/分/秒
    //  NSString *str_hour = [NSString stringWithFormat:@"%02ld",secondsCountDown/3600];
    
    NSString *str_minute = [NSString stringWithFormat:@"%02d",(titt%3600)/60];
    
    NSString *str_second = [NSString stringWithFormat:@"%02d",titt%60];
    
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    //修改倒计时标签及显示内容
    self.timer = format_time;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSIndexSet *index = [[NSIndexSet alloc]initWithIndex:0];
//        [self.tableView reloadSections:index withRowAnimation:UITableViewRowAnimationAutomatic];
//    });

    self.tmplable.text = [NSString stringWithFormat:@"%@",format_time];
    [self.tableView reloadData];
    //当倒计时到0时做需要的操作，销毁
    if(titt==0){
        
//        [timer invalidate];
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
    if (section == 2 || section == 3)
    {
        return 6;
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
//        NSString *sss = [Timer sharedTimer].timer;
//        [self.tableView reloadData];
//        NSLog(@"%@",sss);
//        NSLog(@"%@",self.timer);
        cell.time.text = self.timer;
        
//        NSLog(@"cell.time.text === %@",cell.time.text);
        
        return cell;
    }
    else if (indexPath.section == 1)
    {
        
        cell.money.textAlignment = NSTextAlignmentRight;
        cell.money.font =[UIFont systemFontOfSize:14];
        cell.freight.textColor = [GVColor hexStringToColor:@"#333333"];
        cell.freight.font = [UIFont systemFontOfSize:15];
        cell.freight.text = @"饭店名称";
        cell.money.text = @"微动点西三旗大饭店";
        return cell;
    }
    else if (indexPath.section == 2 )
    {
        if (indexPath.row == 0) {
            cell.money.font =[UIFont systemFontOfSize:12];
            cell.freight.textColor = [GVColor hexStringToColor:@"#333333"];
            cell.freight.font = [UIFont systemFontOfSize:15];
            cell.freight.text = @"订单详情";
            cell.money.text = @"订单号：12345678911";
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
            cell.money.text = @"¥ 600";
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
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 164, ScreenWidth, ScreenHeight-164) style:UITableViewStyleGrouped];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 60, 0);
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
