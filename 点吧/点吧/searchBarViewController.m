//
//  searchBarViewController.m
//  点吧
//
//  Created by Jerry on 2017/1/7.
//  Copyright © 2017年 OneGroup. All rights reserved.
//

#import "searchBarViewController.h"
#import <PYSearch.h>
@interface searchBarViewController ()<PYSearchViewControllerDelegate>

@end

@implementation searchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建热门搜索数组
    NSArray *searchArr= @[@"炒菜",@"火锅",@"糕点",@"甜品",@"烧烤",@"面食",@"啤酒"];
    //创建搜索控制器
    PYSearchViewController *pys=[PYSearchViewController searchViewControllerWithHotSearches:searchArr searchBarPlaceholder:@"想输入商家.商圈" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        
        //点击(开始)搜索时执行以下代码
        //[pys.navigationController pushViewController:[[TypeViewController alloc]init] animated:YES];
    }];
    //跳转到搜索控制器
    UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:pys];
    [self presentViewController:nvc  animated:NO completion:nil];
    
    pys.delegate=self;
    
    //热门搜索风格
    pys.hotSearchStyle=PYHotSearchStyleRankTag;
    //历史搜索的风格
    pys.searchHistoryStyle=PYSearchHistoryStyleCell;
}
//点击取消跳转回根试图
- (void)didClickCancel:(PYSearchViewController *)searchViewController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
