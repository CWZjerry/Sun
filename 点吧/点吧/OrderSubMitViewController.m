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
#import "AddressViewController.h"
#import "TimePicker.h"
#import "hoteModel.h"
//生成订单
#define CREAT_ORDER_URL @"http://www.kdiana.com/index.php/Before/Orders/order_info"
//生成订单返回页面
#define CREAT_ORDER_RETURN @"http://www.kdiana.com/index.php/Before/Orders/order_return"
@interface OrderSubMitViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)BottomView *bottomView;
@property(nonatomic,strong)TimePicker *timePicker;
@property(nonatomic,strong)NSMutableArray *seletedArr;
@property(nonatomic,assign)NSInteger seld;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,strong)NSString *price;
@end

@implementation OrderSubMitViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.view insertSubview:self.bottomView aboveSubview:self.tableView];
    
//    NSMutableArray * arr = _indentMarr;
//    for (hoteModel_menu_info *mode in arr) {
//        
//    }
//    NSLog(@"%@",arr);
//    NSMutableArray * arr = _indentMarr;
//    NSLog(@"%@",arr);
//    NSLog(@"123%@",self.priceMoeny);
   }
-(BottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0,[UIScreen mainScreen].bounds.size.height - 49 , [UIScreen mainScreen].bounds.size.width, 49)];
        self.price = [self.priceMoeny substringFromIndex:1];
        _bottomView.number.text = self.price;
        [_bottomView.SubMit addTarget:self action:@selector(SubMitClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomView;
}
-(void)SubMitClick:(UIButton *)button
{
    PayViewController *pay =[[PayViewController alloc]init];
    [self.navigationController pushViewController:pay animated:YES];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        AddressViewController *addreaa = [[AddressViewController alloc]init];
        [self.navigationController pushViewController:addreaa animated:YES];
    }
    else if (indexPath.section == 1)
    {
        self.timePicker = [[TimePicker alloc]init];
        [self.view addSubview:self.timePicker];
        _timePicker.sd_layout
        .leftEqualToView(self.view)
        .bottomEqualToView(self.view)
        .rightEqualToView(self.view)
        .heightIs(self.view.frame.size.height/2);
        [self.timePicker.bth addTarget:self action:@selector(timeButon) forControlEvents:UIControlEventTouchUpInside];
    }
//    else if (indexPath.section == 6)
//    {
//        if (indexPath.row == 0) {
//            self.seld = 0;
//        }
//        else
//        {
//            self.seld = 1;
//            
//        }
////        [[NSUserDefaults standardUserDefaults]setValue:[_seletedArr objectAtIndex:indexPath.row] forKey:@"seleted"];
////        self.seld = indexPath.row;
////        AudioServicesPlaySystemSound([[_seletedArr objectAtIndex:indexPath.row]integerValue]);
//        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:6];
//        [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
////        [myTableView reloadData];
//    }

}
-(void)timeButon
{
    NSDate *theDate = self.timePicker.datePicker.date;//该属性返回选中的时间
//    NSLog(@"%@",[theDate descriptionWithLocale:[NSLocale currentLocale]]);//返回基于本地化的时间信息，其中NSLocale的静态方法currentLocale返回当前的NSLocale对象
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];//返回一个日期格式对象
    dateFormatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";//该属性用于设置日期格式为YYYY-MM-dd HH-mm-ss
    self.time =  [dateFormatter stringFromDate:theDate];
    [self.tableView reloadData];
    //该方法用于从日期对象返回日期字符串
    [self.timePicker removeFromSuperview];
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    if (section == 6) {
//        DetailsView *view =[[DetailsView alloc]init];
//        view.backgroundColor = [UIColor whiteColor];
//        view.details.text = @"支付方式";
//        return view;
//    }
//    else
//    {
        return [[UIView alloc]init];
    
//    }
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
    if (indexPath.section == 2) {
        return 42;
    }
    else if (indexPath.section == 5)
    {
        return 42;
    }
    return 37;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        return self.indentMarr.count;
    }
    else if (section == 4)
    {
        return 2;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        HeadTableViewCell *cell = [[HeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    else if (indexPath.section == 1)
    {
        HeadTableViewCell *cell = [[HeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.name.text = @"送达时间";
        if (self.time == nil) {
            cell.message.text = @"请选择";
        }
        else
        {
            cell.message.text = self.time;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    else if (indexPath.section == 2)
    {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
            DetailsMessage *message = [[DetailsMessage alloc]init];
            [cell.contentView addSubview:message];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

             return cell;
    }
    else if(indexPath.section == 3)
    {
        hoteModel_menu_info *model = self.indentMarr[indexPath.row];
        VegeTableViewCell *cell =[[VegeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.vegetable.text = model.menu_name;
        cell.number.text = [NSString stringWithFormat:@"x%ld",model.count_num];
        cell.money.text =[NSString stringWithFormat:@"¥%ld",[model.menu_price integerValue]*model.count_num];
        return cell;
    }
    else if (indexPath.section == 4)
    {
        CostTableViewCell *cell = [[CostTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        if (indexPath.row == 1) {
            cell.freight.text = @"优惠卷";
            cell.money.textColor = [GVColor hexStringToColor:@"#ff1e00"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    else
    {
        RemarsTableViewCell *cell =[[RemarsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
        
    }
//    else
//    {
//        PayTableViewCell *cell = [[PayTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
//        
//        if (indexPath.row == 0) {
//            if (self.seld == 0) {
//                cell.round.selected = YES;
//            }
//            else
//            {
//                cell.round.selected = NO;
//            }
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//            return cell;
//        }
//        else
//        {
//            cell.payImage.image = [UIImage imageNamed:@"wechat"];
//            cell.name.text = @"微信支付";
//            if (self.seld == 1) {
//                cell.round.selected = YES;
//            }
//            else
//            {
//                cell.round.selected = NO;
//            }
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//
//            return cell;
//        }
////        if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"seleted"] isEqualToString:[_seletedArr objectAtIndex:indexPath.row]]) {
////        if (self.seld == 0) {
////            
////        
////            cell.round.selected = YES;
////        }
////        else
////        {
////            cell.round.selected = NO;
////        }
        
//    }
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.timePicker removeFromSuperview];
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource= self;
    }
    return _tableView;
}
-(NSMutableArray *)seletedArr
{
    if (!_seletedArr) {
        _seletedArr = [NSMutableArray array];
    }
    return _seletedArr;
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
