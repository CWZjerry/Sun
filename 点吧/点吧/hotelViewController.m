//
//  hotelViewController.m
//  点吧
//
//  Created by Jerry on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "hotelViewController.h"
#import "hoteRequest.h"
#import "hoteModel.h"
#import "UILabel+LabelFrame.h"
#import "hotPotViewController.h"

#import "hoteTableViewCell.h"
#import "sideTableViewCell.h"
#import "baseCell.h"

#import "specificsViewController.h"
#import "OrderSubMitViewController.h"
#import "HomeViewController.h"
#import "ThrowLineTool.h"
#import "GVColor.h"

@interface hotelViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,ThrowLineToolDelegate,CAAnimationDelegate,hotelDelegate,baseCellDelegate>
{
    NSArray * _infoArr;//右侧Arr
    NSArray * _typeArr;//左侧Arr
    NSArray * _tmpAll;//关联Arr
    
    NSArray * _takeInfo;//右侧外卖Arr
    NSArray * _takeTypeArr;//左侧外卖Arr;
    NSArray * _takeOut;//外卖Arr
    
    NSArray * _boolArr;//判断模式数组
    NSArray * _boolInfo;//右侧Arr
    NSArray * _boolType;//左侧Arr
    
    NSMutableArray * _clearingArr;//结算数组
    NSMutableArray * _subArr;//减后结算的数组
    NSMutableArray * _specArr;//菜品详情数组
    
    BOOL _isSelectColor ;
}
@property(nonatomic,strong) UISearchBar * headerSearchBar;//头视图搜索条

@property(nonatomic,strong) UITableView * hotelTableView;//右侧tableView
@property(nonatomic,strong) UITableView * sideTableView;//左侧tableView
@property(nonatomic,strong) UITableView * baseTableView;//底部tableView

@property(nonatomic,strong) UIView * baseView;//底部弹出View
@property(nonatomic,strong) UIView * navigationView;//代替导航View
@property(nonatomic,strong) UIView * animationView;//小红点动画View
@property(nonatomic,strong) UIView * backgroundView;//背景view
@property(nonatomic,strong) UIView * sideBackGorundView;//侧滑出现的背景

@property(nonatomic,strong) UIImageView * moneyImg;
@property(nonatomic,strong) UIImageView * shopImg; //购物车图片

@property(nonatomic,strong) UILabel * navTitle;//代替导航的标题
@property(nonatomic,strong) UILabel * moneyLabel;//结算总数
@property(nonatomic,strong) UILabel * countLabel; //购物数量
@property(nonatomic,strong) UILabel * baseCountLabel;//结算tableView购物数量
@property(nonatomic,strong) UILabel * totalNumLabel;//底部结算num


@property(nonatomic,strong) UIButton * takeBtn;//切换模式按钮

@property(nonatomic,strong) UISwipeGestureRecognizer * swipeLeft;//侧滑手势
@property(nonatomic,strong) UITapGestureRecognizer * tapRecognizer;//点按手势
@property(nonatomic,strong) UITapGestureRecognizer * tapRemo;//点按消失手势

@property(nonatomic,assign) NSInteger num;//菜品数量
@property(nonatomic,assign) NSInteger numTwo;//菜品数量
@property(nonatomic,assign) NSInteger countLabelTwo;
@property(nonatomic,assign) CGFloat priceNumber;//价格

@property(nonatomic,strong) NSMutableArray<CALayer *> *redLayers;//动画

@property(nonatomic,assign) BOOL isSide;//缩放Bool值
@property(nonatomic,assign) BOOL isSwitch;//切换堂食和外卖模式



@end

