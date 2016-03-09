//
//  GuidepageCollectionCell.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
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
        
        UIImageView * imageV = [[UIImageView alloc] initWithFrame:self.bounds];
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
        button.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.85);
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

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count
{
    if (indexPath.row == 0)
    {
        
    }
    else
    {
        
    }
}

#pragma mark -- 进入主页
- (void)start
{
    
    UIViewController * vc = [[UIViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}

@end
