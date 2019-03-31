//
//  BmlChartBarView.h
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BmlTableCell.h"


#define LeftMargin   40
#define BottomMargin 30
#define TopMargin    30
#define RightMargin  30

NS_ASSUME_NONNULL_BEGIN
typedef void(^ItemSelectBlock)(NSUInteger index);

@interface BmlChartBarView : UIView

@property(nonatomic,strong)ItemSelectBlock  selectBlock;/*选择柱子回调*/

@property(nonatomic,strong)UIColor          *xyColor;   /*xy轴颜色*/

@property(nonatomic,copy)NSArray            *yLablesArr;/*y轴的刻度*/

@property(nonatomic,copy)NSArray            *xLablesArr;/*x轴的刻度*/

@property(nonatomic,copy)NSArray            *dataSourceArr;/*数据源数组*/

@property(nonatomic,assign)NSUInteger       yMaxValue;    /*y轴的最大值*/
/*刷新图表数据*/
-(void)reloadData;

@end

NS_ASSUME_NONNULL_END
