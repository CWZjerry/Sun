//
//  AddView.h
//  点吧
//
//  Created by Jenny on 2017/1/10.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddView : UIView

@property (nonatomic ,strong) UIView *vieww; //底视图

@property (nonatomic,strong)UITextField *fieldName,*fieldNumber;

@property (nonatomic ,strong) UITextView *fieldAddress;

@property (nonatomic ,strong) UILabel *namelable ,* numberLable , *addressLable;

@property (nonatomic ,strong) UILabel *OneLable, *twoLabel;

@property (nonatomic ,strong) UILabel *sirLabel,* madamLabel;

@property (nonatomic ,strong) UIButton * btna , *btnb;


@end
