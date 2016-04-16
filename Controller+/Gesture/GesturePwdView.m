//
//  GesturePwdView.m
//  OCCommon
//
//  Created by 游峰 on 16/4/14.
//  Copyright © 2016年 yf. All rights reserved.
//
#define delayTime 0.25
#import "GesturePwdView.h"

@interface GesturePwdView ()
@property (assign, nonatomic) CGPoint curP; //当前绘制所在点
@property (strong, nonatomic) NSMutableArray * selectedArrM;//选中按钮
@end

@implementation GesturePwdView
- (NSMutableArray *)selectedArrM
{
    if (!_selectedArrM) {
        _selectedArrM = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return _selectedArrM;
}

- (NSMutableString *)drawStr
{
    if (!_drawStr) {
        
        _drawStr = [NSMutableString stringWithCapacity:0];
    }
    return _drawStr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        [self addButton];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.userInteractionEnabled = NO;
        [self addButton];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.userInteractionEnabled = NO;
    [self addButton];
}

- (void)addButton
{
    self.backgroundColor = [UIColor clearColor];
    for (int i = 0; i < 9; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button.layer setCornerRadius:button.width * 0.5];
        [button.layer setMasksToBounds:YES];
        [button.layer setBorderColor:[UIColor colorWithWhite:255.0 alpha:0.2f].CGColor];
        
        [button.layer setBorderWidth:3.0f];
        
        [button setBackgroundColor:[UIColor redColor]];
        // 设置btn图片 Highlighted
//        [button setImage:[UIImage imageNamed:@"Oval 222 Copy + Imported Layers Copy 9.png"] forState:UIControlStateHighlighted];
        
        //  设置btn图片 Selected
//        [button setImage:[UIImage imageNamed:@"Oval 222 Copy + Imported Layers Copy 9.png"] forState:UIControlStateSelected];
        
        //  设置btn图片 Reserved
//        [button setImage:[UIImage imageNamed:@"Oval 222 Copy + Imported Layers Copy 9.png"] forState:UIControlStateReserved];
        
        button.userInteractionEnabled = NO;
        button.tag = i;
        [self addSubview:button];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    CGFloat buttonW = self.width / 5;
    CGFloat buttonH = buttonW;
    
    int col = 0;
    int row = 0;
    int cols = 3;
    CGFloat margin = buttonW;
    for (int i = 0; i < self.subviews.count; i++)
    {
        col = i % cols;
        buttonX = col * (buttonW + margin);
        row = i / cols;
        buttonY = row * (buttonH + margin);
        
        UIButton *button = self.subviews[i];
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button.layer setCornerRadius:button.width * 0.5];
        [button.layer setMasksToBounds:YES];
     }
}

- (void)drawRect:(CGRect)rect
{
    if (self.selectedArrM.count < 1) return;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    int i = 0;
    for (UIButton *seletedBtn in self.selectedArrM) {
        if (i == 0)
        {
            [path moveToPoint:seletedBtn.center];
        }
        else
        {
            [path addLineToPoint:seletedBtn.center];
        }
        
        i++;
    }
    
    [path addLineToPoint:self.curP];
    
    path.lineWidth = 6.0f;
    path.lineJoinStyle = kCGLineJoinRound;
    [[UIColor blueColor] set];
    [path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([self.delegate respondsToSelector:@selector(gesturePwdViewGetBeganDraw:)])
    {
        [self.delegate gesturePwdViewGetBeganDraw:self];
    }
    
    [self.selectedArrM removeAllObjects];
    self.drawStr = nil;
    [self selectBtnsWithTouches:touches event:event];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self selectBtnsWithTouches:touches event:event];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        for (UIButton *selBtn in self.selectedArrM)
        {
            selBtn.selected = NO;
            [self.drawStr appendFormat:@"%ld",(long)selBtn.tag];
        }
        
            if([self.delegate respondsToSelector:@selector(gesturePwdViewGetDrawString:)])
            {
                [self.delegate gesturePwdViewGetDrawString:self];
            }
        
        [self.selectedArrM removeAllObjects];
        [self setNeedsDisplay];
    });
    
}

- (void)selectBtnsWithTouches:(NSSet *)touches event:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    
    self.curP = curP;
    
    for (UIButton *btn in self.subviews)
    {
        CGPoint btnP = [self convertPoint:curP toView:btn];
        
        if ([btn pointInside:btnP withEvent:event] == YES && btn.selected == NO)
        {
            btn.selected = YES;
            [self.selectedArrM addObject:btn];
        }
    }
}

@end
