//
//  GuidepageCollectionCell.h
//  OCCommon
//
//  Created by 游峰 on 16/3/5.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuidepageCollectionCell : UICollectionViewCell
@property (weak, nonatomic) UIImage * image;
- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;
+ (instancetype)guidepageCollectionCellWithCcollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
