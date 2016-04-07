//
//  PushPullListCell.h
//  OCCommon
//
//  Created by 游峰 on 16/3/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushPullListCell : UICollectionViewCell
@property (weak, nonatomic) UIView * overlayV;
@property (weak, nonatomic) UIImageView * backImgV;
@property (weak, nonatomic) UILabel * priceL;
@property (weak, nonatomic) UILabel * otherL;
@property (weak, nonatomic) UILabel * lineL;
@property (weak, nonatomic) UILabel * smallL;

+ (instancetype)pushPullListCellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
