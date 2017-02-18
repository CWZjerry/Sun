//
//  hotPotViewController.m
//  点吧
//
//  Created by Jerry on 2017/1/9.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "hotPotViewController.h"
#import "leftCell.h"
#import "rightCell.h"

#import "hotPtoRequest.h"
@interface hotPotViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>

{
    NSMutableArray * _hotMarr;//右边数组
    NSMutableArray * _hotLeftMarr;//左边数组
    
    NSMutableArray * _hotRarr;//右边数组
    NSMutableArray * _hotLMarr;//左边数组
    NSMutableArray * _arrMarr;
}
@property(nonatomic,strong) UITableView * leftTableView , * rightTableView;//左右侧tableView
@property(nonatomic,strong) UILabel * countLabel;//购物数量
@property(nonatomic,strong) UILabel * moneyLabel;//购物总数
@property(nonatomic,strong) UIImageView * moneyImg;
@property(nonatomic,strong) UIImageView * shopImg;//购物车图片
@property(nonatomic,strong) UIView * animationView;//小红点动画View

@property(nonatomic,strong) UITapGestureRecognizer * tapRecognizer;//点按手势

@property(nonatomic,strong) NSMutableArray<CALayer *> *redLayers;//动画

@property (nonatomic,assign) int number;
@end

@implementation hotPotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _number = 0;
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
    
