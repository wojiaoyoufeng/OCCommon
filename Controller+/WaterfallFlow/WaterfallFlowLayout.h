//
//  WaterfallFlowLayout.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/5.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WaterfallFlowLayout;

@protocol WaterfallFlowLayoutDelegate <NSObject>
@required
- (CGFloat)waterfallFlowLayout:(WaterfallFlowLayout *)waterfallFlowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;
@optional
- (CGFloat)columnCountInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(WaterfallFlowLayout *)waterflowLayout;
@end

@interface WaterfallFlowLayout : UICollectionViewLayout
//@property (assign, nonatomic) CGFloat columnCount;
//@property (assign, nonatomic) CGFloat columnMargin;
//@property (assign, nonatomic) CGFloat rowMargin;
//@property (assign, nonatomic) UIEdgeInsets edgeInsets;

@property (weak, nonatomic) id<WaterfallFlowLayoutDelegate> delegate;

@end
