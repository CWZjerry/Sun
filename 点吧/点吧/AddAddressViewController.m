//
//  ReturnViewController.m
//  点吧
//
//  Created by Jenny on 2017/2/8.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "AddAddressViewController.h"
#import "AddView.h"

#define ADDADDRESSURL @"http://www.kdiana.com/index.php/Before/Orders/address_add"
@interface AddAddressViewController ()

@property (nonatomic, strong) NSDictionary *myDic;

@property (nonatomic, strong) AddView *addAddressView;

@end

@implementation AddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    [self.view addSubview:self.addAddressView];
    self.navigationItem.title = @"添加地址";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"the-arrow-"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    
    
}
- (void)backClick:(UIButton *)but{
    [self.navigationController popViewControllerAnimated:YES];
}

- (AddView *)addAddressView{
    if (!_addAddressView) {
        _addAddressView =[[[NSBundle mainBundle] loadNibNamed:@"AddressAdd" owner:self options:nil] lastObject];
        [_addAddressView.commitButton addTarget:self action:@selector(commitClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    return _addAddressView;
    
    
}

- (void)commitClick:(UIButton *)but{
   
  
    
    [NetworkRequest Post:ADDADDRESSURL parameters:self.myDic success:^(id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSError *error) {
        
    }];
   
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (NSDictionary *)myDic{
    if (!_myDic) {
        NSUserDefaults * defaults =[NSUserDefaults standardUserDefaults];
        NSString *str =[defaults objectForKey:@"UserId"];
        
        NSInteger kk =0;
       // if (self.addAddressView.manButton.selected) {
       //     kk =1;
      //  }else if (self.addAddressView.womanButton.selected){
        //    kk =2;
       // }else{
       //     kk =0;
      //  }
        
        
        _myDic =@{@"user_id":str,@"takeout_address":self.addAddressView.Address.text,@"username":self.addAddressView.Name.text,@"sex":[NSString stringWithFormat:@"%ld",(long)kk],@"tel":self.addAddressView.phoneNumber.text,@"state":@"0"};
    }
    return _myDic;
}

@end
