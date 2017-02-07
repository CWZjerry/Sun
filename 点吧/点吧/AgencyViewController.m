//
//  AgencyViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AgencyViewController.h"

@interface AgencyViewController ()<UITextFieldDelegate>


@property (nonatomic ,strong) UILabel *companyNameLab;
@property (nonatomic ,strong) UILabel *cityLab;
@property (nonatomic ,strong) UILabel *addressLab;
@property (nonatomic ,strong) UILabel *menLab;
@property (nonatomic ,strong) UILabel *numberLab;
@property (nonatomic ,strong) UILabel *businessLicenseLab;
@property (nonatomic ,strong) UILabel *descriptionLab;

@property (nonatomic ,strong) UITextField *companyNameField;
@property (nonatomic ,strong) UITextField *cityField;
@property (nonatomic ,strong) UITextField *addressField;
@property (nonatomic ,strong) UITextField *menField;
@property (nonatomic ,strong) UITextField *numberField;
@property (nonatomic ,strong) UIButton *businessLicenseBtn;
@property (nonatomic ,strong) UITextField *descriptionField;

@property (nonatomic ,strong) UIView * lineOne;
@property (nonatomic ,strong) UIView * lineTwo;
@property (nonatomic ,strong) UIView * lineThree;
@property (nonatomic ,strong) UIView * lineFour;
@property (nonatomic ,strong) UIView * lineFive;
@property (nonatomic ,strong) UIView * lineSix;



@end

