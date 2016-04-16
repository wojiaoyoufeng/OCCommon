//
//  GesturePwdView.h
//  OCCommon
//
//  Created by 游峰 on 16/4/14.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GesturePwdView;

@protocol GesturePwdViewDelegate <NSObject>
- (void)gesturePwdViewGetDrawString:(GesturePwdView *)gesturePwdView;//获取绘制的值
- (void)gesturePwdViewGetBeganDraw:(GesturePwdView *)gesturePwdView;//再次绘制的时候 self.wearingLabel不显示
@end

@interface GesturePwdView : UIView
@property (strong, nonatomic) NSMutableString * drawStr;//绘制的文字
@property (weak, nonatomic) id<GesturePwdViewDelegate> delegate;


@end
