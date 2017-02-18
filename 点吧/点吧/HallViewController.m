//
//  HallViewController.m
//  点吧
//
//  Created by Pro on 2016/12/27.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "HallViewController.h"
#import "Order.h"
#import "DetailsViewController.h"
#import "TotalTableViewCell.h"
@interface HallViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)NSInteger pag;
@property(nonatomic,strong)NSMutableArray *messageArr;

@end

@implementation HallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height-154) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.mj_header  = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self.messageArr removeAllObjects];
        self.pag = 0;
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        self.pag ++;
        [self loadData];
    }];
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
//    NSLog(@"%ld",self.pag);
    NSDictionary *dic = @{@"user_id":@"10001",
                          @"type":@"1",
                          @"page":[NSString stringWithFormat:@"%ld",self.pag]
                          };
    NSString * str = @"http://www.kdiana.com/index.php/Before/MyOrder/orderall";
    [NetworkRequest Post:str parameters:dic success:^(id responseObject) {
        //        NSLog(@"%@",responseObject);
        NSArray *arr =[responseObject objectForKey:@"data"];
//        NSLog(@"----%@",[responseObject objectForKey:@"page"]);
        if (self.pag > [[responseObject objectForKey:@"page"] intValue]) {
            [self.tableView.mj_footer endRefreshing];
            return ;
        }
        
        for (NSDictionary *dic  in arr) {
            Order *order = [Order yy_modelWithJSON:dic];
            [self.messageArr addObject:order];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
        
    }];
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageArr.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailsViewController * details = [[DetailsViewController alloc]init];
    Order *order = self.messageArr[indexPath.row];
    details.order_id = [NSString stringWithFormat:@"%@",order.order_id];
    [self.navigationController pushViewController:details animated:YES];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cellID";
    TotalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TotalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;  
    Order *order = self.messageArr[indexPath.row];
    cell.order = order;
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
