//
//  LoginViewController.m
//  点吧
//
//  Created by Jenny on 2016/12/28.
//  Copyright © 2016年 OneGroup. All rights reserved.


#import "LoginViewController.h"

//#import "findPassWordViewController.h"

#import "NetworkRequest.h"
#import "NSString+MD5.h"
#import "countDown.h"  //倒计时
#import "User.h"
@interface LoginViewController ()<UITextFieldDelegate,UIScrollViewAccessibilityDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView * theScrollView;

@property (nonatomic, strong) UIView *shadowView; //view底色


@property (nonatomic, strong) UIButton *titleBtn; //手机快捷登录按钮
@property (nonatomic ,strong) UIButton *topLine; //

@property (nonatomic ,strong) UIButton *bottomLine;//

@property (nonatomic, strong) UIButton *titlePassBtn;//密码登录按钮
@property (nonatomic, strong)UIImageView *imagePhone;

@property (nonatomic, strong) UIImageView *imageCancel;

@property (nonatomic, strong)UIImageView *imageAccount;

@property (nonatomic, strong) UIImageView *imagePassword;

@property (nonatomic, strong) UIView *line;//输入框下第一条线

@property (nonatomic, strong) UIView *lineTwo;//输入框下第二条线

@property (nonatomic, strong) UITextField *userName; //输入手机号输入框

@property (nonatomic, strong) UITextField *password;//验证码输入框

@property (nonatomic, strong) UITextField *userNameC; //输入手机号输入框

@property (nonatomic, strong) UITextField *passwordC;//密码输入框

@property (nonatomic ,strong) UILabel *promptLable;

@property (nonatomic ,strong) UIButton *promptBtn;

@property (nonatomic ,strong) UIButton *textBtn;//获取验证码按钮

@property (nonatomic ,strong) UIButton *loginBtn;

@property (nonatomic ,strong) UIButton *longinBtnTwo;

@property (nonatomic ,strong) UIButton *findPassword;//找回密码

@property (nonatomic, strong) UIButton *rememberPassword;//记住密码
@property (nonatomic, strong) UIButton *circularBtn;//空心 实心选中
@property (nonatomic, strong) UIButton *sincereBtn;

@property (nonatomic, assign) BOOL isUserEmpty;

@property (nonatomic, assign) BOOL isPasswordEmpty;

@property (strong, nonatomic) NSDictionary *phoneCode;

@property (strong, nonatomic) NSDictionary *parameters;

@property (strong, nonatomic) User *user1;
@end

@implementation LoginViewController