@implementation hotelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     _isSwitch = NO;//判断模式
    
    _clearingArr = [NSMutableArray array];
    _subArr = [NSMutableArray array];
    _specArr = [NSMutableArray array];
    self.priceNumber = 0.0;
    //self.num = 0;
    
    //[self.view addSubview:_animationView];//动画红点view

    [ThrowLineTool sharedTool].delegate=self;//签单例代理
    
    [self.view addSubview:self.hotelTableView];
    [self.view addSubview:self.sideTableView];
    
    [self sideBtn];
    [self shopBtn];
    [self.view addSubview:self.navigationView];
    [self.view addSubview:self.backgroundView];
    [self.view addSubview:self.sideBackGorundView];
    [self.view addSubview:self.baseView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    //self.idDic
    NSDictionary *dic= [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"store_id", nil] ;

    //堂食模式
    [hoteRequest GetWithRequest:^(id Value, id typeValue, id arrAll) {
        
        _infoArr = Value;
        _typeArr = typeValue;
        _tmpAll = arrAll;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.hotelTableView reloadData];
            [self.sideTableView reloadData];
        });
        
    } dicSTR:dic failure:nil];
    
    
}
#pragma mark --侧滑按钮
-(void)sideBtn
{
    UIButton *sideBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    sideBtn.frame=CGRectMake(ZeroFrame, HeightBounds/2-40, 26, 80);
    [sideBtn setImage:[UIImage imageNamed:@"rowing_to_starboard"] forState:UIControlStateNormal];
    [sideBtn addTarget:self action:@selector(sideClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sideBtn];
}
//侧滑按钮缩放事件
-(void)sideClick:(UIButton *)sender
{
    if(self.isSide == NO)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            //背景的偏移量
            CGRect rect  = _sideBackGorundView.frame ;
            rect.origin.x = WidthBounds-140 ;
            _sideBackGorundView.frame = rect ;
            
            //设置平移量
            self.hotelTableView.transform = CGAffineTransformMakeTranslation(235, 0);
            self.sideTableView.transform = CGAffineTransformMakeTranslation(235, 0);
            
                    }];
        self.isSide = YES;
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            //操作之后进行还原
            self.hotelTableView.transform =CGAffineTransformIdentity;
            self.sideTableView.transform = CGAffineTransformIdentity;
            
            //背景的偏移量
            CGRect rect  = _sideBackGorundView.frame ;
            rect.origin.x = WidthBounds ;
            _sideBackGorundView.frame = rect ;
            
        }];
        self.isSide = NO;
    }
}
-(UISearchBar *)headerSearchBar
{
    if(_headerSearchBar == nil)
    {
        _headerSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(22.5, 15, 190, 25)];
        // 1.设置背景色
        //设置背景图去掉上下黑线
        _headerSearchBar.backgroundImage = [[UIImage alloc]init];
        //背景颜色设置为白色
        _headerSearchBar.barTintColor = [UIColor whiteColor];
        _headerSearchBar.placeholder = @"请输入...";
        /*
         2.设置边框颜色和圆角(通过KVC的方法获得UISearchBar的私有变量searchField(UITextField类型),所以设置search的边框就是设置了UITextField的边框)
         */
        UITextField *searchField = [self.headerSearchBar valueForKey:@"searchField"];
        if(searchField)
        {
            [searchField setBackgroundColor:[UIColor whiteColor]];
            searchField.layer.cornerRadius = 12.5;
            searchField.layer.borderWidth = 3;
            searchField.layer.borderColor = [GVColor hexStringToColor:@"#cccccc"].CGColor;
            searchField.textColor = [UIColor blackColor];
            searchField.font = [UIFont systemFontOfSize:15];
            searchField.layer.masksToBounds = YES;
            //修改光标颜色
            searchField.tintColor = [GVColor hexStringToColor:@"#cccccc"];
        }
    }
    return _headerSearchBar;
}
#pragma mark -- 购物车控件
-(void)shopBtn
{
    _moneyImg = [[UIImageView alloc]initWithFrame:CGRectMake(WidthBounds-128, HeightBounds-38, 90, 22)];
    _moneyImg.image = [UIImage imageNamed:@"money"];
    [self.view addSubview:_moneyImg];
    
    //结算总价格
    NSString *str = @"  0.00     ";
    _moneyLabel = [[UILabel alloc]init];
    _moneyLabel.textColor = [GVColor hexStringToColor:@"#333333"];
    _moneyLabel.text = [NSString stringWithFormat:@"%@",str];
    _moneyLabel.font = [UIFont systemFontOfSize:12];
    CGFloat widthLabel = [UILabel getWidthWithTitle:_moneyLabel.text font:_moneyLabel.font];
    _moneyLabel.frame = CGRectMake(5, 5, widthLabel, 12);
    [_moneyImg addSubview:_moneyLabel];
    
    //购物车图片
    _shopImg = [[UIImageView alloc]initWithFrame:CGRectMake(WidthBounds-70, HeightBounds-71, 61, 61)];
    _shopImg.image = [UIImage imageNamed:@"shopping_cart"];
    _shopImg.userInteractionEnabled = YES;
    //添加点按手势
    _tapRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSender:)];
    //把点按手势添加到图片上
    [_shopImg addGestureRecognizer:self.tapRecognizer];
    [self.view addSubview:_shopImg];
    
    //购物数量
    _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 13, 14, 14)];
    _countLabel.backgroundColor = [UIColor redColor];
    _countLabel.layer.cornerRadius = 7;
    _countLabel.layer.borderWidth = 0;
    _countLabel.layer.masksToBounds = YES;
    _countLabel.textAlignment = NSTextAlignmentCenter;
    //_countLabel.hidden = YES;//是否将其隐藏
    _countLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
    _countLabel.font = [UIFont systemFontOfSize:11];
    [_shopImg addSubview:_countLabel];
}
#pragma mark -- 头视图控件
-(UIView *)headNavigation
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 151)];
    headView.userInteractionEnabled = YES;//开启用户交互
    //添加侧滑手势
    _swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSide)];
    _swipeLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [headView addGestureRecognizer:_swipeLeft];
    
    //店铺背景图
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 141)];
    [bgImgView sd_setImageWithURL:[NSURL URLWithString:self.store_photo] placeholderImage:[UIImage imageNamed:@"img1"]];
    //设置为高斯模糊
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, bgImgView.frame.size.width, bgImgView.frame.size.height);
    [bgImgView addSubview:effectView];
    [headView addSubview:bgImgView];
    
    //店铺图片
    UIImageView * userImage = [[UIImageView alloc]initWithFrame:CGRectMake(12, 44, 55, 55)];
    [userImage sd_setImageWithURL:[NSURL URLWithString:self.store_photo] placeholderImage:[UIImage imageNamed:@"img1"]];
    userImage.layer.cornerRadius = 26;
    userImage.layer.masksToBounds = YES;
    [headView addSubview:userImage];
    
    //店铺名字
    UILabel * hotelLabel =[[UILabel alloc]initWithFrame:CGRectMake(77, 43, 0, 0)];
    hotelLabel.text =self.store_name;
    hotelLabel.font = [UIFont systemFontOfSize:19];
    hotelLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
    //自适应宽度
    CGFloat hotelWidth = [UILabel getWidthWithTitle:hotelLabel.text font:hotelLabel.font];
    hotelLabel.frame = CGRectMake(77, 43, hotelWidth, 19);
    [headView addSubview:hotelLabel];
    
    //店铺简介
    UILabel * hotelLabelTwo =[[UILabel alloc]initWithFrame:CGRectMake(77, 65, WidthBounds-90, 38)];
    hotelLabelTwo.text =@"人最伟大，得人心者就会得到一切。得财富者失人心，财富也失。故此我们要结好人缘。坚定的信心，能使平凡的人们，做出惊人的事业。对于凌驾命运之上的人来说，信心就是生命的主宰。－－海伦·凯勒";
    hotelLabelTwo.font = [UIFont systemFontOfSize:13];
    hotelLabelTwo.textColor = [GVColor hexStringToColor:@"#eeeeee"];
    hotelLabelTwo.textAlignment = NSTextAlignmentLeft;
    //自动折行设置
    hotelLabelTwo.lineBreakMode = 0;//以单词为单位换行
    hotelLabelTwo.lineBreakMode = 4;//尾部显示...
    hotelLabelTwo.numberOfLines = 0;//是否显示多行
    [headView addSubview:hotelLabelTwo];
    
    //背景
    UILabel * backLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 121, WidthBounds, 20)];
    backLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [headView addSubview:backLabel];
    
    //优惠图标
    UIImageView *favorImage =[[UIImageView alloc]initWithFrame:CGRectMake(12, 122.5, 17, 17)];
    favorImage.image = [UIImage imageNamed:@"benefit"];
    [headView addSubview:favorImage];
    
    //优惠券
    UILabel *favorLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 122.5, 0, 0)];
    favorLabel.text =@"满100减10元,满200减30元.";
    favorLabel.font = [UIFont systemFontOfSize:14];
    favorLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
    CGFloat favorLabelTwo =[UILabel getWidthWithTitle:favorLabel.text font:favorLabel.font];
    favorLabel.frame =CGRectMake(40, 124, favorLabelTwo, 14);
    [headView addSubview:favorLabel];
    
    //点赞
    UIButton *heartBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    heartBtn.frame=CGRectMake(WidthBounds-30, 14, 18, 18);
    [heartBtn setImage:[UIImage imageNamed:@"collect_down"] forState:UIControlStateNormal];
    [headView addSubview:heartBtn];
    
    //外卖
    _takeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _takeBtn.frame=CGRectMake(WidthBounds-85, 121, 73, 18);
    [_takeBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [_takeBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_takeBtn setTitle:@"我要点外卖" forState:UIControlStateNormal];
    [_takeBtn addTarget:self action:@selector(takeSwitch) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:_takeBtn];
    
    return headView;
}
#pragma mark -- 切换模式
-(void)takeSwitch
{
    if(self.isSwitch == YES)
    {
        [self.takeBtn setTitle:@"我要点堂食" forState:UIControlStateNormal];
        NSDictionary *dic= [NSDictionary dictionaryWithObjectsAndKeys:self.idDic,@"store_id", nil] ;
        //外卖模式
        [hoteRequest GetWithRequestTakeOut:^(id Value, id typeValue, id arrAll) {
            
            _infoArr = Value;
            _typeArr = typeValue;
            _tmpAll = arrAll;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.hotelTableView reloadData];
                [self.sideTableView reloadData];
            });
            
        } dicStr:dic failure:nil];
        self.isSwitch = NO;
    }
    else
    {
        [self.takeBtn setTitle:@"我要点外卖" forState:UIControlStateNormal];
        NSDictionary *dic= [NSDictionary dictionaryWithObjectsAndKeys:self.idDic,@"store_id", nil] ;
        //堂食模式
        [hoteRequest GetWithRequest:^(id Value, id typeValue, id arrAll) {
            
            _infoArr = Value;
            _typeArr = typeValue;
            _tmpAll = arrAll;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.hotelTableView reloadData];
                [self.sideTableView reloadData];
            });
            
        } dicSTR:dic failure:nil];
        self.isSwitch = YES;

    }
    
}
#pragma mark -- 背景点按手势
-(void)tapRemoYes
{
    [UIView animateWithDuration:0.5 animations:^{
        
        CGRect rect  = _backgroundView.frame ;
        rect.origin.y = -328 ;
        _backgroundView.frame = rect ;
        
        //底部结算
        CGRect baseY = _baseView.frame;
        baseY.origin.y = HeightBounds;
        _baseView.frame = baseY;
        
    } completion:nil];
}
#pragma mark -- 结算点击手势事件
-(void)tapSender:(UIButton *)sender
{
    [self.baseTableView reloadData];
    [UIView animateWithDuration:0.5 animations:^{
        //背景图
        CGRect rect  = _backgroundView.frame ;
        rect.origin.y = 0 ;
        _backgroundView.frame = rect ;
        
        //底部结算
        CGRect baseY = _baseView.frame;
        baseY.origin.y = HeightBounds-403;
        _baseView.frame = baseY;
        
        
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark -- 侧滑手势事件
-(void)leftSide
{
    self.sideTableView.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- tableViewDatasoure
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView isEqual:self.hotelTableView])
    {
       return 92;
    }
    else if([tableView isEqual:self.sideTableView])
    {
        return 45;
    }
    else
    {
        return 50;
    }
}
//有多少分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.sideTableView)
    {
       return 1;
    }
    else if (tableView == self.hotelTableView)
    {
       return _tmpAll.count;
    }
    else
    {
        return 1;
    }
}
//每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.sideTableView)
    {
        return _typeArr.count;
    }
    else if (tableView == self.hotelTableView)
    {
        NSArray *arr = _tmpAll[section];
        return arr.count;
    }
    else
    {
        return _clearingArr.count;
    }
}
//分区标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if([tableView isEqual:self.hotelTableView])
    {
        hoteModel_type * hote = _typeArr[section];
        NSString * strTitle = hote.foot_type;
        return strTitle;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if([tableView isEqual:self.hotelTableView])
    {
       return 20;
    }
    return 0;
    
}
//选择某行cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断是否为左侧按钮
    if([tableView isEqual:self.sideTableView])
    {
        //计算出右侧tableView将要滚动的位置
        NSIndexPath * sidePath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        //将右侧tableView移动到指定位置
        [self.hotelTableView selectRowAtIndexPath:sidePath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        //取消选中效果
        [self.hotelTableView deselectRowAtIndexPath:sidePath animated:YES];
        
        //改变选中时的title颜色
        sideTableViewCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
        cell.sideTitle.textColor = [GVColor hexStringToColor:@"ffba14"];
      
    }
    else if([tableView isEqual:self.hotelTableView])
    {
        specificsViewController * specifics = [[specificsViewController alloc]init];
        NSArray * sectionArr = _tmpAll[indexPath.section];
        hoteModel_menu_info * hoteInfo = sectionArr[indexPath.row];
        if([hoteInfo.foot_type isEqualToString:@"火锅"])
        {
            UIAlertController *alertVC=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancel= [UIAlertAction actionWithTitle:@"go To!火锅" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
                hotPotViewController * hot = [[hotPotViewController alloc]init];
                //设置跳转后导航默认返回按钮 back 变为""
                hot.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
                
                [self.navigationController pushViewController:hot animated:YES];
            }];
            UIAlertAction *cancel2= [UIAlertAction actionWithTitle:@"go To!详情" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
                [_specArr addObject:hoteInfo];
                specifics.specMarr = _specArr;
                [self.navigationController pushViewController:specifics animated:YES];
            }];
            
            [alertVC addAction:cancel];
            [alertVC addAction:cancel2];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
        else
        {
            [_specArr addObject:hoteInfo];
            specifics.specMarr = _specArr;
            [self.navigationController pushViewController:specifics animated:YES];
        }
    }
}
//右边滑动跟左边的联动以及tableViewHear的透明度
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    if(offset<=0 && offset<=-90)
    {
        self.navigationView.alpha = 0;
    }
    else if(offset <= 500)
    {
        self.navigationView.alpha = offset/200;
    }

