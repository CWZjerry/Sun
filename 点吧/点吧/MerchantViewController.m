//
//  MerchantViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "MerchantViewController.h"

@interface MerchantViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UIImageView *imageName;

@property (nonatomic, strong) UIImageView *imagePassword;

@property (nonatomic, strong) UIView *lineV;//输入框下第一条线

@property (nonatomic, strong) UIView *lineTwoV;//输入框下第二条线

@property (nonatomic, strong) UITextField *userNameN; //输入手机号输入框

@property (nonatomic, strong) UITextField *UserPassword;//验证码输入框

@property (nonatomic, strong)UIImageView *imagePhone;

@property (nonatomic, strong) UIImageView *imageCancel;

@property (nonatomic, strong) UIView *line;//输入框下第一条线

@property (nonatomic, strong) UIView *lineTwo;//输入框下第二条线

@property (nonatomic, strong) UITextField *userName; //输入手机号输入框

@property (nonatomic, strong) UITextField *password;//验证码输入框

@property (nonatomic ,strong) UIButton *textBtn;//获取验证码按钮

@property (nonatomic ,strong) UIButton *loginBtn;

@property (nonatomic ,strong) UILabel *promptLable;
@property (nonatomic ,strong) UIButton *promptBtn;
@property (nonatomic ,strong) UIButton *circularBtn;

@end

@implementation MerchantViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor= [UIColor whiteColor];
    
    [self setNav];
    [self setUpUI];
}

-(void)setUpUI{
    //输入框前面的图标
    _imageName = [[UIImageView alloc] initWithFrame:CGRectMake(18, 64 + 45,15,22)];
    _imageName.image = [UIImage imageNamed:@"account"];
    [self.view addSubview:_imageName];
    
    _imagePassword = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imageName.bottom + 60 ,22,22)];
    _imagePassword.image = [UIImage imageNamed:@"password"];
    [self.view addSubview:_imagePassword];
    
    
    
    _userNameN = [[UITextField alloc]initWithFrame:CGRectMake(50, 64 + 40, ScreenWidth - 80, 40)];
    _userNameN.delegate = self;
    _userNameN.keyboardType = UITextBorderStyleLine;
    
    _userNameN.placeholder = @"请输入用户名(6-12位字符和数字)";
    _userNameN.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    
    _userNameN.keyboardType = UIKeyboardTypeDefault;
    _userNameN.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userNameN.returnKeyType =UIReturnKeyNext;
    _userNameN.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userNameN];
    
    _lineV = [[UIView alloc]initWithFrame:CGRectMake(18, _userNameN.bottom + 20, ScreenWidth - 26, 0.8)];
    _lineV.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineV];
    
    _UserPassword = [[UITextField alloc]initWithFrame:CGRectMake(50, _userNameN.bottom + 40, ScreenWidth - 80, 40)];
    _UserPassword.delegate = self;
    _password.keyboardType = UITextBorderStyleLine;
    //    _password.backgroundColor = [UIColor clearColor];
    _UserPassword.placeholder = @"请输入密码(6-12位字符和数字)";
    _UserPassword.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _UserPassword.secureTextEntry = YES;
    _UserPassword.keyboardType = UIKeyboardTypeDefault;
    _UserPassword.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _UserPassword.returnKeyType = UIReturnKeyDone;
    _UserPassword.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:_UserPassword];
    
    _lineTwoV = [[UIView alloc]initWithFrame:CGRectMake(18, _UserPassword.bottom + 20, ScreenWidth - 26, 0.8)];
    _lineTwoV.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineTwoV];
    
    
    //输入框前面的图标
    _imagePhone = [[UIImageView alloc] initWithFrame:CGRectMake(18,_imagePassword.bottom + 56,15,22)];
    _imagePhone.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:_imagePhone];
    
    _imageCancel = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imagePhone.bottom + 60 ,22,22)];
    _imageCancel.image = [UIImage imageNamed:@"cancel"];
    [self.view addSubview:_imageCancel];
    
    
    
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(50, _UserPassword.bottom + 40, ScreenWidth - 80, 40)];
    _userName.delegate = self;
    _userName.keyboardType = UITextBorderStyleLine;
    
    _userName.placeholder = @"请输入号码";
    _userName.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
  
    _userName.keyboardType = UIKeyboardTypeDefault;
    _userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userName.returnKeyType =UIReturnKeyNext;
    _userName.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userName];
    
    _line = [[UIView alloc]initWithFrame:CGRectMake(18, _userName.bottom + 20, ScreenWidth - 26, 0.8)];
    _line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_line];
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(50, _userName.bottom + 40, ScreenWidth - 80, 40)];
    _password.delegate = self;
    _password.keyboardType = UITextBorderStyleLine;
    //    _password.backgroundColor = [UIColor clearColor];
    _password.placeholder = @"请输入验证码";
    _password.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _password.secureTextEntry = YES;
    _password.keyboardType = UIKeyboardTypeDefault;
    _password.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _password.returnKeyType = UIReturnKeyDone;
    _password.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:_password];
    
    _lineTwo = [[UIView alloc]initWithFrame:CGRectMake(18, _password.bottom + 20, ScreenWidth - 26, 0.8)];
    _lineTwo.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineTwo];
    
    
    //获取验证码按钮
    _textBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth -85 -12, _lineTwo.top - 50, 85 , 24)];
    [_textBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_textBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    [_textBtn.layer setCornerRadius:12]; //设置矩圆角半径
    [_textBtn.layer setBorderWidth:0.5];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [_textBtn.layer setBorderColor:colorref];//边框颜色
    _textBtn.layer.borderColor=[GVColor hexStringToColor:@"#ffba14"].CGColor;
    _textBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_textBtn addTarget:self action:@selector(textBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_textBtn];
    
    _promptLable = [[UILabel alloc] initWithFrame:CGRectMake(145, _lineTwo.bottom+3, ScreenWidth, 40)];
    _promptLable.text = @"我已阅读并接受";
//    _promptLable.textAlignment = NSTextAlignmentCenter;
    _promptLable.font = [UIFont systemFontOfSize:14];
    _promptLable.textColor = [UIColor blackColor];
    [self.view addSubview:_promptLable];
    
    _promptBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 190 ,_lineTwo.bottom + 7, 180, 30)];
    [_promptBtn setTitle:@"《点注注册服务协议》" forState:UIControlStateNormal];
    [_promptBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    
    _promptBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:_promptBtn];
    
    //选中按钮
    _circularBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, _lineTwo.bottom +18, 10 , 10)];
    [_circularBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [_circularBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
    [_circularBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_circularBtn];
    
    
    //提交资料按钮
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, _lineTwo.bottom + 100, 225 , 33)];
    [_loginBtn setTitle:@"提交资料" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    _loginBtn.layer.cornerRadius = 16.5;
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_loginBtn addTarget:self action:@selector(longinclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    
    
}
-(void)textBtn:(UIButton *)sender{
  
}
//提交绑定按钮方法
-(void)longinclick{
    
}
//选中按钮的方法（实心空心记住密码）
-(void)buttonClick:(UIButton *)button{
    button.selected = !button.selected;
}


-(void)setNav{
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"商户注册";
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
