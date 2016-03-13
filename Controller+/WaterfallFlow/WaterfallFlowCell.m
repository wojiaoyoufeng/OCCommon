//
//  WaterfallFlowCell.m
//  OCCommon
//
//  Created by 游峰 on 16/3/5.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "WaterfallFlowCell.h"

@interface WaterfallFlowCell ()

@end

@implementation WaterfallFlowCell
#pragma mark -- lazy
- (UIImageView *)imageView
{
    if (!_imageView) {
        
        UIImageView * imgeV  = [[UIImageView alloc] init];
        [self.contentView addSubview:imgeV];
        [imgeV setImage:[UIImage imageNamed:@"loading.png"]];

        _imageView = imgeV;
    }
    return _imageView;
}

- (UILabel *)botLabel
{
    if (!_botLabel) {
        
        UILabel * label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        
        label.textAlignment = NSTextAlignmentCenter;
        [label setTextColor:[UIColor whiteColor]];
        label.font = [UIFont systemFontOfSize:17];
        label.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4];
        
        _botLabel = label;
    }
    
    return _botLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self imageView];
        [self botLabel];
    }
    
    return self;
}

+ (instancetype)waterfallFlowCellCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * waterfallFlowCellId = @"WaterfallFlowCell";
    
    WaterfallFlowCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:waterfallFlowCellId forIndexPath:indexPath];
    
    return cell;
}

/**
  当布局发送改变的都会调用这个方法
  如果是涉及动态布局, 一定要重写这个方法
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = self.contentView.frame.size.width;
    CGFloat h = self.contentView.frame.size.height;
    self.imageView.frame = CGRectMake(0, 0, w, h);
    
    CGFloat lh = 25;
    CGFloat ly = h - lh;
    self.botLabel.frame = CGRectMake(0, ly, w, lh);
}

@end