//    //如果是左侧tableView直接return;
//    if(scrollView == self.sideTableView) return;
//    
//    //取出显示在视图最靠上的cell的indePath
//    NSIndexPath * topViewIndexPath = [[self.hotelTableView indexPathsForVisibleRows] firstObject];
//    //左侧的tableView联动indePath
//    NSIndexPath * sidePath = [NSIndexPath indexPathForRow:topViewIndexPath.section inSection:0];
//    //移动左测tableView到指定的indexPath居上显示
//    [self.sideTableView selectRowAtIndexPath:sidePath animated:YES scrollPosition:UITableViewScrollPositionBottom];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView isEqual:self.hotelTableView])
    {
        static NSString * hoteStr =@"hoteTableViewCell";
        hoteTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:hoteStr];
        if (cell == nil) {
            
            cell = [[[NSBundle mainBundle] loadNibNamed:@"hoteTableViewCell" owner:self options:nil]lastObject];
        }
        //赋值 取每个分区中的section
        NSArray * sectionArr = _tmpAll[indexPath.section];
        [cell setHoteInfo:sectionArr[indexPath.row]];
        //cell按钮事件
        cell.delegate=self;
        //隐藏选择状态
        cell.selectionStyle = 0;
        //隐藏按钮
        //[cell.leftBtn setHidden:YES];
        
