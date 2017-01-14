//
//  AddView.m
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AddView.h"

@implementation AddView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self addSubview:self.namelable];
        [self addSubview:self.numberLable];
        [self addSubview:self.addressLable];

        [self addSubview:self.fieldName];
        [self addSubview:self.fieldNumber];
        [self addSubview:self.fieldAddress];
        [self addSubview:self.vieww];
        
        [self addSubview:self.OneLable];
        [self addSubview:self.twoLabel];
        
        [self addSubview:self.sirLabel];
        [self addSubview:self.madamLabel];
       
        [self addSubview:self.btna];
        [self addSubview:self.btnb];
        
    }
    return self;
}
-(UILabel *)namelable
{
    if (!_namelable) {
        _namelable = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 100, 20)];
        _namelable.text = @"姓名";
        _namelable.font = [UIFont systemFontOfSize:20];
        _namelable.textColor = [UIColor blackColor];
        
    }
    return _namelable;
}
-(UILabel *)sirLabel
{
    if (!_sirLabel) {
        _sirLabel = [[UILabel alloc] initWithFrame:CGRectMake(_fieldName.top + 260 , 40, 50, 20)];
        _sirLabel.text = @"先生";
        _sirLabel.font = [UIFont systemFontOfSize:18];
        _sirLabel.textColor = [UIColor blackColor];
        
    }
    return _sirLabel;
}
-(UILabel *)madamLabel
{
    if (!_madamLabel) {
        _madamLabel = [[UILabel alloc] initWithFrame:CGRectMake(_sirLabel.top+ 330, 40, 100, 20)];
        _madamLabel.text = @"女士";
        _madamLabel.font = [UIFont systemFontOfSize:18];
        _madamLabel.textColor = [UIColor blackColor];
        
    }
    return _madamLabel;
}
-(UIButton *)btna
{
    if (_btna) {
        _btna = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100 , 100)];
        [_btna setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
        [_btna setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
        [_btna addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _btna.backgroundColor = [UIColor greenColor];
    }
    return _btna;
}
-(UIButton *)btnb
{
    if (_btnb) {
        _btnb = [[UIButton alloc] initWithFrame:CGRectMake(_madamLabel.top -10, 40, 10 , 10)];
        [_btnb setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
        [_btnb setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
        [_btnb addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnb;
}
-(UILabel *)OneLable
{
    if (!_OneLable) {
        _OneLable=[[UILabel alloc]initWithFrame:CGRectMake(0, _namelable.bottom + 10, ScreenWidth, 0.5)];
        [_OneLable setBackgroundColor: [GVColor hexStringToColor:@"dddddd"]];
        
    }
    return _OneLable;
}
-(UILabel *)numberLable
{
    if (!_numberLable) {
        _numberLable = [[UILabel alloc] initWithFrame:CGRectMake(10, _namelable.bottom + 25, 100, 20)];
        _numberLable.text = @"联系电话";
        _numberLable.font = [UIFont systemFontOfSize:20];
        _numberLable.textColor = [UIColor blackColor];
    }
    return _numberLable;
}
-(UILabel *)twoLabel
{
    if (!_twoLabel) {
        _twoLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, _numberLable.bottom + 10, ScreenWidth, 0.5)];
        [_twoLabel setBackgroundColor: [GVColor hexStringToColor:@"dddddd"]];
        
    }
    return _twoLabel;
}

-(UILabel *)addressLable
{
    if (!_addressLable) {
        _addressLable = [[UILabel alloc] initWithFrame:CGRectMake(10, _numberLable.bottom + 25, 100, 30)];
        _addressLable.text = @"收货地址";
        _addressLable.textColor = [UIColor blackColor];
        _addressLable.font = [UIFont systemFontOfSize:20];
        
    }
    return _addressLable;
}

- (UITextField *)fieldName
{
    if (!_fieldName) {
        _fieldName = [[UITextField alloc]initWithFrame:CGRectMake(_numberLable.top + 25, 40, 160, 25)];
        _fieldName.placeholder = @"您的姓名";
//        _fieldName.backgroundColor=[UIColor lightGrayColor];
    }
    return _fieldName;
    
}

- (UITextField *)fieldNumber
{
    if (!_fieldNumber) {
        _fieldNumber = [[UITextField alloc]initWithFrame:CGRectMake(_numberLable.top + 25, _fieldName.bottom + 20, 300, 25)];
        _fieldNumber.placeholder = @"您的手机号";
//        _fieldNumber.backgroundColor = [UIColor greenColor];
        
    }
    return _fieldNumber;
}
-(UITextView *)fieldAddress
{
    if (!_fieldAddress) {
        _fieldAddress = [[UITextView alloc] initWithFrame:CGRectMake(_addressLable.top + 25, _fieldNumber.bottom + 20, 300, 20)];
//        _fieldAddress.backgroundColor = [UIColor greenColor];
        
    }
    return _fieldAddress;
}


-(UIView *)view
{
    if (!_vieww) {
        _vieww = [[UIView alloc] initWithFrame:CGRectMake(0, 5, self.view.frame.size.width, 300)];
        _vieww.backgroundColor = [UIColor purpleColor];
        
    }
    return _vieww;
}

//选中按钮的方法（实心空心记住密码）
-(void)buttonClick:(UIButton *)button{
    button.selected = !button.selected;
}



@end
