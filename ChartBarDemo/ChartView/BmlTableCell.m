//
//  BmlTableCell.m
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import "BmlTableCell.h"

@implementation BmlTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self bulidView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
-(void)bulidView
{
    _xLable = [[XLableView alloc] init];
    [self addSubview:_xLable];
    _xLable.frame=CGRectMake(0, 0,XLableHeight,XLableHeight);
    _xLable.layer.transform = CATransform3DIdentity;
    CATransform3D transform = _xLable.layer.transform;
    transform = CATransform3DRotate(transform, M_PI/2, 0, 0, 1);
    _xLable.layer.transform = transform;
    
    
    _barView=[[BarView alloc] init];
    [self addSubview:_barView];
    _barView.sd_layout
    .leftSpaceToView(_xLable, 0)
    .topSpaceToView(self, 0)
    .bottomSpaceToView(self, 0)
    .rightEqualToView(self);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
