//
//  KnightViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "KnightViewController.h"

@interface KnightViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UIImageView *imagePhone;

@property (nonatomic, strong) UIImageView *imageCancel;


@property (nonatomic, strong) UIView *line;//输入框下第一条线

@property (nonatomic, strong) UIView *lineTwo;//输入框下第二条线

@property (nonatomic, strong) UITextField *userName; //输入手机号输入框

@property (nonatomic, strong) UITextField *password;//验证码输入框

@property (nonatomic ,strong) UIButton *textBtn;//获取验证码按钮

@property (nonatomic, strong)UIImageView *imagePassword;

@property (nonatomic, strong) UIImageView *imageName;


@property (nonatomic, strong) UIView *lineThree;//输入框下第一条线

@property (nonatomic, strong) UIView *lineFour;//输入框下第二条线

@property (nonatomic, strong) UITextField *userPassword; //输入手机号输入框

@property (nonatomic, strong) UITextField *UserName;//验证码输入框



@property (nonatomic, strong)UIImageView *imageArea;

@property (nonatomic, strong) UIImageView *imageAddress;


@property (nonatomic, strong) UIView *lineFive;//输入框下第一条线

@property (nonatomic, strong) UIView *lineSix;//输入框下第二条线

@property (nonatomic, strong) UITextField *userArea; //输入手机号输入框

@property (nonatomic, strong) UITextField *userAddress;//验证码输入框

@property (nonatomic, strong)UIImageView *imagePhoto;

@property (nonatomic, strong) UIImageView *imageReason;


@property (nonatomic, strong) UIView *lineEight;//输入框下第一条线

@property (nonatomic, strong) UIView *lineNine;//输入框下第二条线

@property (nonatomic, strong) UITextField *userPhoto; //输入手机号输入框

@property (nonatomic, strong) UITextField *userReason;//验证码输入框


@property (nonatomic ,strong) UILabel *promptLable;
@property (nonatomic ,strong) UIButton *promptBtn;
@property (nonatomic ,strong) UIButton *circularBtn;
@property (nonatomic ,strong) UIButton *loginBtn;


@property (nonatomic ,strong) UIButton *frontSideBtn;
@property (nonatomic ,strong) UIButton *reverseSideBtn;

@end

@implementation KnightViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[ UIColor whiteColor];
    [self setNav];
    [self setUpUI];
    
    
}
-(void)setUpUI{
    //输入框前面的图标
    _imagePhone = [[UIImageView alloc] initWithFrame:CGRectMake(18, 64 + 20,15,22)];
    _imagePhone.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:_imagePhone];
    
    _imageCancel = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imagePhone.bottom + 35 ,22,22)];
    _imageCancel.image = [UIImage imageNamed:@"cancel"];
    [self.view addSubview:_imageCancel];
    
    
    
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(50, 64 + 15, ScreenWidth - 80, 40)];
    _userName.delegate = self;
    _userName.keyboardType = UITextBorderStyleLine;
    
    _userName.placeholder = @"请输入号码";
    _userName.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    //    [_userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _userName.keyboardType = UIKeyboardTypeDefault;
    _userName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userName.returnKeyType =UIReturnKeyNext;
    _userName.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userName];
    
    _line = [[UIView alloc]initWithFrame:CGRectMake(18, _userName.bottom + 10, ScreenWidth - 26, 0.8)];
    _line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_line];
    
    _password = [[UITextField alloc]initWithFrame:CGRectMake(50, _userName.bottom + 15, ScreenWidth - 80, 40)];
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
    
    _lineTwo = [[UIView alloc]initWithFrame:CGRectMake(18, _password.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineTwo.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineTwo];
    
    
    //获取验证码按钮
    _textBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth -85 -12, _lineTwo.top - 40, 85 , 24)];
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
    
