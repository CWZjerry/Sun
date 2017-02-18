//
//  AddViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AddViewController.h"

#import "AddView.h"

@interface AddViewController ()

{
    AddView *subView;
}
@property (nonatomic ,strong) UIButton *circularBtn;
@property (nonatomic ,strong) UIButton *circularWOBtn;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    subView =[[AddView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
//    self.view=subView;
    [self.view addSubview:subView];
    //选中按钮
    _circularBtn = [[UIButton alloc] initWithFrame:CGRectMake(285, 110, 10 , 10)];
    [_circularBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [_circularBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
    [_circularBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_circularBtn];
    
    _circularWOBtn = [[UIButton alloc] initWithFrame:CGRectMake(350, 110, 10 , 10)];
    [_circularWOBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [_circularWOBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
    [_circularWOBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_circularWOBtn];
    

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
    
    
    
}
//选中按钮的方法（实心空心记住密码）
-(void)buttonClick:(UIButton *)button{
    button.selected = !button.selected;
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
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
