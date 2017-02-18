//
//  ReturnViewController.m
//  点吧
//
//  Created by Jenny on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "SiteViewController.h"
#import "AddressTableViewCell.h"
#import "AddressHeaderView.h"
#import "AddAddressViewController.h"
#import "SelectResultData.h"
#import "AddViewController.h"

#define SELECTURL @"http://www.kdiana.com/index.php/Before/Orders/address_sel"
@interface SiteViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *arr;
    NSMutableArray *dataSource;
}

@property (nonatomic, strong) AddressHeaderView *addAddressHeader;
@property (nonatomic, strong) UITableView *myTable;
@property (nonatomic, strong) AddressTableViewCell *addressTableViewCell;

@end

@implementation SiteViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSDictionary *dic =@{@"user_id":@"10089"};
   
    
    [NetworkRequest Post:SELECTURL parameters:dic success:^(id responseObject) {
        //在这里加载数据
        arr =[responseObject objectForKey:@"data"];
        dataSource =[NSMutableArray array];
        for (NSDictionary *dic in arr) {
            SelectResultData *selectModel =[[SelectResultData alloc] init];
            [selectModel setValuesForKeysWithDictionary:dic];
            [dataSource addObject:selectModel];
        }
        
        
        [self.myTable reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.myTable];
    self.myTable.separatorStyle =NO;
    self.myTable.tableHeaderView =self.addAddressHeader;
    [self setNav];
    

}
-(void)setNav{
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"";
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

- (UITableView *)myTable{
    if (!_myTable) {
        _myTable =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _myTable.delegate =self;
        _myTable.dataSource =self;
    }
    return _myTable;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *iedntify =@"UITableViewCell";
    AddressTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:iedntify];
    if (!cell) {
        cell =[[[NSBundle mainBundle] loadNibNamed:@"AddressTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        
    }
    cell.selectData =dataSource[indexPath.row];
    
    return cell;
}
-(AddressTableViewCell *)addAddressTable{
    if (_addressTableViewCell) {
        _addressTableViewCell = [[[NSBundle mainBundle]loadNibNamed:@"AddressTableViewCell" owner:self options:nil] lastObject];
        
        [_addressTableViewCell.Edit addTarget:self action:@selector(addEdit:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _addressTableViewCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (AddressHeaderView *)addAddressHeader{
    if (!_addAddressHeader) {
        _addAddressHeader =[[[NSBundle mainBundle] loadNibNamed:@"AddressHeaderView" owner:self options:nil] lastObject];
        [_addAddressHeader.addAddressButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addAddressHeader;
}

- (void)addButtonClick:(UIButton *)but{
    
    AddViewController *add = [[AddViewController alloc] init];
    
    [self.navigationController pushViewController:add animated:YES];
}

@end
