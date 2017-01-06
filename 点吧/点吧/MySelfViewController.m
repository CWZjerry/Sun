//
//  MySelfViewController.m
//  点吧
//
//  Created by Pro on 2016/12/26.
//  Copyright © 2016年 OneGroup. All rights reserved.
//


#import "MySelfViewController.h"
#import "LoginViewController.h"
#import "GVColor.h"
#import "UIView+Addition.h"

#import "cooperationController.h"
#import "proposalController.h"
#import "MyInfoViewController.h"


#import "purseViewController.h"
#import "discountViewController.h"

@interface MySelfViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel *headLabel;
    UIButton *headBtn;
    
}
@property (nonatomic, strong) UITableView *TableView;

@property (nonatomic, strong) UIView *headView;

@property (nonatomic, strong) NSArray *listArr;

@property (nonatomic, strong) NSArray *slistArr;

@property (nullable ,strong) UIButton *topLine;

@property (nonatomic ,strong) UIButton *middleLine;



@end

@implementation MySelfViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

    _listArr = [NSArray arrayWithObjects:@"我的积分",@"我的收货地址", nil];
    _slistArr = [NSArray arrayWithObjects:@"加盟合作",@"关于我们",@"意见反馈", nil];
    [self setTableView];
    
}

-(void)setTableView{
    _TableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _TableView.dataSource = self;
    _TableView.delegate = self;
    _TableView.showsVerticalScrollIndicator = YES;
    [_TableView setTableHeaderView:self.headView];
    //tableView的加头视图
    _TableView.tableHeaderView = [self headViewW];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:_TableView];
    
    
}

#pragma mark -- TableViewDeletage & Datasouth
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _listArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return _listArr.count;
    }
    else if (section == 1)
    {
        return _slistArr.count;
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell== nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = _listArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15 weight:0];
        cell.textLabel.textColor =  [GVColor hexStringToColor:@"333333"];
        
    }else{
        cell.textLabel.text = _slistArr[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15 weight:0];
        cell.textLabel.textColor =  [GVColor hexStringToColor:@"333333"];
    }
    return cell;
}

//单元格点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0 ) {
            cooperationController *coo = [[cooperationController alloc] init];
            [self.navigationController pushViewController:coo animated:YES];
        }
        if (indexPath.row == 2) {
            proposalController *pro = [[proposalController alloc] init];
            [self.navigationController pushViewController:pro animated:YES];
        }
    }
}
-(UIView *)headViewW{
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth, 280)];
    self.headView.backgroundColor = [UIColor whiteColor];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width , 164)];
    image.image = [UIImage imageNamed:@"background_"];
    [self.headView addSubview:image];
    
    
    headBtn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/2 - 41.5, 54, 83, 83)];
    [headBtn setBackgroundColor:[UIColor lightGrayColor]];
    headBtn.layer.cornerRadius = 41.5;
    headBtn.layer.masksToBounds = YES;
//    [headBtn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    [headBtn addTarget:self action:@selector(LoginInBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:headBtn];
    
    headLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 153, ScreenWidth - 20, 20)];
    headLabel.text = @"登录/注册";
    headLabel.textAlignment = NSTextAlignmentCenter;
    headLabel.textColor =  [GVColor hexStringToColor:@"333333"];
    headLabel.font = [UIFont systemFontOfSize:17 weight:1.5];
    [self.headView addSubview:headLabel];
    
    _middleLine = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth/2,  200, 0.5, 70)];
    [_middleLine setBackgroundColor: [GVColor hexStringToColor:@"dddddd"]];
    [self.headView addSubview:_middleLine];
    
    _topLine=[[UIButton alloc]initWithFrame:CGRectMake(0, 193, ScreenWidth, 0.5)];
    [_topLine setBackgroundColor: [GVColor hexStringToColor:@"dddddd"]];
    [self.headView addSubview:_topLine];
    //我的钱包 btn
    UIButton *purseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _topLine.bottom, ScreenWidth/2, 84)];
    UIImageView *purseImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/2-115, 10, 33, 28)];
    purseImage.image = [UIImage imageNamed:@"wallet"];
    [purseBtn addSubview:purseImage];
    UILabel *purseLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 40, ScreenWidth/2 - 20, 20)];
    purseLabel.text = @"我的钱包";
    purseLabel.textAlignment = NSTextAlignmentCenter;
    purseLabel.textColor = [GVColor hexStringToColor:@"888888"];
    [purseBtn addSubview:purseLabel];
    [purseBtn addTarget:self action:@selector(purseClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headView addSubview:purseBtn];
    //我的优惠券btn
    UIButton *discountBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth/2+5, _topLine.bottom, ScreenWidth/2, 84)];
    UIImageView *discountImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth/4-25, 10, 33, 28)];
    discountImage.image = [UIImage imageNamed:@"discount"];
    [discountBtn addSubview:discountImage];
    UILabel *discountLable = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth/4-100, 40, ScreenWidth/2-20, 20)];
    discountLable.text = @"我的优惠券";
    discountLable.textAlignment = NSTextAlignmentCenter;
    discountLable.textColor = [GVColor hexStringToColor:@"888888"];
    [discountBtn addSubview:discountLable];
    [discountBtn addTarget:self action:@selector(discountClick) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:discountBtn];
    return self.headView;
}
//我的钱包
-(void)purseClick{
    purseViewController *purse = [[purseViewController alloc] init];
    [self.navigationController pushViewController:purse animated:YES];
    
    
}
//优惠券
-(void)discountClick{
    
    discountViewController *discount = [[discountViewController alloc] init];
    [self.navigationController pushViewController:discount animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
//登录判断选择
-(void)LoginInBtnClick{
    LoginViewController *login = [[LoginViewController alloc]init];
    
    if ([headLabel.text isEqual:@"登录/注册"]) {
        
        
        [login returnText:^(NSString *showText) {
            headLabel.text = showText;

        }];

        [self.navigationController pushViewController:login animated:YES];
    }
    
    else
    {
        MyInfoViewController *info = [[MyInfoViewController alloc] init];
        
        [info returnText:^(NSString *showTextss) {
            headLabel.text = showTextss;
        }];
        
        [self.navigationController pushViewController:info animated:YES];

    
    }
}



@end
