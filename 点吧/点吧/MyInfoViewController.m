//
//  MyInfoViewController.m
//  点吧
//
//  Created by Jenny on 2017/1/3.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "MyInfoViewController.h"
#import "MyInfoView.h"
#import "MySelfViewController.h"
#import "User.h"

#import "ZHDatePickerView.h"


@interface MyInfoViewController () <UITableViewDataSource,UITableViewDelegate,ZHDatePickerViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    MyInfoView *myView;
    NSArray *sectionOne;
    NSArray *sectionTwo;
}
@property (nonatomic ,strong) UIButton *leaveBtn;

@property (nonatomic,copy) NSString *savePath;

@property (nonatomic, strong) UIButton *dateButton;

@property(nonatomic,strong)UIButton *btn;
@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    myView = [[MyInfoView alloc] initWithFrame:self.view.frame];
    
    self.view = myView;
    
    sectionOne = @[@"头像",
                   @"昵称",
                   @"生日"
                   ];
    
    sectionTwo = @[@"电话",
                   @"密码"
                   ];
    
    myView.myTable.delegate = self;
    myView.myTable.dataSource = self;
    
    
}
//导航设置
- (void)setNav{
    
    self.navigationController.navigationBarHidden = NO;
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.title = @"我的消息";
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        default:
            return 1;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cellid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = sectionOne[indexPath.row];
            switch (indexPath.row) {
                case 0:
                {
                    UIButton *btn=[[UIButton alloc]init];
                    btn.frame=CGRectMake(ScreenWidth - 90, 0, 70, 70);
                    btn.layer.cornerRadius = 35;
                    btn.layer.masksToBounds = YES;
                    [btn addTarget:self action:@selector(setup) forControlEvents:UIControlEventTouchUpInside];
                    [cell addSubview:btn];
                    self.btn=btn;
                    
                }
                    break;
                case 1:
                {
                    User *kk = [[User alloc]init];
                    [kk saveUserInofFromSanbox];
//                    NSLog(@"<<<<<<>>>>>>%@",[kk loadUserInofFromSanbox:kk.defts]);
                    cell.detailTextLabel.text =[kk loadUserInofFromSanbox:kk.defts];
                    
//                    NSLog(@"1111111111");
                    
                }
                    break;
                case 2:
                {
                    UIButton *dateButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 150, 0, 120, 60)];
                    [dateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [dateButton setTitle:nil forState:UIControlStateNormal];
                    [dateButton addTarget:self action:@selector(showPickViewerAction) forControlEvents:UIControlEventTouchUpInside];
                    self.dateButton = dateButton;
                    
                    [cell addSubview:dateButton];
                    
                    
                }
                    break;
                    
                default:
                    break;
            }
            
            break;
        case 1:
            cell.textLabel.text = sectionTwo[indexPath.row];
            
            switch (indexPath.row) {
                case 0:
                    
                    break;
                case 1:
                    
                    break;
                default:
                    break;
            }
            
            break;
            
        case 2:
            cell.accessoryType = 0;
            
            _leaveBtn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth-225)/2, 5 , 225 , 60)];
            [_leaveBtn setTitle:@"退出登录" forState:UIControlStateNormal];
            [_leaveBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
            
            
            _leaveBtn.titleLabel.font = [UIFont systemFontOfSize:17];
            [_leaveBtn addTarget:self action:@selector(leaveBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell addSubview:_leaveBtn];
            
            break;
        default:
            break;
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                
                return 100;
            }else {
                return 60;
            }
            break;
            
        default:
            
            return 60;
            break;
    }
    
}
- (void)setup
{
    UIAlertController *aler=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //从相机选取
    UIAlertAction *album=[UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.allowsEditing=YES;
        picker.delegate=self;
        [self presentViewController:picker animated:YES completion:nil];
        
       
    }];
    //从相机选取
    UIAlertAction *camera=[UIAlertAction actionWithTitle:@"相机拍摄" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.allowsEditing=YES;
        picker.delegate=self;
        [self presentViewController:picker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *cancl=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [aler addAction:cancl];
    [aler addAction:album];
    [aler addAction:camera];
    [self presentViewController:aler animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    [self.btn setImage:image forState:UIControlStateNormal];
    //选取完图片之后关闭视图
    [self dismissViewControllerAnimated:YES completion:nil];
}

//时间选择器
- (void)showPickViewerAction
{
    ZHDatePickerView *pickerView = [[ZHDatePickerView alloc] initDatePickerWithDefaultDate:nil andDatePickerMode:UIDatePickerModeDate];
  
    pickerView.delegate = self;
    [pickerView showw];

}

- (void)pickerView:(ZHDatePickerView *)pickerView didSelectDateString:(NSString *)dateString
{
    [self.dateButton setTitle:dateString forState:UIControlStateNormal];
}



//////////////////////


- (void)returnText:(ReturnTextBlock)block {
    self.returnTextBlock = block;
}


/////////////////////
//退出登录
-(void)leaveBtn:(UIButton *)sender{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注销" message:@"确定要注销登录吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    [alert show];
    
}
- (NSString *)savePath {
    
    if (!_savePath) {
        
        _savePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:NSStringFromClass([self class])];
        
        [[NSFileManager defaultManager] createDirectoryAtPath:_savePath withIntermediateDirectories:NO attributes:nil error:nil];
        
    }
    
    return _savePath;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        //        [[UserInfoManager share] logoutUserInfo];
        
        
        //        MySelfViewController *my = [[MySelfViewController alloc]init];
        //
        //        [UIApplication sharedApplication].keyWindow.rootViewController = my;
//        NSString *loginInfoPath = [self.savePath stringByAppendingPathComponent:];
//         [[NSFileManager defaultManager] removeItemAtPath:loginInfoPath error:nil];
        self.returnTextBlock(@"登录/注册");
        User *user = [[User alloc] init];
        NSMutableData *data = [NSMutableData data];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:user forKey:@"123"];
        [archiver finishEncoding];

        
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(void)backClick{
//    NSLog(@"我保存发的东西返回去");
    
    
    User *uuser = [[User alloc]init];
    [uuser saveUserInofFromSanbox];
    [self.navigationController popViewControllerAnimated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.0001;
}




@end
