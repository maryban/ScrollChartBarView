//
//  BarViewCell.h
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface BarView : UIView

@property(nonatomic,strong)UIColor  *inColor;
@property(nonatomic,assign)CGFloat  space;
@property(nonatomic,assign)CGFloat  progress;
@property(nonatomic,assign)double   myValue;
@property(nonatomic,strong)UILabel  *valueLable;
@property(nonatomic,strong)UIButton *contentBtn;
@end

NS_ASSUME_NONNULL_END
