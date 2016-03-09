//
//  CollectionViewCell.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *startButton;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        [self imageView];
//        [self startButton];
    }
    return self;
}

+ (instancetype)collectionViewCell
{
    return [[CollectionViewCell alloc] init];
}

- (UIButton *)startButton
{
    if (_startButton == nil) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart.png"] forState:UIControlStateNormal];
        
        [btn sizeToFit];
        
        btn.center = CGPointMake(self.width * 0.5, self.height * 0.9);
        
        [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        _startButton = btn;
        
        [self addSubview:btn];
    }
    
    return _startButton;
}


- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [imageV setImage:self.image];
        [self.contentView addSubview:imageV];
        
        _imageView = imageV;
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count
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

- (void)start
{
    UIViewController * vc = [[UIViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
}

+ (instancetype)collectionViewCellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * collectionViewCellId = @"CollectionViewCell";
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellId forIndexPath:indexPath];
    
    return cell;
}


@end
