//
//  GuidepageCollectionCell.m
//  OCCommon
//
//  Created by 游峰 on 16/3/5.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "GuidepageCollectionCell.h"

@interface GuidepageCollectionCell ()

@property (weak, nonatomic) UIImageView * imageView;
@property (weak, nonatomic) UIButton * startButton;

@end

@implementation GuidepageCollectionCell

#pragma mark -- 构造方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self imageView];
        [self startButton];
    }
    return self;
}

+ (instancetype)guidepageCollectionCellWithCcollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * guidepageCollectionCellId = @"GuidepageCollectionCell";
    GuidepageCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:guidepageCollectionCellId forIndexPath:indexPath];
    
    return cell;
}

#pragma mark -- 懒加载
- (UIImageView *)imageView
{
    if (!_imageView) {
        
        UIImageView * imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:imageV];
        _imageView = imageV;
    }
    return _imageView;
}

- (UIButton *)startButton
{
    if (!_startButton) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"guideStart.png"] forState:UIControlStateNormal];
        [button sizeToFit];
        
        [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        _startButton = button;
    }
    return _startButton;
}

#pragma mark -- 接收图片
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count
{
    if (indexPath.row == count - 1)
    {
        self.startButton.hidden = NO;
    }
    else
    {
        self.startButton.hidden = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.contentView.frame.size.width;
    CGFloat h = self.contentView.frame.size.height;
    self.imageView.frame = CGRectMake(0, 0, w, h);
    self.startButton.center = CGPointMake(w * 0.5, h * 0.88);
}

#pragma mark -- 进入主页
- (void)start
{
    
    UIViewController * vc = [[UIViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}

@end
