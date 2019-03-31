//
//  BmlChartBarView.m
//  ChartBarDemo
//
//  Created by bennyban on 2019/3/28.
//  Copyright © 2019年 maryban. All rights reserved.
//

#import "BmlChartBarView.h"
@interface BmlChartBarView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView     *tableView;
@property(nonatomic,assign)NSUInteger       xPerWidth;/*柱子的宽度*/
@end

@implementation BmlChartBarView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor =[UIColor whiteColor];
        self.xPerWidth = XLableHeight;
        _tableView =[[UITableView alloc] init];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.showsHorizontalScrollIndicator=NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self addSubview:_tableView];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [self setYLine:rect];
    [self bulidView];
}
/*布局*/
-(void)bulidView{
    self.tableView.frame = CGRectMake(0, 0, self.frame.size.height+XLableHeight-TopMargin-BottomMargin, self.frame.size.width-LeftMargin-RightMargin);
    self.tableView.center = CGPointMake(LeftMargin+self.tableView.frame.size.height/2, self.tableView.frame.size.width/2+TopMargin);
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI/2);/*表格旋转90度*/
}
/*画y轴*/
-(void)setYLine:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 0.3);
    NSDictionary *rgbDic = [self rgbDic:self.xyColor?self.xyColor:[UIColor lightGrayColor]];
    CGContextSetRGBStrokeColor(ctx, [[rgbDic objectForKey:@"R"] floatValue], [[rgbDic objectForKey:@"G"] floatValue], [[rgbDic objectForKey:@"B"] floatValue], 1);
    CGContextMoveToPoint(ctx, LeftMargin, TopMargin);
    CGContextAddLineToPoint(ctx, LeftMargin, rect.size.height-BottomMargin);
    CGContextStrokePath(ctx);
}
/*设置y轴线lable和h画横线和x轴*/
-(void)setYLablesArr:(NSArray *)yLablesArr
{
    _yLablesArr =yLablesArr;
    if (!_yLablesArr)return;
    if (_yLablesArr.count<2) return;
    for (int idx =0; idx<_yLablesArr.count; idx++)
    {
        CGFloat lableWidth = LeftMargin;
        CGFloat x=0;
        CGFloat y = [self getLableYWithIndex:idx];
        UILabel *lable = [[UILabel alloc] init];
        lable.frame = CGRectMake(x, y, lableWidth, BottomMargin);
        lable.text = [_yLablesArr objectAtIndex:idx];
        lable.textAlignment =NSTextAlignmentCenter;
        lable.textColor = self.xyColor;
        lable.font = [UIFont systemFontOfSize:12];
        [self addSubview:lable];
        if (idx>0)
        {
            [self drawHorizonLine:YES y:y-2+lable.frame.size.height/2];
            
        }else
        {
            [self drawHorizonLine:NO y:y-2+lable.frame.size.height/2];
        }
    }
}
/*画横线*/
-(void)drawHorizonLine:(BOOL)isDash  y:(CGFloat)y
{
    if (isDash)
    {
        UIView *dashedView = [[UIView alloc] initWithFrame:CGRectMake(LeftMargin+1,y, self.frame.size.width-LeftMargin-RightMargin, 0.3)];
        [self addSubview:dashedView];
        [self drawDashLine:dashedView lineLength:4 lineSpacing:2 lineColor:[UIColor lightGrayColor]];
    }else
    {
        /*x轴绘图*/
        UIView *dashedView = [[UIView alloc] initWithFrame:CGRectMake(LeftMargin+1, y, self.frame.size.width-LeftMargin-RightMargin, 0.3)];
        [self addSubview:dashedView];
        [self drawDashLine:dashedView lineLength:4 lineSpacing:0 lineColor:[UIColor lightGrayColor]];
    }
}
#pragma mark  UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BmlTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BarCell"];
    if (cell==nil)
    {
        cell =[[BmlTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BarCell"];
    }
    double progress =[[self.dataSourceArr objectAtIndex:indexPath.row] doubleValue]/self.yMaxValue;
    cell.barView.progress=progress;
    cell.barView.myValue = [[self.dataSourceArr objectAtIndex:indexPath.row] doubleValue];
    cell.barView.contentBtn.backgroundColor = cell.barView.inColor;
    cell.barView.contentBtn.tag = indexPath.row+100;
    [cell.barView.contentBtn addTarget:self action:@selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
    cell.xLable.valueLable.text =[NSString stringWithFormat:@"%@",[self.xLablesArr objectAtIndex:indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.xPerWidth;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectBlock)
    {
         self.selectBlock(indexPath.row);
    }
}
-(void)reloadData
{
    [self setNeedsDisplay];
}
-(void)btnSelect:(UIButton*)btn
{
    NSInteger tag = btn.tag-100;
    if (self.selectBlock)
    {
        self.selectBlock(tag);
    }
}
-(CGFloat)getLableYWithIndex:(int)index
{
    if (index==0)
    {
        return self.frame.size.height-BottomMargin-[self getLableYHeight]/2;
    }else if (index ==_yLablesArr.count-1)
    {
        return  -[self getLableYHeight]/2+TopMargin;
    }else
    {
        int spaceNum =(int)(_yLablesArr.count-2)+1;
        float space =((self.frame.size.height-BottomMargin-TopMargin)-[self getLableYHeight]-(_yLablesArr.count-2)*[self getLableYHeight])/spaceNum;
        float y = self.frame.size.height - BottomMargin-[self getLableYHeight]/2-index*(space+[self getLableYHeight]);
        return y;
        
    }
}
-(CGFloat)getLableYHeight
{
    return 25;
}
#pragma mark 工具
-(NSDictionary*)rgbDic:(UIColor*)aColor{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    UIColor *uicolor =aColor;
    CGColorRef color =[uicolor CGColor];
    size_t numComponents = CGColorGetNumberOfComponents(color);
    if (numComponents==4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        dic[@"R"] = [NSNumber numberWithFloat:components[0]];
        dic[@"G"] = [NSNumber numberWithFloat:components[1]];
        dic[@"B"] = [NSNumber numberWithFloat:components[2]];
    }
    return [dic copy];
}
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
- (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

@end
