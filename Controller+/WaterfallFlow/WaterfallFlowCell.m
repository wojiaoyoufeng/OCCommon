//
//  WaterfallFlowCell.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "WaterfallFlowCell.h"

@interface WaterfallFlowCell ()

@end

@implementation WaterfallFlowCell
#pragma mark -- lazy
- (UIImageView *)imageView
{
    if (!_imageView) {
        
        UIImageView * imgeV  = [[UIImageView alloc] initWithFrame:self.bounds];
        [imgeV setImage:[UIImage imageNamed:@"loading.png"]];
        [imgeV setBackgroundColor:[UIColor greenColor]];
        [self.contentView addSubview:imgeV];

        _imageView = imgeV;
    }
    return _imageView;
}

- (UILabel *)botLabel
{
    if (!_botLabel) {
        
        CGFloat labelH = 25;
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - labelH, self.frame.size.width, labelH)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        label.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:label];
        
        _botLabel = label;
    }
    
    return _botLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
       
    }
    
    return self;
}

+ (instancetype)waterfallFlowCellCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * waterfallFlowCellId = @"WaterfallFlowCell";
    WaterfallFlowCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:waterfallFlowCellId forIndexPath:indexPath];
    
    return cell;
}


@end
