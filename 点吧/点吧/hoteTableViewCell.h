//
//  hoteTableViewCell.h
//  点吧
//
//  Created by Jerry on 2016/12/29.
//  Copyright © 2016年 OneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "hoteModel.h"

@class hoteTableViewCell;

//签协议
@protocol hotelDelegate <NSObject>
//必须实现的方法
@required
//-(void)leftNewHotelTableViewCell:(hoteTableViewCell *)leftHoteCell;
//-(void)rightNewHotelTableViewCell:(hoteTableViewCell *)rightHoteCell;
- (void)goodsCount:(hoteTableViewCell *)cell andButtonTag:(NSInteger)AddOrSubTag;
@end

@interface hoteTableViewCell : UITableViewCell

//设置代理
@property(nonatomic,weak) id<hotelDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *foot_type;
@property (weak, nonatomic) IBOutlet UILabel *menu_price;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;


@property (nonatomic,assign) int number;
//@property (nonatomic,assign) CGFloat priceNum;//公共价格

@property (nonatomic,copy)void(^block)(CGPoint point);

@property(nonatomic,copy)void(^blockNum)(int numBlock);//加与减的公共值
@property(nonatomic,copy)void(^blockPriceNum)(CGFloat priceNum);

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UILabel *moneyTitle;

@property(nonatomic,strong) hoteModel_menu_info * hoteInfo;
@end
