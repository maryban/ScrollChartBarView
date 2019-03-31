//
//  SelectTimeView.m
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import "SelectTimeView.h"

#define Space 20

@implementation SelectTimeView

-(id)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        [self bulidView];
    }
    return self;
}
-(void)bulidView
{
    NSArray *arr = @[@"月",@"年",@"总"];
    _segment = [[UISegmentedControl alloc]initWithItems:arr];
    _segment.frame = CGRectMake((self.frame.size.width-220)/2, 0,220, 40);
    _segment.selectedSegmentIndex = 0;
    //设置segment的外观和字体颜色
    _segment.tintColor = [UIColor orangeColor];
    [_segment addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_segment];
    
    _calderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _calderBtn.frame = CGRectMake((self.frame.size.width-150)/2, _segment.frame.size.height+_segment.frame.origin.y+Space, 150, 30);
    [_calderBtn setTitle:@"2018-09-19" forState:UIControlStateNormal];
    _calderBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _calderBtn.layer.cornerRadius =5;
    _calderBtn.layer.masksToBounds =YES;
    _calderBtn.backgroundColor =[UIColor lightGrayColor];
    [_calderBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_calderBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    _calderBtn.tag=1;
    [self addSubview:_calderBtn];
    /*左右切换的按钮*/
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"左" forState:UIControlStateNormal];
    leftBtn.layer.cornerRadius =5;
    leftBtn.layer.masksToBounds =YES;
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    leftBtn.backgroundColor =[UIColor lightGrayColor];
    [leftBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag=2;
    [self addSubview:leftBtn];
    leftBtn.sd_layout
    .rightSpaceToView(_calderBtn, 10)
    .topEqualToView(_calderBtn)
    .widthIs(30)
    .heightIs(30);
    
    /*左右切换的按钮*/
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"右" forState:UIControlStateNormal];
    rightBtn.layer.cornerRadius =5;
    rightBtn.layer.masksToBounds =YES;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    rightBtn.backgroundColor =[UIColor lightGrayColor];
    [rightBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
     [rightBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag=3;
    [self addSubview:rightBtn];
    rightBtn.sd_layout
    .leftSpaceToView(_calderBtn, 10)
    .topEqualToView(_calderBtn)
    .widthIs(30)
    .heightIs(30);
    
}


-(void)selected:(id)sender
{
    UISegmentedControl* control = (UISegmentedControl*)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            NSLog(@"0");
            break;
        case 1:
            NSLog(@"1");
            break;
        case 2:
            NSLog(@"2");
            break;
            
        default:
            NSLog(@"3");
            break;
    }
    if (self.segClicked)
    {
        self.segClicked(control.selectedSegmentIndex);
    }
}
-(void)btnClicked:(UIButton*)btn
{
    NSLog(@"----%d",btn.tag);
}
@end
