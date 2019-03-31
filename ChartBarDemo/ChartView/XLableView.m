//
//  XLableCell.m
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import "XLableView.h"

@implementation XLableView

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
    _valueLable = [[UILabel alloc] init];
    _valueLable.textAlignment =NSTextAlignmentCenter;
    _valueLable.textColor = [UIColor lightGrayColor];
    _valueLable.text =@"12345";
    _valueLable.font = [UIFont systemFontOfSize:12];
    _valueLable.adjustsFontSizeToFitWidth =YES;
    [self addSubview:_valueLable];
    _valueLable.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
}
-(void)setKey:(NSString *)key
{
    _key = key;
    _valueLable.text = key;
}
@end