//-(instancetype)init
//{
//    self.user1 = [[User alloc]init];
//    [self.user1 loadUserInofFromSanbox];
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [GVColor hexStringToColor:@"#f2f2f2"];
//    NSLog(@"+++++++++%@",self.user1.birthday);
    
    [self setNav];
    [self theWay];
    [self setUpUI];
    
}
-(void)theWay{
    //获取屏幕大小
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    
    //初始化滚动视图
    self.theScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    _theScrollView.backgroundColor =[UIColor whiteColor] ;
    
    //设置滚动视图大小
    self.theScrollView.contentSize = CGSizeMake(width*2, height);
    self.theScrollView.pagingEnabled = YES;
    
    self.theScrollView.showsVerticalScrollIndicator = NO;
    self.theScrollView.delegate = self;
    
    [self.view addSubview:self.theScrollView];
}
-(void)setUpUI{
    _titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 79, ScreenWidth/2-60 , 30)];
    [_titleBtn setTitle:@"手机号快捷登录" forState:UIControlStateNormal];
    
    //设置颜色需要状态  后边
    [_titleBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal
     ];
    _titleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_titleBtn addTarget:self action:@selector(titleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_titleBtn];
    
    _titlePassBtn = [[UIButton alloc]initWithFrame:CGRectMake(_titleBtn.top + 130 , 79, ScreenWidth/2 - 60, 30)];
    [_titlePassBtn setTitle:@"账号密码登录" forState:UIControlStateNormal];

    //设置颜色需要状态  后边
    [_titlePassBtn setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal];
    [_titlePassBtn addTarget:self action:@selector(titlePassClick) forControlEvents:UIControlEventTouchUpInside];
    _titlePassBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_titlePassBtn];
    //输入框下边线条两条
    _topLine=[[UIButton alloc]initWithFrame:CGRectMake(_titleBtn.top-5, _titleBtn.bottom + 10, ScreenWidth/2 - 100, 1)];
    [_topLine setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    [self.view addSubview:_topLine];
    
    _bottomLine=[[UIButton alloc]initWithFrame:CGRectMake(_topLine.top + 115, _titlePassBtn.bottom + 10, ScreenWidth/2 - 115, 1)];
    [_bottomLine setBackgroundColor:[GVColor hexStringToColor:@"#888888"]];
    _bottomLine.hidden = YES;
    [self.view addSubview:_bottomLine];
    
    
    //输入框前面的图标
    _imagePhone = [[UIImageView alloc] initWithFrame:CGRectMake(18, _titleBtn.bottom + 50,15,22)];
    _imagePhone.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:_imagePhone];
    
    _imageCancel = [[UIImageView alloc] initWithFrame:CGRectMake(18, _titleBtn.bottom + 40+90,22,22)];
    _imageCancel.image = [UIImage imageNamed:@"cancel"];
    [self.view addSubview:_imageCancel];
    
    
    
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(50, _titleBtn.bottom + 40, ScreenWidth - 80, 40)];
    _userName.delegate = self;
    _userName.keyboardType = UITextBorderStyleLine;
    
//    _userName.placeholder = @"请输入您的手机号";
    
    _userName.text = @"18310441713";
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
    _password.placeholder = @"请输入您收到的验证码";
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
    
    _promptLable = [[UILabel alloc] initWithFrame:CGRectMake(25, _password.bottom+34, ScreenWidth, 40)];
    _promptLable.text = @"未注册账号的手机号，登录时将自动注册，且代表您已同意";
    _promptLable.font = [UIFont systemFontOfSize:12];
    _promptLable.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_promptLable];
    
    _promptBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, _promptLable.bottom - 10, 150, 30)];
    [_promptBtn setTitle:@"《点注册服务协议》" forState:UIControlStateNormal];
    [_promptBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    
    _promptBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [self.view addSubview:_promptBtn];
    //获取验证码按钮
    _textBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth -85 -12, _line.top - 50, 85 , 24)];
    [_textBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_textBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    [_textBtn.layer setCornerRadius:12]; //设置矩圆角半径
    [_textBtn.layer setBorderWidth:0.5];   //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [_textBtn.layer setBorderColor:colorref];//边框颜色
    _textBtn.layer.borderColor=[GVColor hexStringToColor:@"#ffba14"].CGColor;
    _textBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_textBtn addTarget:self action:@selector(obtainMessageBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_textBtn];
    
    
    //登录按钮
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, _lineTwo.bottom + 100, 225 , 33)];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    _loginBtn.layer.cornerRadius = 16.5;
    _loginBtn.layer.masksToBounds = YES;
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_loginBtn addTarget:self action:@selector(loginclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
    
    //找回密码按钮
    _findPassword = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth -85 -12, _line.top + 30, 85 , 24)];
