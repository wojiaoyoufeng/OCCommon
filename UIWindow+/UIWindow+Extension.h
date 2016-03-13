//
//  UIWindow+Extension.h
//  OCCommon
//
//  Created by 游峰 on 16/3/1.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Extension)
+ (UIWindow *)show;
+ (UIWindow *)showInRect:(CGRect)rect;
+ (UIWindow *)showWithLevel:(UIWindowLevel)level Rect:(CGRect)rect;
+ (UIWindow *)showWithLevel:(UIWindowLevel)level;
+ (void)dismiss;

@end
