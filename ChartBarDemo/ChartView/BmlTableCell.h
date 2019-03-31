//
//  BmlTableCell.h
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarView.h"
#import "XLableView.h"
#import "UIView+SDAutoLayout.h"

#define XLableHeight 40  

@interface BmlTableCell : UITableViewCell

@property(nonatomic,strong)BarView *barView;
@property(nonatomic,strong)XLableView  *xLable;

@end
