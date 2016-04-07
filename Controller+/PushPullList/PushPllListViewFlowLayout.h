//
//  PushPllListViewFlowLayout.h
//  OCCommon
//
//  Created by 游峰 on 16/3/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushPllListViewFlowLayout : UICollectionViewFlowLayout
@property (assign, nonatomic) CGFloat standartHeight;
@property (assign, nonatomic) CGFloat pushPullHeight;
@property (assign, nonatomic) CGFloat dragOffset;
- (void)setStandartHeight:(CGFloat)standartHeight;

@end