//    [hotPtoRequest getWithHotPto:^(id Value) {
//        _hotMarr  = Value;
//       dispatch_async(dispatch_get_main_queue(), ^{
//           
//           [self.rightTableView reloadData];
//       });
//        
//    } failure:^(id failure) {
//        
//        
//    }];
//    
//    
//    [hotPtoRequest getWithHotLeft:^(id Value) {
//        _hotLeftMarr = Value;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [self.leftTableView reloadData];
//        });
//        
//    } failure:^(id failure) {
//        
//        
//    }];
    
    [hotPtoRequest getWithHotPtoLeftAndRight:^(id left, id right, id allMarr) {
        _hotRarr = right;
        _hotLMarr = left;
        _arrMarr = allMarr;
        NSLog(@"%@",_arrMarr);

        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.rightTableView reloadData];
            [self.leftTableView reloadData];
        });
    } failure:^(id failure) {
        
        
    }];
    
    [self shopBtn];
}
-(NSMutableArray<CALayer *> *)redLayers
{
    if(!_redLayers)
    {
        _redLayers = [NSMutableArray array];
    }
    return _redLayers;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark -- 购物车控件
-(void)shopBtn
{
    _moneyImg = [[UIImageView alloc]initWithFrame:CGRectMake(WidthBounds-128, HeightBounds-38, 90, 22)];
    _moneyImg.image = [UIImage imageNamed:@"money"];
    [self.view addSubview:_moneyImg];
    
    //结算总数
    NSString *str = @"  0.00     ";
    _moneyLabel = [[UILabel alloc]init];
    _moneyLabel.textColor = [GVColor hexStringToColor:@"#333333"];
    _moneyLabel.text = [NSString stringWithFormat:@"￥%@",str];
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


#pragma mark -- 表格的dataSoure
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([tableView isEqual:self.leftTableView])
    {
        return _hotLMarr.count;
    }
    else
    {
        return _hotRarr.count;
    }
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.leftTableView])
    {
        return 42;
    }
    else
    {
        return 70;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断是否为左侧按钮
    if([tableView isEqual:self.leftTableView])
    {
        _hotRarr = _arrMarr[indexPath.row];
        [self.rightTableView reloadData];
        
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([tableView isEqual:self.leftTableView])
    {
        static NSString * leftStr = @"leftCell";
        leftCell * leftCell = [tableView dequeueReusableCellWithIdentifier:leftStr];
        if(leftCell == nil)
        {
            leftCell = [[[NSBundle mainBundle] loadNibNamed:@"leftCell" owner:self options:nil] lastObject];
        }
        
        //[leftCell setHotLeft:_hotLMarr[indexPath.row]];
        [leftCell setHotLeft:_hotLMarr[indexPath.row]];
        
        //选中cell后切换图
        UIImageView * backImage = [[UIImageView alloc]initWithFrame:leftCell.backgroundView.frame];
        backImage.image = [UIImage imageNamed:@"bottom"];
        leftCell.selectedBackgroundView = backImage;
        
        //设置默认选中哪一行
        NSIndexPath * selectIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [_leftTableView selectRowAtIndexPath:selectIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        
        
        leftCell.backgroundColor = [GVColor hexStringToColor:@"f2f2f2"];
        
        
        return leftCell;
    }
    else
    {
        static NSString * rightStr = @"rightCell";
        rightCell * rightCell = [tableView dequeueReusableCellWithIdentifier:rightStr];
        if(rightCell == nil)
        {
            rightCell = [[[NSBundle mainBundle] loadNibNamed:@"rightCell" owner:self options:nil] lastObject];
        }
        
        //[rightCell setHotFix:_hotRarr[indexPath.row]];
        [rightCell setHotFix:_hotRarr[indexPath.row]];
        
        rightCell.number = 0;
       
        rightCell.block = ^(CGPoint point)
        {
            //UIView中的坐标转换
            
            //将像素point从view中转换到当前视图,返回在当前视图中的像素值
            CGPoint startPoint = [self.view convertPoint:point fromView:self.rightTableView];
            CGPoint endPoint = [self.view convertPoint:self.animationView.center fromView:self.countLabel];
            [self initCHLayerFromPoint:startPoint toPoint:endPoint];
        };
       
        return rightCell;
    }
}

#pragma mark -- 动画方法
-(void)initCHLayerFromPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint
{
    CALayer * chLayer = [[CALayer alloc]init];
    [self.redLayers addObject:chLayer];
    
    chLayer.frame = CGRectMake(startPoint.x, startPoint.y, 15, 15);
    chLayer.cornerRadius = CGRectGetWidth(chLayer.frame)/2.f;
    chLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:chLayer];
    
    //关键帧动画,可以定义动画路线
    CAKeyframeAnimation * CHAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPoint.x, startPoint.y);
    CGPathAddQuadCurveToPoint(path, NULL, endPoint.x, startPoint.y, endPoint.x, endPoint.y);
    
    CHAnimation.path = path;
    //是否需要动画自动移除(NO == 可以循环执行)
    CHAnimation.removedOnCompletion = NO;
    //获取或设置动画完成时的动作
    CHAnimation.fillMode = kCAFillModeBackwards;
    CHAnimation.duration = 0.5;
    CHAnimation.delegate =self;
    [chLayer addAnimation:CHAnimation forKey:nil];
}
#pragma mark -- 动画代理方法
////动画停止后的回调,可以通过flag判断动画是否完成还是暂停
//-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
//{
//    [self.redLayers[0] removeFromSuperlayer];
//    [self.redLayers removeObjectAtIndex:0];
//}
#pragma mark -- 初始化左右侧tableView
-(UITableView *)leftTableView
{
    if(_leftTableView == nil)
    {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(ZeroFrame, 0, 75, HeightBounds) style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.backgroundColor = [GVColor hexStringToColor:@"f2f2f2"];
    }
    return _leftTableView;
}
-(UITableView *)rightTableView
{
    if(_rightTableView == nil)
    {
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(75, 64, WidthBounds-75, HeightBounds) style:UITableViewStylePlain];
        _rightTableView.dataSource = self;
        _rightTableView.delegate = self;
    }
    return _rightTableView;
}

#pragma mark -- 购物车红点动画View
-(UIView *)animationView
{
    if(_animationView == nil)
    {
        _animationView = [[UILabel alloc]initWithFrame:CGRectMake(0, HeightBounds/2, 14, 14)];
        _animationView.backgroundColor = [UIColor redColor];
        _animationView.layer.cornerRadius = 7;
        _animationView.layer.borderWidth = 0;
        _animationView.layer.masksToBounds = YES;
    }
    return _animationView;
}


@end