//    _findPassword.backgroundColor = [UIColor greenColor];
    [_findPassword setTitle:@"找回密码" forState:UIControlStateNormal];
    [_findPassword setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    [_findPassword addTarget:self action:@selector(findPasswordClick) forControlEvents:UIControlEventTouchUpInside];
    _findPassword.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_findPassword];
    
    //记住密码
    _rememberPassword = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth -85 -12, _lineTwo.top + 10, 85 , 24)];
    [_rememberPassword setTitle:@"记住密码" forState:UIControlStateNormal];
    [_rememberPassword setTitleColor:[GVColor hexStringToColor:@"#999999"] forState:UIControlStateNormal];
    _rememberPassword.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:_rememberPassword];
    
    _findPassword.hidden = YES;
    _rememberPassword.hidden = YES;
    
    //选中按钮
    _circularBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth -85 -12, _lineTwo.bottom +16, 10 , 10)];
    [_circularBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [_circularBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
    [_circularBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_circularBtn];
    _circularBtn.hidden = YES;
    
    //输入框前面的图标
    _imageAccount = [[UIImageView alloc] initWithFrame:CGRectMake(18, _titleBtn.bottom + 50,22,22)];
    _imageAccount.image = [UIImage imageNamed:@"account"];
    [self.view addSubview:_imageAccount];
    _imageAccount.hidden = YES;
    _imagePassword = [[UIImageView alloc] initWithFrame:CGRectMake(18, _titleBtn.bottom + 40+90,22,22)];
    _imagePassword.image = [UIImage imageNamed:@"password"];
    [self.view addSubview:_imagePassword];
    _imagePassword.hidden = YES;
    
    
    _userNameC = [[UITextField alloc]initWithFrame:CGRectMake(50, _titleBtn.bottom + 40, ScreenWidth - 80, 40)];
    _userNameC.delegate = self;
    _userNameC.keyboardType = UITextBorderStyleLine;
    _userNameC.autocorrectionType = NO;
    _userNameC.autocapitalizationType = NO;
    _userNameC.placeholder = @"请输入您的账号";
    _userNameC.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    
    
    _userNameC.keyboardType = UIKeyboardTypeDefault;
    _userNameC.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _userNameC.returnKeyType =UIReturnKeyNext;
    _userNameC.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_userNameC];
    _userNameC.hidden = YES;
    
    _passwordC = [[UITextField alloc]initWithFrame:CGRectMake(50, _userName.bottom + 40, ScreenWidth - 80, 40)];
    _passwordC.delegate = self;
    _passwordC.keyboardType = UITextBorderStyleLine;
    //    _password.backgroundColor = [UIColor clearColor];
    _passwordC.placeholder = @"请输入您的密码";
    _passwordC.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _passwordC.secureTextEntry = YES;
    _passwordC.keyboardType = UIKeyboardTypeDefault;
    _passwordC.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passwordC.returnKeyType = UIReturnKeyDone;
    _passwordC.keyboardAppearance = UIKeyboardAppearanceDefault;
    [self.view addSubview:_passwordC];
    _passwordC.hidden = YES;
    //登录按钮
    _longinBtnTwo = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, _lineTwo.bottom + 50, 225 , 33)];
    [_longinBtnTwo setTitle:@"登录" forState:UIControlStateNormal];
    [_longinBtnTwo setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
    [_longinBtnTwo setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    _longinBtnTwo.layer.cornerRadius = 16.5;
    _longinBtnTwo.layer.masksToBounds = YES;
    _longinBtnTwo.titleLabel.font = [UIFont systemFontOfSize:17];
    [_longinBtnTwo addTarget:self action:@selector(loginPassword:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_longinBtnTwo];
    _longinBtnTwo.hidden = YES;
}

-(void)titleBtnClick{

    [_titlePassBtn setTitleColor:[GVColor hexStringToColor:@"#88888"] forState:UIControlStateNormal];
    [_titleBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal
     ];
    
    [_topLine setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    _bottomLine.hidden = YES;
    _topLine.hidden = NO;
    
    _shadowView.hidden = NO;
    _imagePhone.hidden = NO;
    _imageCancel.hidden = NO;
    _line.hidden = NO;
    _lineTwo.hidden = NO;
    _userName.hidden = NO;
    _password.hidden = NO;
    _promptLable.hidden = NO;
    _promptBtn.hidden = NO;
    _loginBtn.hidden = NO;
    _textBtn.hidden = NO;
    
    
    _longinBtnTwo.hidden = YES;
    _imageAccount.hidden = YES;
    _imagePassword.hidden = YES;
    _userNameC.hidden = YES;
    _passwordC.hidden = YES;
    
    _findPassword.hidden = YES;
    _rememberPassword.hidden = YES;
    _circularBtn.hidden = YES;
    
    _imageAccount.hidden = YES;
    _userNameC.hidden = YES;
    _passwordC.hidden = YES;
    _longinBtnTwo.hidden = YES;
     _imagePassword.hidden = YES;
}

-(void)titlePassClick{
    
    [_titlePassBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    [_titleBtn setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal
     ];
    _topLine.hidden = YES;
    [_bottomLine setBackgroundColor:[GVColor hexStringToColor:@"#ffba14"]];
    _bottomLine.hidden = NO;
    
    _shadowView.hidden = YES;
    _imagePhone.hidden = YES;
    _imageCancel.hidden = YES;
    _line.hidden = YES;
    _lineTwo.hidden = YES;
    _userName.hidden = YES;
    _password.hidden = YES;
    _promptLable.hidden = YES;
    _promptBtn.hidden = YES;
    _loginBtn.hidden = YES;
    _textBtn.hidden = YES;
    _findPassword.hidden = NO;
    _rememberPassword.hidden = NO;
    _circularBtn.hidden = NO;
    
    
    _imageAccount.hidden = NO;
    _userNameC.hidden = NO;
    _passwordC.hidden = NO;
    _longinBtnTwo.hidden = NO;
     _imagePassword.hidden = NO;
    
    _line = [[UIView alloc]initWithFrame:CGRectMake(18, _userName.bottom + 20, ScreenWidth - 26, 0.8)];
    _line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_line];
    _lineTwo = [[UIView alloc]initWithFrame:CGRectMake(18, _password.bottom + 20, ScreenWidth - 26, 0.8)];
    _lineTwo.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineTwo];

    
    
    
    
    
    
    
}
- (void)returnText:(ReturnTextBlock)block {
    self.returnTextBlock = block;
}
//参数
- (NSDictionary *)phoneCode{
    if (!_phoneCode) {
        _phoneCode = @{@"tel":self.userName.text};
    }
    return _phoneCode;
}
#define PhoneCode @"http://www.kdiana.com/index.php/home/seller/sendMessage"
#pragma mark- 获取验证码按钮
-(void)obtainMessageBtn:(UIButton *)sender{
    [countDown countDownWithButton:sender];
    [NetworkRequest requestForPhoneCodeUrl:PhoneCode parameters:@{@"tel":self.userName.text}Success:^(id success) {
        NSLog(@"$%@",success[@"message"]);
    } Failure:^(id failure) {
        NSLog(@"$%@",failure);
    }];
}

-(void)loginaa{
    //    //先判断输入框是否有内容
    
    //
    //
    //#define JudegPhone @"http://www.kdiana.com/index.php/Home/Seller/login"
    //    NSLog(@"md5%@",[NSString md5:_password.text]);
    //    NSDictionary *param = @{@"username":_userNameC.text,
    //                            @"password":[NSString md5:_password.text],
    //                            @"validate":@""};
    //    __block NSDictionary *result = nil;
    //    [[NetworkRequest shareInstance] POST:JudegPhone parameters:param Success:^(NSDictionary *success) {
    //        NSLog(@"success = %@",success);
    //        result = success;
    //    } Failure:^(id failure) {
    //        NSLog(@"error = %@",failure);
    //    }];
    //    if (result) {
    //        if ([result[@"code"] isEqualToString:@"005"]) {
    //            [SVProgressHUD showErrorWithStatus:@"密码错误"];
    //            [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
    //            return;
    //        }
    //        if ([result[@"code"] isEqualToString:@"004"]) {
    //            [SVProgressHUD showErrorWithStatus:@"账号不存在"];
    //            [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
    //            return;
    //        }
    //        if ([result[@"code"] isEqualToString:@"10008"]) {
    //            [SVProgressHUD showErrorWithStatus:@"验证码错误"];
    //            [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
    //            return;
    //        }
    //
    //        [self.navigationController popViewControllerAnimated:YES];
    //    }
    //
    //
    
}

#define JUDGECODE @"http://www.kdiana.com/index.php/home/seller/checkTelCaptcha"

#define SHOWUSERINFO @"http://www.kdiana.com/index.php/Home/Seller/showUserInfo"

#pragma mark- 登录按钮(验证码)
-(void)loginclick:(UIButton *)sender{
//    if (_userName.text.length ==  0 ) {
//        [SVProgressHUD showErrorWithStatus:@"请输入账号"];
//        [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
//        return;
//    }
//    if (_password.text.length == 0) {
//                [SVProgressHUD showErrorWithStatus:@"请输入验证码"];
//                [self performSelector:@selector(dismiss) withObject:nil afterDelay:3];
//                return;
//            }
//    else
//    {
//        [SVProgressHUD showWithStatus:@"正在登录..." maskType:SVProgressHUDMaskTypeCustom];
//        
//        NSDictionary *parameters = @{@"contact_tel":self.userName.text,@"sendCode":self.password.text};
//        [NetworkRequest requestForPhoneCodeUrl:JUDGECODE parameters:parameters Success:^(id success) {
//            NSLog(@"=============%@",success);
//            
//            NSString *str = [success objectForKey:@"message"];
//            NSLog(@"%@",str);
//            if ([str  isEqual: @"输入正确" ] ) {
//                
//                NSLog(@"我可以改换个人信息了在这个方法里");
//                if (self.returnTextBlock != nil) {
//                    
//                    self.returnTextBlock(@"我改变啦");
//                    
//                }
//                [self.navigationController popViewControllerAnimated:YES];
//                
//            }
//            
//            
//        } Failure:^(id failure) {
//            NSLog(@"%@",failure);
//        }];
//        
//    }
//    
//
//        [self performSelector:@selector(dismissAA) withObject:nil afterDelay:3];
    NSDictionary *parameters = @{@"contact_tel":self.userName.text,@"sendCode":self.password.text};
    [NetworkRequest requestForPhoneCodeUrl:JUDGECODE parameters:parameters Success:^(id success) {
        NSLog(@"=============%@",success);
        
        NSString *str = [success objectForKey:@"message"];
        NSLog(@"%@",str);
        if ([str  isEqual: @"输入正确" ] ) {
            
      NSLog(@"我可以改换个人信息了在这个方法里");
//     NSDictionary *par = @{@"userId":self.userName.text,@"sendCode":self.password.text,@"":};
            
            
            
            
            if (self.returnTextBlock != nil) {
                
                self.returnTextBlock(@"pomelo");
            }
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        
    } Failure:^(id failure) {
        NSLog(@"%@",failure);
    }];
}

//参数
- (NSDictionary *)parameters{
    if (!_parameters) {
        NSString *password = [NSString md5:_userNameC.text];
        _parameters = @{@"username":_passwordC.text,@"password":password};
    }
    return _parameters;
}

#define URL @"http://www.kdiana.com/index.php/Before/UserCenter/user_login"

#pragma mark- 登录按钮（密码）
-(void)loginPassword:(UIButton *)sender{
    [NetworkRequest LogininforRequestWithUrl:URL parameters:_parameters Success:^(id success) {
        NSLog(@"responseObject = %@",success);
        if ([success[@"code"] isEqualToString:@"200"]) {
            NSLog(@"账号密码登录成功");
        }
    } Failure:^(id failure) {
        NSLog(@"");
    }];
}
-(void)dismissAA{
    
    [SVProgressHUD dismiss];
    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)dismiss{
    [SVProgressHUD dismiss];
}

-(void)findPasswordClick{

//    findPassWordViewController *find = [[findPassWordViewController alloc] init];
//    [self.navigationController pushViewController:find animated:YES];
//
//
//    findPassWordViewController *find = [[findPassWordViewController alloc] init];
//    [self.navigationController pushViewController:find animated:YES];
    
}
//导航设置
- (void)setNav{
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"登录";
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

//选中按钮的方法（实心空心记住密码）
-(void)buttonClick:(UIButton *)button{
    button.selected = !button.selected;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [_userName resignFirstResponder];
    [_password resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_userName resignFirstResponder];
    [_password resignFirstResponder];
    return YES;
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
