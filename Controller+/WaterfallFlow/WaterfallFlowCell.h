//
//  WaterfallFlowCell.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterfallFlowCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *botLabel;

+ (instancetype)waterfallFlowCellCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