//        cell.block = ^(CGPoint point)
//        {
//            //UIView中的坐标转换
//            
//            //将像素point从view中转换到当前视图,返回在当前视图中的像素值
//            CGPoint startPoint = [self.view convertPoint:point fromView:self.hotelTableView];
//            CGPoint endPoint = [self.view convertPoint:_shopImg.center fromView:self.view];
//            [self initCHLayerFromPoint:startPoint toPoint:endPoint];
//            //NSLog(@"%@",NSStringFromCGPoint(endPoint));
//        };
        
   
        return cell;
    }
    else if([tableView isEqual:self.sideTableView])
    {
        static NSString * sideStr =@"sideTableViewCell";
        sideTableViewCell *sideCell =[tableView dequeueReusableCellWithIdentifier:sideStr];
        if (sideCell == nil) {
            sideCell = [[[NSBundle mainBundle] loadNibNamed:@"sideTableViewCell" owner:self options:nil]lastObject];
        }
        [sideCell setHoteType:_typeArr[indexPath.row]];
        
        

        sideCell.selectionStyle = 0;
        sideCell.backgroundColor = [UIColor clearColor];
        return sideCell;
    }
    else
    {
        static NSString * baseStr =@"baseCell";
        baseCell *cell =[tableView dequeueReusableCellWithIdentifier:baseStr];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"baseCell" owner:self options:nil]lastObject];
        }
       
        cell.delegate = self;
        cell.selectionStyle = 0;
        
        //NSArray * sectionArr = _tmpAll[indexPath.section];
