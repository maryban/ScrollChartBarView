//
//  XLableCell.h
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SDAutoLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface XLableView : UIView

@property(nonatomic,strong)UILabel  *valueLable;
@property(nonatomic,strong)NSString *key;

@end

NS_ASSUME_NONNULL_END
