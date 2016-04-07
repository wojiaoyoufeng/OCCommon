//
//  PushPullListCell.m
//  OCCommon
//
//  Created by 游峰 on 16/3/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#define w self.contentView.frame.size.width
#define h self.contentView.frame.size.height
#define leftMagin 10
#import "PushPullListCell.h"
/*
 
 @property (weak, nonatomic) UIView * overlayV;
 @property (weak, nonatomic) UIImageView * backImgV;
 @property (weak, nonatomic) UILabel * priceL;
 @property (weak, nonatomic) UILabel * otherL;
 @property (weak, nonatomic) UILabel * lineL;
 @property (weak, nonatomic) UILabel * smallL;
 
 */

@implementation PushPullListCell

- (UIView *)overlayV
{
    if (!_overlayV)
    {
        
        UIView * view = [[UIView alloc] init];
        [self.contentView addSubview:view];
        view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];

        _overlayV = view;
    }
    return _overlayV;
}

- backImgV
{
    if (!_backImgV)
    {
        
        UIImageView * imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:imageV];
        imageV.backgroundColor = [UIColor whiteColor];
        [imageV setImage:[UIImage imageNamed:@"Afghanistan.png"]];
        
        _backImgV = imageV;
    }
    return _backImgV;
}

- (UILabel *)priceL
{
    if (!_priceL)
    {
        
        UILabel * label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        label.numberOfLines = 0;
        [label setFont:[UIFont systemFontOfSize:15]];
        [label setTextColor:[UIColor yellowColor]];
        [label setTextAlignment:NSTextAlignmentRight];
        [label setBackgroundColor:[UIColor clearColor]];
        label.text = @"$3888";
        
        _priceL = label;
    }
    return _priceL;
}

- (UILabel *)otherL
{
    if (!_otherL)
    {
        UILabel * label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        label.numberOfLines = 0;
        [label setFont:[UIFont systemFontOfSize:15]];
        [label setTextColor:[UIColor yellowColor]];
        [label setTextAlignment:NSTextAlignmentLeft];
        [label setBackgroundColor:[UIColor clearColor]];
        label.text = @"很好吃";
        
        _otherL = label;
    }
    return _otherL;
}

- (UILabel *)lineL
{
    if (!_lineL)
    {
        
        UILabel * label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        label.numberOfLines = 0;
        [label setFont:[UIFont systemFontOfSize:15]];
        [label setTextColor:[UIColor blueColor]];
        [label setTextAlignment:NSTextAlignmentLeft];
        [label setBackgroundColor:[UIColor clearColor]];
        label.text = @"飞北京的航线";
        
        _lineL = label;
    }
    return _lineL;
}

- (UILabel *)smallL
{
    if (!_smallL)
    {
        
        UILabel * label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        label.numberOfLines = 0;
        [label setFont:[UIFont systemFontOfSize:15]];
        [label setTextColor:[UIColor blueColor]];
        [label setTextAlignment:NSTextAlignmentLeft];
        [label setBackgroundColor:[UIColor clearColor]];
        label.text = @"我想飞翔。。。";
        
        _smallL = label;
    }
    return _smallL;
}

+ (instancetype)pushPullListCellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * pushPullListCellId = @"PushPullListCell";
    
    PushPullListCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:pushPullListCellId forIndexPath:indexPath];
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self  = [super initWithFrame:frame]) {
        [self backImgV];
        [self priceL];
        [self smallL];
        [self lineL];
        [self otherL];
        [self overlayV];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backImgV.frame = CGRectMake(0, 0, w, h);
    
    CGFloat pw = 100;
    CGFloat ph = 25;
    CGFloat px = w - leftMagin - pw;
    CGFloat py = h - 25 - ph;
    self.priceL.frame = CGRectMake(px, py, pw, ph);
    
    CGFloat ow = 200;
    CGFloat oh = 25;
    CGFloat ox = leftMagin;
    CGFloat oy = 40;
    self.otherL.frame = CGRectMake(ox, oy, ow, oh);
    
    CGFloat lw = 200;
    CGFloat lh = 25;
    CGFloat lx = leftMagin;
    CGFloat ly = py;
    self.lineL.frame = CGRectMake(lx, ly, lw, lh);
    
    CGFloat sw = 200;
    CGFloat sh = 25;
    CGFloat sx = leftMagin;
    CGFloat sy = 20;
    self.smallL.frame = CGRectMake(sx, sy, sw, sh);
    
    self.overlayV.frame = CGRectMake(0, 0, w, h);
    
}

//- (void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//
//}

//- (void)resize
//{
//
//}



@end
