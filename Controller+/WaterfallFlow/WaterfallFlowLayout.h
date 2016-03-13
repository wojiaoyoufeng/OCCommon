//
//  WaterfallFlowLayout.h
//  OCCommon
//
//  Created by 游峰 on 16/3/5.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterfallFlowLayout;
@protocol WaterfallFlowLayoutDelegate <NSObject>
@required
- (CGFloat)waterfallFlowLayout:(WaterfallFlowLayout *)waterfallFlowLayout heightForItemAtIndex:(NSInteger)index itemWidth:(CGFloat)itemWidth;
@optional
- (CGFloat)columnCountInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout;
@end

@interface WaterfallFlowLayout : UICollectionViewLayout

@property (weak, nonatomic) id<WaterfallFlowLayoutDelegate> delegate;

@end
