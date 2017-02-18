//
//  JudgeViewController.m
//  点吧
//
//  Created by Pro on 2016/12/31.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import "JudgeViewController.h"
#import "MessagView.h"
#import "UILabel+OGLabel.h"
#import <UIView+SDAutoLayout.h>
#import "GVColor.h"
#define BLACK @"#333333"
#import "JudgeVegeTableViewCell.h"
#import "Judge.h"
//我的订单 (评价显示)
#define MINE_ORDER_SHOW @"http://www.kdiana.com/index.php/Before/MyOrder/evaluate"
//我的订单（去评价）
#define MINE_ORDER_NO @"http://www.kdiana.com/index.php/Before/MyOrder/appraise"
@interface JudgeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIButton *subMitBtn;
@property(nonatomic,strong)Judge *jude;
@property(nonatomic,strong)NSMutableArray *menuArr;
@end

@implementation JudgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadData];
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.bottomView];
    _bottomView.sd_layout
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view)
    .heightIs(70);
    [self.bottomView addSubview:self.subMitBtn];
    _subMitBtn.sd_layout
    .topSpaceToView(self.bottomView,25)
    .widthIs(170)
    .heightIs(30)
    .centerXEqualToView(self.bottomView);
}
-(void)loadData
{
    NSDictionary *dic = @{@"order_id":self.order_id
                          };
    [[NetworkRequest shareInstance]POST:MINE_ORDER_SHOW parameters:dic Success:^(id success) {
//        NSLog(@"-----%@",success);
        _jude = [Judge yy_modelWithJSON:success];
        for (NSDictionary *dic  in _jude.menu_list) {
            menu_list *menu = [menu_list yy_modelWithDictionary:dic];
            [self.menuArr addObject:menu];
        }
        [self.tableview reloadData];
        
    } Failure:^(id failure) {
        
    }];
}
-(UIButton *)subMitBtn
{
    if (_subMitBtn == nil) {
        _subMitBtn = [[UIButton alloc]init];
        [_subMitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_subMitBtn setTitleColor:[GVColor hexStringToColor:@"#333333"] forState:UIControlStateNormal];
        _subMitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _subMitBtn.backgroundColor = [GVColor hexStringToColor:@"#ffba14"];
        _subMitBtn.layer.masksToBounds = YES;
        _subMitBtn.layer.cornerRadius = 7;
    }
    return _subMitBtn;
}
-(UIView *)bottomView
{
    if (_bottomView == nil) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableview.delegate= self;
        _tableview.dataSource= self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.scrollEnabled = NO;
    }
    return _tableview;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 113;
    }
    else if(indexPath.section == 1)
    {
        return 30;
    }
    else
    {
        return 130;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return self.jude.menu_list.count;
            break;
            
        default:
            return 1;
            break;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *view = [[UIView alloc]init];
        UILabel *line = [[UILabel alloc]init];
        line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
        [view addSubview:line];
        line.sd_layout
        .leftSpaceToView(view,12)
        .topEqualToView(view)
        .rightSpaceToView(view,12)
        .heightIs(1);
        UILabel *lable = [[UILabel alloc]initWithText:@"菜品评价" font:[UIFont systemFontOfSize:17] textColor:[GVColor hexStringToColor:BLACK]];
        [view addSubview:lable];
        lable.sd_layout
        .leftEqualToView(line)
        .topSpaceToView(line,15)
        .bottomSpaceToView(view,6)
        .widthIs(100);
        return view;
    }
    else
    {
        UIView *view = [[UIView alloc]init];
        UILabel *line = [[UILabel alloc]init];
        line.backgroundColor = [GVColor hexStringToColor:@"#eeeeee"];
        [view addSubview:line];
        line.sd_layout
        .leftSpaceToView(view,12)
        .topEqualToView(view)
        .rightSpaceToView(view,12)
        .heightIs(1);
        UILabel *lable = [[UILabel alloc]initWithText:@"总体评价" font:[UIFont systemFontOfSize:17] textColor:[GVColor hexStringToColor:BLACK]];
        [view addSubview:lable];
        lable.sd_layout
        .leftEqualToView(line)
        .topSpaceToView(line,15)
        .bottomSpaceToView(view,6)
        .widthIs(100);
        return view;
        
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    else
    {
        return 46;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ) {
        MessagView * message = [[MessagView alloc]init];
        [message.imageView sd_setImageWithURL:[NSURL URLWithString:self.jude.store_photo]];
        message.nameLabel.text = self.jude.store_name;
        message.numberLabel.text = [NSString stringWithFormat:@"订单号:%@",self.jude.order_no];
        message.typeLabel.text =[NSString stringWithFormat:@"订餐类型:%@",self.jude.eat_type];
        message.moshiLabel.text =[NSString stringWithFormat:@"点餐模式:%@",self.jude.rel_mode];
        message.personLabel.text =[NSString stringWithFormat:@"就餐人数:%@人",self.jude.people_num] ;
        message.zhuohaoLabel.text =[NSString stringWithFormat:@"桌号:%@",self.jude.table_name] ;
        message.timeLabel.text = [NSString stringWithFormat:@"时间:%@",self.jude.order_time];
        
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        [cell.contentView addSubview:message];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    else if(indexPath.section == 1)
    {
        JudgeVegeTableViewCell *cell = [[JudgeVegeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        menu_list *menu = self.menuArr[indexPath.row];
        cell.name.text = menu.menu_name;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    }
    
    
    else
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        UITextView *textView = [[UITextView alloc]init];
        textView.backgroundColor = [UIColor orangeColor];
        [cell.contentView addSubview:textView];
        textView.sd_layout
        .leftSpaceToView(cell.contentView,12)
        .widthIs([UIScreen mainScreen].bounds.size.width - 24)
        .heightIs(130);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(NSMutableArray *)menuArr
{
    if (_menuArr == nil) {
        _menuArr = [NSMutableArray array];
    }
    return _menuArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self.view addSubview:self.tableview];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

    
    @end

