//
//  MyMerchantViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "MyMerchantViewController.h"

@interface MyMerchantViewController ()
@property (nonatomic ,strong) UIImageView *imageAll;       //背景图片
@property (nonatomic ,strong) UILabel *loginLab;          //登录标题
@property (nonatomic ,strong) UIButton *StaffloginBtn;   //员工登录
@property (nonatomic ,strong) UIButton *backBtn;        //返回按钮

@property (nonatomic, strong)UIImageView *imageName;

@property (nonatomic, strong) UIImageView *imagePassword;

@property (nonatomic, strong) UIView *lineV;//输入框下第一条线

@property (nonatomic, strong) UIView *lineTwoV;//输入框下第二条线

@property (nonatomic, strong) UITextField *userNameN; //输入手机号输入框

@property (nonatomic, strong) UITextField *UserPassword;//验证码输入框



@end

@implementation MyMerchantViewController
//视图将要出现时
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES ;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self setNav];
    [self setUIView];
    
}
-(void)setUIView{
    
    //背景图片
    _imageAll = [[UIImageView alloc] initWithFrame:self.view.frame];;
    _imageAll.image = [UIImage imageNamed:@"background"];
    
    [self.view addSubview:_imageAll];
    
    //登录标题
    _loginLab = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 10, 100, 100)];
    _loginLab.text = @"登录";
    _loginLab.textColor = [UIColor whiteColor];
    
    [_imageAll addSubview:_loginLab];
    
  
}

//导航设置
- (void)setNav{
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES];
//    self.navigationItem.title = @"登录";
    //导航字体颜色
//    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    // 设置导航默认标题的颜色及字体大小
//    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor], UITextAttributeFont:[UIFont boldSystemFontOfSize:20]};
    
    //导航添加的按钮颜色
//    self.navigationController.navigationBar.tintColor = [GVColor hexStringToColor:@"ffba14"];
    // 导航栏背景颜色
//    [self.navigationController.navigationBar setBarTintColor:[GVColor hexStringToColor:@"ffba14"]];
//    self.navigationController.navigationBar.alpha = 0.1;
//    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
//    
//    self.navigationItem.leftBarButtonItem=backBtn;
    
//    UIBarButtonItem *Stafflogin = [[UIBarButtonItem alloc] initWithTitle:@"员工登录" style:UIBarButtonItemStylePlain target:self action:@selector(StaffloginClick)];
//    
//    self.navigationItem.rightBarButtonItem=Stafflogin;
}
//导航按钮点击方法
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

//
-(void)StaffloginClick{
    NSLog(@"点击员工登录");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
