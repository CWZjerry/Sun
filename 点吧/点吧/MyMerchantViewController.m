//
//  MyMerchantViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "MyMerchantViewController.h"

@interface MyMerchantViewController ()
@property (nonatomic ,strong) UIImageView *imageAll; //背景图片


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
  
}


////导航设置
//- (void)setNav{
//    
//    self.navigationController.navigationBarHidden = NO;
//    [self.navigationItem setHidesBackButton:YES];
//    self.navigationItem.title = @"我的商家";
//    //导航字体颜色
//    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
//    // 设置导航默认标题的颜色及字体大小
//    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor blackColor], UITextAttributeFont:[UIFont boldSystemFontOfSize:20]};
//    
//    //导航添加的按钮颜色
//    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
//    // 导航栏背景颜色
//    [self.navigationController.navigationBar setBarTintColor:[GVColor hexStringToColor:@"ffba14"]];
//    
//    
//    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
//    
//    self.navigationItem.leftBarButtonItem=backBtn;
//}
//导航按钮点击方法
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
