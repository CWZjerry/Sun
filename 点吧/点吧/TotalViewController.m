//
//  TotalViewController.m
//  点吧
//
//  Created by Pro on 2016/12/27.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "TotalViewController.h"
#import "TotalTableViewCell.h"
#import "DetailsViewController.h"
#import "Order.h"
#import "AFNManager.h"
#import <YYModel.h>
#import <UIImageView+WebCache.h>
@interface TotalViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray * messageArr;
@end

@implementation TotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-154) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self loadData];
}
//模型数组
-(NSMutableArray *)messageArr
{
    if (_messageArr == nil) {
        _messageArr = [NSMutableArray array];
    }
    return _messageArr;
}
-(void)loadData
{
    NSDictionary *dic = @{@"user_id":@"10001",
                          @"type":@"",
                          @"page":@"1"
                          };
    NSString * str = @"http://www.kdiana.com/index.php/Before/MyOrder/orderall";
    [NetworkRequest Post:str parameters:dic success:^(id responseObject) {
        NSArray *arr =[responseObject objectForKey:@"data"];
        //        NSLog(@"%@",arr);
        NSLog(@"%@",arr);
        for (NSDictionary *dic  in arr) {
            Order *order = [Order yy_modelWithJSON:dic];
            [self.messageArr addObject:order];
        }
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    
    
//    [[AFNManager sharedManager]requestType:POST URL:str withparameters:dic success:^(id data) {
//        //        NSLog(@"%@",data);
//        NSArray *arr =[data objectForKey:@"data"];
////        NSLog(@"%@",arr);
//        NSLog(@"%@",arr);
//        for (NSDictionary *dic  in arr) {
//            Order *order = [Order yy_modelWithJSON:dic];
//            [self.messageArr addObject:order];
//        }
//        [self.tableView reloadData];
//        
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//    }];
//
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageArr.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController * details = [[DetailsViewController alloc]init];
    [self.navigationController pushViewController:details animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    TotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TotalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
//    @property(nonatomic,strong)NSString *finish_state;
//    @property(nonatomic,strong)NSString *order_time;
//    @property(nonatomic,strong)NSString *store_name;
//    @property(nonatomic,strong)NSString *store_photo;
//    //订单号
//    @property(nonatomic,strong)UILabel *numberLab;
//    //商家图片
//    @property(nonatomic,strong)UIImageView *headImageView;
//    //商店名称
//    @property(nonatomic,strong)UILabel *shopNameLab;
//    //外卖
//    @property(nonatomic,strong)UILabel *typeLab;
//    //订餐方式
//    @property(nonatomic,strong)UILabel *wayLab;
//    //下单时间
//    @property(nonatomic,strong)UILabel *orderTimeLab;
//    //金额
//    @property(nonatomic,strong)UILabel *moneyLab;
    Order *order = self.messageArr[indexPath.row];
//    NSLog(@"finish_state=%@",order.finish_state);
//    NSLog(@"order_time=%@",order.order_time);
//    NSLog(@"store_name=%@",order.store_name);
//    NSLog(@"store_photo=%@",order.store_photo);
    cell.moneyLab.text = [NSString stringWithFormat:@"总金额\t¥%@",order.order_price];
    cell.typeLab.text = order.eat_type;
    cell.shopNameLab.text = order.store_name;
    cell.orderTimeLab.text = [NSString stringWithFormat:@"下单时间：%@",order.order_time];
    cell.payLab.text = order.finish_state;
    cell.numberLab.text = [NSString stringWithFormat:@"订单号：%@",order.order_no];
//    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
//    [imageview sd_setImageWithURL:[NSURL URLWithString:order.store_photo] placeholderImage:nil];
    
    [cell.headImageView sd_setImageWithURL:[NSURL URLWithString:order.store_photo] placeholderImage:nil] ;
    
//    cell.payLab.text = @"已付款";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
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