//    
//    //登录按钮
//    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, _lineTwo.bottom + 50, 225 , 33)];
//    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
//    [_loginBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
//    [_loginBtn setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
//    _loginBtn.layer.cornerRadius = 16.5;
//    _loginBtn.layer.masksToBounds = YES;
//    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
//    [_loginBtn addTarget:self action:@selector(longinclick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:_loginBtn];
    
    //密码和名字
    //输入框前面的图标
    _imagePassword = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imageCancel.bottom + 35 ,15,22)];
    _imagePassword.image = [UIImage imageNamed:@"password"];
    [self.view addSubview:_imagePassword];
    
    _imageName = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imagePassword.bottom + 35 ,22,22)];
    _imageName.image = [UIImage imageNamed:@"account"];
    [self.view addSubview:_imageName];
    
    
    
    _userPassword = [[UITextField alloc]initWithFrame:CGRectMake(50, _password.bottom + 15 , ScreenWidth - 80, 40)];
    _userPassword.delegate = self;
    _userPassword.keyboardType = UITextBorderStyleLine;
    
    _userPassword.placeholder = @"请输入6-12位的密码";
    _userPassword.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    //    [_userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _userPassword.keyboardType = UIKeyboardTypeDefault;
    _userPassword.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userPassword.returnKeyType =UIReturnKeyNext;
    _userPassword.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userPassword];
    
    _lineThree = [[UIView alloc]initWithFrame:CGRectMake(18, _userPassword.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineThree.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineThree];
    
    _UserName = [[UITextField alloc]initWithFrame:CGRectMake(50, _userPassword.bottom + 15, ScreenWidth - 80, 40)];
    _UserName.delegate = self;
    _UserName.keyboardType = UITextBorderStyleLine;
    _UserName.placeholder = @"请输入您的真实姓名";
    _UserName.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _UserName.secureTextEntry = YES;
    _UserName.keyboardType = UIKeyboardTypeDefault;
    _UserName.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _UserName.returnKeyType = UIReturnKeyDone;
    _UserName.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:_UserName];
    
    _lineFour = [[UIView alloc]initWithFrame:CGRectMake(18, _UserName.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineFour.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineFour];
    
    //区域和地址
    
    //输入框前面的图标
    _imageArea = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imageName.bottom + 35 ,15,22)];
    _imageArea.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:_imageArea];
    
    _imageAddress = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imageArea.bottom + 35 ,22,22)];
    _imageAddress.image = [UIImage imageNamed:@"cancel"];
    [self.view addSubview:_imageAddress];
    
    
    
    _userArea = [[UITextField alloc]initWithFrame:CGRectMake(50, _UserName.bottom + 15 , ScreenWidth - 80, 40)];
    _userArea.delegate = self;
    _userArea.keyboardType = UITextBorderStyleLine;
    
    _userArea.placeholder = @"请选择所在的地区>";
    _userArea.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    //    [_userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _userArea.keyboardType = UIKeyboardTypeDefault;
    _userArea.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userArea.returnKeyType =UIReturnKeyNext;
    _userArea.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userArea];
    
    _lineFive = [[UIView alloc]initWithFrame:CGRectMake(18, _userArea.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineFive.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineFive];
    
    _userAddress = [[UITextField alloc]initWithFrame:CGRectMake(50, _userArea.bottom + 15, ScreenWidth - 80, 40)];
    _userAddress.delegate = self;
    _userAddress.keyboardType = UITextBorderStyleLine;
    _userAddress.placeholder = @"请输入您的详细地址";
    _userAddress.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _userAddress.secureTextEntry = YES;
    _userAddress.keyboardType = UIKeyboardTypeDefault;
    _userAddress.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userAddress.returnKeyType = UIReturnKeyDone;
    _userAddress.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:_userAddress];
    
    _lineSix = [[UIView alloc]initWithFrame:CGRectMake(18, _userAddress.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineSix.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineSix];
    
    
    //身份证正反照片  申请理由
    //输入框前面的图标
    _imagePhone = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imageAddress.bottom + 45 ,15,22)];
    _imagePhone.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:_imagePhone];
    
    _imageReason = [[UIImageView alloc] initWithFrame:CGRectMake(18, _imagePhone.bottom + 50 ,22,22)];
    _imageReason.image = [UIImage imageNamed:@"cancel"];
    [self.view addSubview:_imageReason];
    
    
    
    _userPhoto = [[UITextField alloc]initWithFrame:CGRectMake(50, _userAddress.bottom + 15 , ScreenWidth - 80, 40)];
    _userPhoto.delegate = self;
    _userPhoto.keyboardType = UITextBorderStyleLine;
    
    _userPhoto.placeholder = @"*请上传身份证正反两面照片";
    _userPhoto.textColor = [UIColor blackColor];
    //    [_userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _userPhoto.keyboardType = UIKeyboardTypeDefault;
    _userPhoto.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userPhoto.returnKeyType =UIReturnKeyNext;
    _userPhoto.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userPhoto];
    
    _lineEight = [[UIView alloc]initWithFrame:CGRectMake(18, _lineSix.bottom + 80, ScreenWidth - 26, 0.8)];
    _lineEight.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineEight];
    
    _userReason = [[UITextField alloc]initWithFrame:CGRectMake(50, _userPhoto.bottom + 45, ScreenWidth - 80, 40)];
    _userReason.delegate = self;
    _userReason.keyboardType = UITextBorderStyleLine;
    _userReason.placeholder = @"请输入申请理由";
    _userReason.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _userReason.secureTextEntry = YES;
    _userReason.keyboardType = UIKeyboardTypeDefault;
    _userReason.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userReason.returnKeyType = UIReturnKeyDone;
    _userAddress.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:_userReason];
    
    _lineNine = [[UIView alloc]initWithFrame:CGRectMake(18, _userReason.bottom + 15, ScreenWidth - 26, 0.8)];
    _lineNine.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineNine];
    
   
    _promptLable = [[UILabel alloc] initWithFrame:CGRectMake(145, _lineNine.bottom+3, ScreenWidth, 40)];
    _promptLable.text = @"我已阅读并接受";
    //    _promptLable.textAlignment = NSTextAlignmentCenter;
    _promptLable.font = [UIFont systemFontOfSize:14];
    _promptLable.textColor = [UIColor blackColor];
    [self.view addSubview:_promptLable];
    
    _promptBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 190 ,_lineNine.bottom + 7, 180, 30)];
    [_promptBtn setTitle:@"《点注注册服务协议》" forState:UIControlStateNormal];
    [_promptBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    
    _promptBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:_promptBtn];
    
    //选中按钮
    _circularBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, _lineNine.bottom +18, 10 , 10)];
    [_circularBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [_circularBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
    [_circularBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_circularBtn];
    
    
    //提交资料按钮
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, _lineNine.bottom + 60, 225 , 40)];
    [_loginBtn setTitle:@"提交资料" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    _loginBtn.layer.cornerRadius = 16.5;
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_loginBtn addTarget:self action:@selector(longinclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    
    _frontSideBtn = [[UIButton alloc] initWithFrame:CGRectMake(10,_lineSix.bottom + 38, 180, 30)];
    [_frontSideBtn setTitle:@"添加照片(正)" forState:UIControlStateNormal];
    [_frontSideBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    
    _frontSideBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:_frontSideBtn];
    
    _reverseSideBtn = [[UIButton alloc] initWithFrame:CGRectMake(130 ,_lineSix.bottom + 38, 180, 30)];
    [_reverseSideBtn setTitle:@"添加照片(反)" forState:UIControlStateNormal];
    [_reverseSideBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    
    _reverseSideBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:_reverseSideBtn];
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
    self.navigationItem.title = @"骑士加盟";
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