//        [cell setHoteInfo:sectionArr[indexPath.row]];
        
        hoteModel_menu_info * infoModel = _clearingArr[indexPath.row];
//        for (hoteModel_menu_info *imp in _clearingArr) {
//            if ([infoModel.menu_name isEqualToString:imp.menu_name]) {
//                imp.count_num  = infoModel.count_num;
//                _numTwo = imp.count_num;
//            }
//        }
        cell.clearNum.text = [NSString stringWithFormat:@"%ld",infoModel.count_num];
       
        
       [cell setHoteInfo:_clearingArr[indexPath.row]];
        
        return cell;
    }
}


-(void)goodsCount:(hoteTableViewCell *)cell andButtonTag:(NSInteger)AddOrSubTag
{
    NSIndexPath * indexPath = [_hotelTableView indexPathForCell:cell];
    switch (AddOrSubTag) {
        case 1005:
        {
            NSArray * sectionArr = _tmpAll[indexPath.section];
            hoteModel_menu_info * hoteInfo = sectionArr[indexPath.row];
            
            if(hoteInfo.count_num <99)
            {
                hoteInfo.count_num ++;
                _numTwo = hoteInfo.count_num;
                _num ++;
                
                cell.numLabel.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
            
                [_clearingArr addObject:hoteInfo];//加入结算数组

                //去重
                NSSet *set = [NSSet setWithArray:_clearingArr];
                //去重之后,必须保证数组为nil,要重新复制.否则又会加重
                [_clearingArr removeAllObjects];
                
                //最后和去重后的数组比较(进行替换Model相同的属性值)
                for (hoteModel_menu_info *tmpModel in _clearingArr) {
                    
                    if([tmpModel isEqual:hoteInfo])
                    {
                        tmpModel.count_num = hoteInfo.count_num;
                    }
                }
                //遍历新的model,加入到去重后的数组中
                for (hoteModel_menu_info *tmpModel in [set allObjects]) {
                    
                    [_clearingArr addObject:tmpModel];
                }
                
                //计算价格与数量
                self.priceNumber += [hoteInfo.menu_price floatValue];
                [self numPriceAndCount];
               
            }
        }
            break;
            
        case 1006:
        {
            NSArray * sectionArr = _tmpAll[indexPath.section];
            hoteModel_menu_info * hoteInfo = sectionArr[indexPath.row];
            [_clearingArr removeObject:hoteInfo];
            [self.baseTableView reloadData];
            if(hoteInfo.count_num >0)
            {
                hoteInfo.count_num --;
                
                _num --;
                cell.numLabel.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
                
                //计算价格与数量
                self.priceNumber -= [hoteInfo.menu_price floatValue];
                
                [self numPriceAndCount];
                
                [self.baseTableView reloadData];
            }
        }
        default:
            break;
    }
}
//计算价格与数量
-(void)numPriceAndCount
{
    self.moneyLabel.text = [NSString stringWithFormat:@"￥%.2f",self.priceNumber];
    self.countLabel.text = [NSString stringWithFormat:@"%ld",_num];
    self.totalNumLabel.text =[NSString stringWithFormat:@"%@",self.moneyLabel.text];
    self.baseCountLabel.text =[NSString stringWithFormat:@"%ld",_num];
}

-(void)baseCount:(baseCell *)cell andButtonTag:(NSInteger)AddOrSubTag
{
    NSIndexPath * indexPath = [_baseTableView indexPathForCell:cell];
    switch (AddOrSubTag) {
        case 123:
        {
            hoteModel_menu_info * hoteInfo = _clearingArr[indexPath.row];
            hoteInfo.count_num ++;
            _num ++;
            
            cell.clearNum.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
//            self.countLabel.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
            self.countLabel.text = [NSString stringWithFormat:@"%ld",_num];
            
            self.priceNumber += [hoteInfo.menu_price floatValue];
            
            self.totalNumLabel.text = [NSString stringWithFormat:@"￥%.2f",self.priceNumber];
//            self.baseCountLabel.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
            self.baseCountLabel.text = [NSString stringWithFormat:@"%ld",_num];
            self.moneyLabel.text = [NSString stringWithFormat:@"￥%.2f",self.priceNumber];
            
            [self.hotelTableView reloadData];
            
        }
            break;
            
        case 321:
        {
            hoteModel_menu_info * hoteInfo = _clearingArr[indexPath.row];
            hoteInfo.count_num --;
            _num --;
            if(hoteInfo.count_num == 0)
            {
                [cell.subtractBtn setHidden:YES];
                [cell.clearNum setHidden:YES];
            }

            cell.clearNum.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
            self.countLabel.text = [NSString stringWithFormat:@"%ld",_num];
            self.baseCountLabel.text = [NSString stringWithFormat:@"%ld",_num];
            //self.countLabel.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
            
            self.priceNumber -= [hoteInfo.menu_price floatValue];
            
            self.totalNumLabel.text = [NSString stringWithFormat:@"￥%.2f",self.priceNumber];
            //self.baseCountLabel.text = [NSString stringWithFormat:@"%ld",hoteInfo.count_num];
            self.moneyLabel.text = [NSString stringWithFormat:@"￥%.2f",self.priceNumber];
            
            [self.hotelTableView reloadData];

            
            }
            break;
        default:
            break;
    }
}