@implementation AgencyViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNav];
    [self setUpUI];
    
}
//UI界面
-(void)setUpUI{
    _companyNameLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, 100, 20)];
    _companyNameLab.text = @"公司名称";
    _companyNameLab.font = [UIFont systemFontOfSize:20];
    _companyNameLab.textColor = [UIColor blackColor];
    [self.view addSubview:_companyNameLab];
    
    _companyNameField = [[UITextField alloc]initWithFrame:CGRectMake(110, 80, ScreenWidth - 80, 40)];
    _companyNameField.delegate = self;
    _companyNameField.keyboardType = UITextBorderStyleLine;
    
    _companyNameField.placeholder = @"请输入公司名称";
    _companyNameField.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _companyNameField.keyboardType = UIKeyboardTypeDefault;
    _companyNameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _companyNameField.returnKeyType =UIReturnKeyNext;
    _companyNameField.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_companyNameField];
    
    
    _lineOne = [[UIView alloc]initWithFrame:CGRectMake(18, _companyNameField.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineOne.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineOne];
    
    
    _cityLab = [[UILabel alloc] initWithFrame:CGRectMake(10,_lineOne.bottom + 26 ,  100, 20)];
    _cityLab.text = @"所在城市";
    _cityLab.font = [UIFont systemFontOfSize:20];
    _cityLab.textColor = [UIColor blackColor];
    [self.view addSubview:_cityLab];
    
    _cityField = [[UITextField alloc]initWithFrame:CGRectMake(110,_lineOne.bottom + 20 , ScreenWidth - 80, 40)];
    _cityField.delegate = self;
    _cityField.keyboardType = UITextBorderStyleLine;
    
    _cityField.placeholder = @"选择所在的城市>";
    _cityField.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _cityField.keyboardType = UIKeyboardTypeDefault;
    _cityField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _cityField.returnKeyType =UIReturnKeyNext;
    _cityField.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_cityField];
    
    
    _lineTwo = [[UIView alloc]initWithFrame:CGRectMake(18, _cityField.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineTwo.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineTwo];
    
    
    _addressLab = [[UILabel alloc] initWithFrame:CGRectMake(10,_lineTwo.bottom + 26 ,  100, 20)];
    _addressLab.text = @"公司地址";
    _addressLab.font = [UIFont systemFontOfSize:20];
    _addressLab.textColor = [UIColor blackColor];
    [self.view addSubview:_addressLab];
    
    _addressField = [[UITextField alloc]initWithFrame:CGRectMake(110,_lineTwo.bottom + 20 , ScreenWidth - 80, 40)];
    _addressField.delegate = self;
    _addressField.keyboardType = UITextBorderStyleLine;
    
    _addressField.placeholder = @"请输入公司地址";
    _addressField.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _addressField.keyboardType = UIKeyboardTypeDefault;
    _addressField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _addressField.returnKeyType =UIReturnKeyNext;
    _addressField.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_addressField];
    
    
    _lineThree = [[UIView alloc]initWithFrame:CGRectMake(18, _addressField.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineThree.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineThree];
    
    
    _menLab = [[UILabel alloc] initWithFrame:CGRectMake(20,_lineThree.bottom + 26 ,  100, 20)];
    _menLab.text = @"负责人";
    _menLab.font = [UIFont systemFontOfSize:20];
    _menLab.textColor = [UIColor blackColor];
    [self.view addSubview:_menLab];
    
    _menField = [[UITextField alloc]initWithFrame:CGRectMake(110,_lineThree.bottom + 20 , ScreenWidth - 80, 40)];
    _menField.delegate = self;
    _menField.keyboardType = UITextBorderStyleLine;
    
    _menField.placeholder = @"请输入负责人名字";
    _menField.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _menField.keyboardType = UIKeyboardTypeDefault;
    _menField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _menField.returnKeyType =UIReturnKeyNext;
    _addressField.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_menField];
    
    
    _lineFour = [[UIView alloc]initWithFrame:CGRectMake(18, _menField.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineFour.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineFour];
    
    _numberLab = [[UILabel alloc] initWithFrame:CGRectMake(10,_lineFour.bottom + 26 ,  100, 20)];
    _numberLab.text = @"联系电话";
    _numberLab.font = [UIFont systemFontOfSize:20];
    _numberLab.textColor = [UIColor blackColor];
    [self.view addSubview:_numberLab];
    
    _numberField = [[UITextField alloc]initWithFrame:CGRectMake(110,_lineFour.bottom + 20 , ScreenWidth - 80, 40)];
    _numberField.delegate = self;
    _numberField.keyboardType = UITextBorderStyleLine;
    
    _numberField.placeholder = @"请输入联系电话";
    _numberField.textColor = [GVColor hexStringToColor:@"#bbbbbb"];
    _numberField.keyboardType = UIKeyboardTypeDefault;
    _numberField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _numberField.returnKeyType =UIReturnKeyNext;
    _numberField.keyboardAppearance=UIKeyboardAppearanceDefault;
    [self.view addSubview:_numberField];
    
    
    _lineFive = [[UIView alloc]initWithFrame:CGRectMake(18, _numberField.bottom + 10, ScreenWidth - 26, 0.8)];
    _lineFive.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineFive];
    
    _businessLicenseLab = [[UILabel alloc] initWithFrame:CGRectMake(10,_lineFive.bottom + 26 ,  100, 20)];
    _businessLicenseLab.text = @"营业执照";
    _businessLicenseLab.font = [UIFont systemFontOfSize:20];
    _businessLicenseLab.textColor = [UIColor blackColor];
    [self.view addSubview:_businessLicenseLab];
    
    _businessLicenseBtn = [[UIButton alloc] initWithFrame:CGRectMake(93 ,_lineFive.bottom + 20, 100, 30)];
    [_businessLicenseBtn setTitle:@"添加照片" forState:UIControlStateNormal];
    [_businessLicenseBtn setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
    _businessLicenseBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_businessLicenseBtn];

    _lineSix = [[UIView alloc]initWithFrame:CGRectMake(18, _businessLicenseLab.bottom + 20, ScreenWidth - 26, 0.8)];
    _lineSix.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [self.view addSubview:_lineSix];
    
    
    _descriptionLab = [[UILabel alloc] initWithFrame:CGRectMake(10,_lineSix.bottom + 26 ,  100, 20)];
    _descriptionLab.text = @"附加描述";
    _descriptionLab.font = [UIFont systemFontOfSize:20];
    _descriptionLab.textColor = [UIColor blackColor];
    [self.view addSubview:_descriptionLab];
    
}
-(void)setNav{
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"代理加盟";
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
