//
//  AddViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AddViewController.h"
#import "addressData.h"
#import "ModelAdd.h"
#import "AddView.h"

@interface AddViewController ()
{
    addressData *dealData;
    AddView *subView;
}
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    subView =[[AddView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
//    self.view=subView;
    [self.view addSubview:subView];
    
    dealData=[addressData shareWSDealData];
    
    //底色视图
//    UIView *vieww = [[UIView alloc] initWithFrame:CGRectMake(0, 85, self.view.frame.size.width, 250)];
//    vieww.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
//    
//    [self.view addSubview:vieww];
    
    
    
    
//
//    [btn setTitle:@"提交" forState:UIControlStateNormal];
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //提交按钮
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, 350, 225 , 40)];
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [btn setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    btn.layer.cornerRadius = 16.5;
    btn.layer.masksToBounds = YES;
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn addTarget:self action:@selector(saveClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    [self showView];
    if (self.indexRow == 10000) {
        self.navigationItem.title = @"添加地址";
    }
    else
    {
        self.navigationItem.title = @"修改";
        //打开数据库
        [dealData openDB];
        ModelAdd *book = [dealData selectData][self.indexRow];
        // 文本框显示要修改的数据内容
        subView.fieldName.text = book.name;
        subView.fieldNumber.text = book.author;
        
        // 关闭数据库
        [dealData closeDB];
    }
    
    
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
    labTitle.text=@"修改地址";
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


- (void)saveClick
{
    if (self.indexRow == 10000) {
        // 添加
        ModelAdd *book = [[ModelAdd alloc]init];
        book.name = subView.fieldName.text;
        book.author = subView.fieldNumber.text;
        
        // 打开
        [dealData openDB];
        // 创建表
        //        [dealData createTable];
        // 添加
        [dealData addData:book];
        // 关闭
        [dealData closeDB];
    }
    else
    {
        // 打开
        [dealData openDB];
        // 获取要修改的数据
        ModelAdd *book = [[ModelAdd alloc]init];
        book.name = subView.fieldName.text;
        book.author = subView.fieldNumber.text;
        // 修改数据
        [dealData updateData:[dealData selectData][self.indexRow] withAnotherData:book];
        
        // 关闭数据库
        [dealData closeDB];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
