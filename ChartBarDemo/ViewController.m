//
//  ViewController.m
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/25.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import "ViewController.h"
#import "BmlChartBarView.h"
#import "SelectTimeView.h"
#import "TimeView/TimeUtil.h"


@interface ViewController ()
{
    BmlChartBarView *barView;
}
@property (nonatomic,strong)SelectTimeView   *timeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _timeView = [[SelectTimeView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 100)];
    __weak typeof (self) weakSelf=self;
    _timeView.segClicked=^(NSInteger index)
    {
        [weakSelf switchSeg:index];
    };
    [self.view addSubview:_timeView];
    /*绘制图表并付初始值*/
    [self makeBarView];
    [self setMouthData];
    
}
/*创建表格*/
-(void)makeBarView
{
    barView = [[BmlChartBarView alloc] init];
    barView.frame=CGRectMake(20,180, self.view.frame.size.width-20, 200);
    barView.xyColor = [UIColor lightGrayColor];
    [self.view addSubview:barView];
    barView.selectBlock=^(NSUInteger index)
    {
//        NSLog(@"选择了第几个%d",index);
    };
}

#pragma mark 切换
-(void)switchSeg:(NSInteger)index
{
    switch (index)
    {
        case 0:
            [self makeBarView];
            [self setMouthData];

            break;
        case 1:
            [self makeBarView];
            [self setYearData];
            break;
        case 2:
            [self makeBarView];
            [self setTotalData];
            break;
            
        default:
            break;
    }
}



/*月数据*/
-(void)setMouthData
{
    NSInteger year = [TimeUtil getYear];
    NSInteger mouth = [TimeUtil getMonth];
    int  day = [TimeUtil daysForMonth:(int)mouth year:(int)year];
    NSMutableArray *xValues = [[NSMutableArray alloc] init];
    NSMutableArray  *dataSourceArr = [[NSMutableArray alloc] init];
    for (int i=0; i<day; i++)
    {
        [xValues addObject:[NSString stringWithFormat:@"%d",i+1]];
        [dataSourceArr addObject:[NSString stringWithFormat:@"%d",arc4random()%100]];
    }
    barView.yMaxValue = 120;
    barView.yLablesArr=@[@"0",@"20",@"40",@"60",@"80",@"100"];
    barView.xLablesArr = xValues;
    barView.dataSourceArr = dataSourceArr;
    [barView reloadData];
    
    
}
/*年数据*/
-(void)setYearData
{
    NSMutableArray *xValues = [[NSMutableArray alloc] init];
    NSMutableArray  *dataSourceArr = [[NSMutableArray alloc] init];
    
    for (int i=0; i<12; i++)
    {
        [xValues addObject:[NSString stringWithFormat:@"%d月",i+1]];
        [dataSourceArr addObject:[NSString stringWithFormat:@"%d",arc4random()%100]];
    }
    barView.yMaxValue = 120;
    barView.yLablesArr=@[@"0",@"20",@"40",@"60",@"80",@"100"];
    barView.xLablesArr = xValues;
    barView.dataSourceArr = dataSourceArr;
    [barView reloadData];
}

/*总数据*/
-(void)setTotalData
{
    int year = (int)[TimeUtil getYear];
    NSMutableArray *xValues = [[NSMutableArray alloc] init];
    NSMutableArray  *dataSourceArr = [[NSMutableArray alloc] init];
    
    for (int i=year-10; i<year; i++)
    {
        [xValues addObject:[NSString stringWithFormat:@" %d年 ",i+1]];
        [dataSourceArr addObject:[NSString stringWithFormat:@"%d",arc4random()%100]];
    }
    barView.yMaxValue = 120;
    barView.yLablesArr=@[@"0",@"20",@"40",@"60",@"80",@"100"];
    barView.xLablesArr = xValues;
    barView.dataSourceArr = dataSourceArr;
    [barView reloadData];
}

@end
