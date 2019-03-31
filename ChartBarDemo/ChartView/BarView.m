//
//  BarViewCell.m
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import "BarView.h"

@implementation BarView

-(UIColor*)inColor
{
    return [UIColor greenColor];
}
-(CGFloat)space
{
    return 10.0f;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        [self bulidView];
    }
    return self;
}
-(void)setProgress:(CGFloat)progress
{
    _progress =progress;
    _contentBtn.sd_layout.widthRatioToView(self, progress);
    [_contentBtn updateLayout];
}

-(void)setMyValue:(double)myValue
{
    _myValue = myValue;
    NSString *str =[NSString stringWithFormat:@"%.1f",myValue];
    _valueLable.text = str;
    _valueLable.layer.transform = CATransform3DIdentity;
    CATransform3D transform = _valueLable.layer.transform;
    transform = CATransform3DRotate(transform, M_PI/2, 0, 0, 1);
    _valueLable.layer.transform = transform;
    
}
-(void)bulidView
{
    _contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_contentBtn];
    
    _contentBtn.sd_layout
    .leftSpaceToView(self, 0)
    .topSpaceToView(self, self.space)
    .bottomSpaceToView(self, self.space)
    .widthRatioToView(self, 1);
    
    _valueLable = [[UILabel alloc] init];
    _valueLable.textAlignment=NSTextAlignmentCenter;
    _valueLable.textColor=[UIColor lightGrayColor];
    _valueLable.text=@"123345";
    _valueLable.font=[UIFont systemFontOfSize:12];
    [self addSubview:_valueLable];
    _valueLable.sd_layout
    .leftSpaceToView(_contentBtn, 0)
    .centerYEqualToView(_contentBtn)
    .widthIs(15)
    .heightIs(100);
    
  
    
    

}

@end
