//
//  AddressViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AddressViewController.h"
#import "addressData.h"
#import "AddViewController.h"//添加地址二级页面
#import "addressTableViewCell.h"

@interface AddressViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *Marr;
    addressData *dealData;
    UITableView *table;
}

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self setNav];
    //tableView
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStyleGrouped];
    
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    
    //初始化对象
    dealData = [addressData shareWSDealData];
    //打开数据库
    [dealData openDB];
    //创建数据库
    [dealData createTable];
    //关闭数据库
    [dealData closeDB];
    
}
#pragma mark - 视图出现的方法
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 打开数据库
    [dealData openDB];
    // 查找数据
    Marr = [dealData selectData];
    
    // 关闭数据
    [dealData closeDB];
    // 刷新表格
    [table reloadData];
}
-(void)showView{
    UIView *nav=[[UIView alloc]init];
    nav.backgroundColor=[GVColor hexStringToColor:@"#ffba14"];
    [self.view addSubview:nav];
    
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.height.mas_offset(64);
    }];
    UILabel *labTitle=[[UILabel alloc]init];
    labTitle .font=[UIFont systemFontOfSize:20];
    labTitle.textAlignment=NSTextAlignmentCenter;
    labTitle.text=@"管理地址";
    [self.view addSubview:labTitle];
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(28);
        make.width.equalTo(nav.mas_width);
    }];
    UIButton *rtn=[[UIButton alloc]init];
    [rtn setTitle:@"<" forState:UIControlStateNormal];
    rtn.titleLabel.font=[UIFont systemFontOfSize:23];
    [rtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:rtn];
    [rtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [rtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nav.mas_top).offset(20);
        make.left.equalTo(nav.mas_left).offset(5);
    }];
    
}
-(void)click
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 6;
    }else
    {
        return 10;
    }
}

#pragma mark - TableView data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else{
        return Marr.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    if (indexPath.section==0) {
        cell.textLabel.text=@"+ 添加新地址";
        cell.textLabel.textColor=[GVColor hexStringToColor:@"#ffba14"];
    }else{
        
        cell.textLabel.text = [Marr[indexPath.row]name];
        cell.detailTextLabel.text = [Marr[indexPath.row]author];
//        cell.backgroundColor = [GVColor hexStringToColor:@"#bbbbbb"];
        
    }
    return cell;
}

#pragma mark -  点击单元格的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            AddViewController *vc = [[AddViewController alloc]init];
            vc.indexRow = 10000;
            [self.navigationController pushViewController:vc animated:YES];
            vc.view.backgroundColor=[UIColor whiteColor];
        }
        
        
    }else{
        
        AddViewController *vc = [[AddViewController alloc]init];
        vc.indexRow = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
        vc.view.backgroundColor=[UIColor whiteColor];
    }
}

#pragma mark - 删除单元格的方法


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 打开数据库
    [dealData openDB];
    //删除数据
    ModelAdd *book = Marr[indexPath.row];
    [dealData deleteData:book.bookID];
    //关闭数据库
    [dealData closeDB];
    
    // 打开数据库
    [dealData openDB];
    // 查找数据
    Marr = [dealData selectData];
    // 关闭数据库
    [dealData closeDB];
    // 刷新表格
    [table reloadData];
    
}

//导航设置
- (void)setNav{
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"管理地址";
    //导航字体颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    // 设置导航默认标题的颜色及字体大小
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor blackColor], UITextAttributeFont:[UIFont boldSystemFontOfSize:20]};
    
    //导航添加的按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    // 导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:[GVColor hexStringToColor:@"ffba14"]];
    
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    
    self.navigationItem.leftBarButtonItem=backBtn;
}

//导航按钮点击方法
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
