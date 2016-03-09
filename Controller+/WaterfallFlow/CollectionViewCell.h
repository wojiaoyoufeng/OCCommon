//
//  CollectionViewCell.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) UIImage * image;
//@property (nonatomic, weak) UIImageView *imageView;
- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;

+ (instancetype)collectionViewCellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