- (NSMutableArray<CALayer *> *)redLayers {
    if (!_redLayers) {
        _redLayers = [NSMutableArray array];
    }
    return _redLayers;
}
#pragma mark -- 动画方法
-(void)initCHLayerFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint
{
//    CALayer * chLayer = [[CALayer alloc]init];
//    [_redLayers addObject:chLayer];
//    
//    chLayer.frame = CGRectMake(startPoint.x, startPoint.y, 15, 15);
//    chLayer.cornerRadius = CGRectGetWidth(chLayer.frame)/2.f;
//    chLayer.backgroundColor = [UIColor redColor].CGColor;
//    [self.view.layer addSublayer:chLayer];
//    
//    //关键帧动画,可以定义动画路线
//    CAKeyframeAnimation * CHAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
//    CGPathAddQuadCurveToPoint(path, NULL, endPoint.x, startPoint.y, endPoint.x, endPoint.y);
//    
//    CHAnimation.path = path;
//    //是否需要动画自动移除(NO == 可以循环执行)
//    CHAnimation.removedOnCompletion = NO;
//    //获取或设置动画完成时的动作
//    CHAnimation.fillMode = kCAFillModeBoth;
//    CHAnimation.duration = 0.5;
//    CHAnimation.delegate =self;
//    [chLayer addAnimation:CHAnimation forKey:nil];
}

//加➕
//-(void)rightNewHotelTableViewCell:(hoteTableViewCell *)rightHoteCell
//{
//    NSIndexPath * indexPath = [_hotelTableView indexPathForCell:rightHoteCell];
//    //赋值 取每个分区中的section
//    NSArray * sectionArr = _tmpAll[indexPath.section];
//    hoteModel_menu_info * hoteInfo = sectionArr[indexPath.row];
//    [_clearingArr addObject:hoteInfo];
//    [self.baseTableView reloadData];
//    
//    if(hoteInfo.count_num < 99)
//        {
//            //隐藏按钮
//            rightHoteCell.leftBtn.hidden =NO;
//            hoteInfo.count_num ++;
//            //使用全局
//            self.num ++;
//            
//            //显示cell上的label
//            rightHoteCell.textFieldNum.text =[NSString stringWithFormat:@"%ld",hoteInfo.count_num];
//            
//            //显示购物车上的label
//            self.countLabel.text = [NSString stringWithFormat:@"%ld",self.num];
//            
//            [self.view addSubview:self.animationView];//小红点view
//            //text值为空的时候隐藏
//            self.countLabel.hidden = self.countLabel.text.integerValue == 0;
//            //抛物线动画
//            [[ThrowLineTool sharedTool]throwObject:self.animationView from:self.animationView.center to:self.shopImg.center height:-300 duration:0.4];
//            
//            //结算
//            self.priceNumber += [hoteInfo.menu_price floatValue];
//            self.moneyLabel.text = [NSString stringWithFormat:@"￥%.2f",self.priceNumber];
//            
//#pragma mark -- 底部结算的数据展示
//            //底部结算
//            self.totalNumLabel.text =[NSString stringWithFormat:@"%@",self.moneyLabel.text];
//            //底部结算购物车上的红色小点数量
//            self.baseCountLabel.text =[NSString stringWithFormat:@"%ld",self.num];
//            self.baseCountLabel.hidden = self.countLabel.text.integerValue == 0;
//        }
//    
//}
////➖
//-(void)leftNewHotelTableViewCell:(hoteTableViewCell *)leftHoteCell
//{
//    if(self.num >0 )
//    {
//        NSIndexPath * indexPath = [_hotelTableView indexPathForCell:leftHoteCell];
//        //赋值 取每个分区中的section
//        NSArray * sectionArr = _tmpAll[indexPath.section];
//        hoteModel_menu_info * hoteInfo = sectionArr[indexPath.row];
//        [_clearingArr removeObject:hoteInfo];
//        [self.baseTableView reloadData];
//        if(hoteInfo.count_num > 0)
//        {
//            hoteInfo.count_num --;
//            self.num --;
//            
//            //显示cell上的label
//            leftHoteCell.textFieldNum.text =[NSString stringWithFormat:@"%ld",hoteInfo.count_num];
//            //使用全局
//            //        self.num --;
//            //显示购物车上的label
//            self.countLabel.text = [NSString stringWithFormat:@"%ld",self.num];
//            //text值为空的时候隐藏
//            if(self.num < 1)
//            {
//                [self.countLabel setHidden:YES];
//                [leftHoteCell.leftBtn setHidden:YES];
//                [leftHoteCell.textFieldNum setHidden:YES];
//            }
//            
//            //结算
//            self.priceNumber -= [hoteInfo.menu_price floatValue];
//            self.moneyLabel.text = [NSString stringWithFormat:@"￥%.2f",self.priceNumber];
//            //底部结算
//            self.totalNumLabel.text =[NSString stringWithFormat:@"%@",self.moneyLabel.text];
//            //底部结算购物车上的红色小点数量
//            self.baseCountLabel.text =[NSString stringWithFormat:@"%ld",self.num];
//            self.baseCountLabel.hidden = self.countLabel.text.integerValue == 0;
//            
//        }
//    }
//    
//}
////抛物线结束的回调
//-(void)animationDidFinish
//{
//    [self.animationView removeFromSuperview];
//    [UIView animateWithDuration:0.1 animations:^{
//        _shopImg.transform = CGAffineTransformMakeScale(0.8, 0.8);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.1 animations:^{
//            _shopImg.transform = CGAffineTransformMakeScale(1, 1);
//            
//        } completion:^(BOOL finished) {
//            
//        }];
//    }];
//}
#pragma mark -- 初始化左侧tableView
-(UITableView *)sideTableView
{
    if(_sideTableView == nil)
    {
        _sideTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, -235, HeightBounds+20) style:UITableViewStylePlain];
        _sideTableView.delegate =self;
        _sideTableView.dataSource =self;
        _sideTableView.tableHeaderView = [self sideHeaderView];
        //设置UITableView背景色为图片
        _sideTableView.backgroundColor= [UIColor clearColor];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"peking"]];
        _sideTableView.backgroundView = imageView;
    }
    return _sideTableView;
}
//右侧tableView
-(UITableView *)hotelTableView
{
    if(_hotelTableView == nil)
    {
        _hotelTableView = [[UITableView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, HeightBounds) style:UITableViewStyleGrouped];
        _hotelTableView.delegate = self;
        _hotelTableView.dataSource =self;
        _hotelTableView.tableHeaderView = [self headNavigation];//头视图
    }
    return _hotelTableView;
}
#pragma mark -- 导航栏view
-(UIView *)navigationView
{
    if(_navigationView == nil)
    {
        _navigationView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, WidthBounds, 64)];
        _navigationView.backgroundColor = [UIColor colorWithRed:245/255.0 green:147/255.0 blue:39/255.0 alpha:1.0];
        
        UIButton *b=[UIButton buttonWithType:UIButtonTypeCustom];
        b.frame=CGRectMake(10, 25, 22, 32);
        [b setImage:[UIImage imageNamed:@"箭头"] forState:UIControlStateNormal];
        [b addTarget:self action:@selector(Back) forControlEvents:UIControlEventTouchUpInside];
        [_navigationView addSubview:b];
        
        //导航标题
        [_navigationView addSubview:self.navTitle];
    }
    return _navigationView;
}
//导航title
-(UILabel *)navTitle
{
    if(_navTitle == nil)
    {
        _navTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 18)];
        _navTitle.textAlignment = NSTextAlignmentCenter;
        _navTitle.text =self.store_name;
        _navTitle.textColor = [GVColor hexStringToColor:@"333333"];
        _navTitle.font = [UIFont systemFontOfSize:20];
        CGFloat navLabelTwo =[UILabel getWidthWithTitle:_navTitle.text font:_navTitle.font];
        _navTitle.frame =CGRectMake(WidthBounds/2-50, 30, navLabelTwo, 20);
    }
    return _navTitle;
}
//箭头返回事件
-(void)Back
{
    self.sideTableView.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 购物车红点动画View
//-(UIView *)animationView
//{
//    if(_animationView == nil)
//    {
//        _animationView = [[UILabel alloc]initWithFrame:CGRectMake(0, HeightBounds/2, 14, 14)];
//        _animationView.backgroundColor = [UIColor redColor];
//        _animationView.layer.cornerRadius = 7;
//        _animationView.layer.borderWidth = 0;
//        _animationView.layer.masksToBounds = YES;
//    }
//    return _animationView;
//}

#pragma mark -- 左侧sideHeaderView视图
-(UIView *)sideHeaderView
{
    UIView * sideHeaderView = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, 235, 45)];
    [sideHeaderView addSubview:self.headerSearchBar];
    
    return sideHeaderView;
}

