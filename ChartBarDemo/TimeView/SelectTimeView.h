//
//  SelectTimeView.h
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^SegClicked)(NSInteger index);
@interface SelectTimeView : UIView

@property(nonatomic,strong)SegClicked         segClicked;
@property(nonatomic,strong)UISegmentedControl *segment;
@property(nonatomic,strong)UIButton           *calderBtn;


@end

NS_ASSUME_NONNULL_END