#pragma mark -- 结算tableView头视图
-(UIView *)headerBaseTableView
{
    UIView * headerBase = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 61)];
    
    UIImageView * shopImg = [[UIImageView alloc]initWithFrame:CGRectMake(12, 17, 19, 19)];
    shopImg.image = [UIImage imageNamed:@"shopping"];
    [headerBase addSubview:shopImg];
    
    //购物数量
    _baseCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(23, 8.5, 13, 13)];
    _baseCountLabel.backgroundColor = [UIColor redColor];
    _baseCountLabel.layer.cornerRadius = 7;
    _baseCountLabel.layer.borderWidth = 0;
    _baseCountLabel.layer.masksToBounds = YES;
    _baseCountLabel.textAlignment = NSTextAlignmentCenter;
    //_baseCountLabel.hidden = YES;//是否将其隐藏
    _baseCountLabel.textColor = [GVColor hexStringToColor:@"#ffffff"];
    _baseCountLabel.font = [UIFont systemFontOfSize:11];
    [headerBase addSubview:self.baseCountLabel];
    
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, 41, WidthBounds, 20)];
    backView.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
    [headerBase addSubview:backView];
    
    //优惠图标
    UIImageView *favorImage =[[UIImageView alloc]initWithFrame:CGRectMake(10, 1.5, 16, 16)];
    favorImage.image = [UIImage imageNamed:@"benefit_"];
    [backView addSubview:favorImage];
    
    //优惠券
    UILabel *favorLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    favorLabel.text =@"满100减10元,满200减30元.";
    favorLabel.font = [UIFont systemFontOfSize:12];
    favorLabel.textColor = [GVColor hexStringToColor:@"#888888"];
    CGFloat favorLabelTwo =[UILabel getWidthWithTitle:favorLabel.text font:favorLabel.font];
    favorLabel.frame =CGRectMake(36, 4, favorLabelTwo, 12);
    [backView addSubview:favorLabel];
    
    UILabel *romeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    romeLabel.text =@"清空购物车";
    romeLabel.font = [UIFont systemFontOfSize:12];
    romeLabel.textColor = [GVColor hexStringToColor:@"#888888"];
    CGFloat romeLabelTwo =[UILabel getWidthWithTitle:romeLabel.text font:romeLabel.font];
    romeLabel.frame =CGRectMake(WidthBounds-78, 20, romeLabelTwo, 12);
    [headerBase addSubview:romeLabel];
    
    //删除按钮
    UIButton * remoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    remoBtn.frame=CGRectMake(WidthBounds-95, 20, 12, 13);
    [remoBtn setImage:[UIImage imageNamed:@"eliminate"] forState:UIControlStateNormal];
    [remoBtn addTarget:self action:@selector(remoAllRow:) forControlEvents:UIControlEventTouchUpInside];
    [headerBase addSubview:remoBtn];

    return headerBase;
}
#pragma mark --清空购物车
-(void)remoAllRow:(hoteModel_menu_info * )model
{
    
    [_clearingArr removeAllObjects];
    self.moneyLabel.text = [NSString stringWithFormat:@"¥: 00.00"];
    self.totalNumLabel.text = [NSString stringWithFormat:@"¥: 00.00"];
    self.baseCountLabel.hidden = YES;
    self.countLabel.hidden = YES;
    _num = 0;
    [self.baseTableView reloadData];
}
#pragma mark -- 初始化底部tableView
-(UITableView *)baseTableView
{
    if(_baseTableView == nil)
    {
        _baseTableView = [[UITableView alloc]initWithFrame:CGRectMake(ZeroFrame, ZeroFrame, WidthBounds, 354) style:UITableViewStylePlain];
        _baseTableView.delegate=self;
        _baseTableView.dataSource=self;
        _baseTableView.tableHeaderView = [self headerBaseTableView];
    }
    return _baseTableView;
}
#pragma mark -- 底部提交订单View
-(void)ClearingView
{
    UIView * bottomView =[[UIView alloc]initWithFrame:CGRectMake(ZeroFrame, 354, WidthBounds, 49)];
    bottomView.backgroundColor = [GVColor hexStringToColor:@"eeeeee"];
    [_baseView addSubview:bottomView];
    
    UILabel * totalLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 16, 40, 15)];
    totalLabel.text = @"总计:";
    totalLabel.textColor = [GVColor hexStringToColor:@"333333"];
    totalLabel.font = [UIFont systemFontOfSize:15];
    [bottomView addSubview:totalLabel];
   
    //结算价格
    _totalNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 15, 0, 0)];
     NSString *strNum = @"  0.00     ";
    _totalNumLabel.text = [NSString stringWithFormat:@"%@",strNum];
    _totalNumLabel.font = [UIFont systemFontOfSize:19];
    _totalNumLabel.textColor = [GVColor hexStringToColor:@"#e4562f"];
    //自适应宽度
    CGFloat numWidth = [UILabel getWidthWithTitle:_totalNumLabel.text font:_totalNumLabel.font];
    _totalNumLabel.frame = CGRectMake(55, 15, numWidth, 19);
    [bottomView addSubview:_totalNumLabel];
    
    //提交按钮
    UIButton *submitBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame=CGRectMake(WidthBounds-120, ZeroFrame, 120, 49);
    [submitBtn setTitle:@"提交订单" forState: UIControlStateNormal];
    submitBtn.backgroundColor=[GVColor hexStringToColor:@"ffba14"];
    [submitBtn setTitleColor:[GVColor hexStringToColor:@"333333"] forState:UIControlStateNormal];
    [submitBtn.titleLabel setFont:[UIFont systemFontOfSize:17]];
    [submitBtn addTarget:self action:@selector(submitCome) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:submitBtn];
}
//提交按钮事件
-(void)submitCome
{
    OrderSubMitViewController * order = [[OrderSubMitViewController alloc]init];
    order.indentMarr = _clearingArr;
    order.priceMoeny = self.totalNumLabel.text;
    [self.navigationController pushViewController:order animated:YES];
}
#pragma mark -- 初始化结算弹出视图
-(UIView *)baseView
{
    if(_baseView == nil)
    {
        _baseView= [[UIView alloc]initWithFrame:CGRectMake(ZeroFrame,HeightBounds, WidthBounds, 403)];
        
         [self ClearingView];
         [_baseView addSubview:self.baseTableView];
    }
    return _baseView;
}

#pragma mark -- 底部背景视图
-(UIView *)backgroundView
{
    if(_backgroundView == nil)
    {
        _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, -328, WidthBounds, 328)];
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = 0.6;
        _backgroundView.userInteractionEnabled = YES;
        
        //添加点按手势
        _tapRemo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRemoYes)];
        //把点按手势添加到图片上
        [_backgroundView addGestureRecognizer:self.tapRemo];
    }
    return _backgroundView;
}

#pragma mark -- 侧滑背景
-(UIView *)sideBackGorundView
{
    if(_sideBackGorundView == nil)
    {
        _sideBackGorundView = [[UIView alloc]initWithFrame:CGRectMake(WidthBounds+140, ZeroFrame, 140, HeightBounds)];
        _sideBackGorundView.backgroundColor = [UIColor blackColor];
        _sideBackGorundView.alpha = 0.6;
        _sideBackGorundView.userInteractionEnabled = YES;
    }
    return _sideBackGorundView;
}

@end
