//
//  UIWindow+Extension.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/1.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Extension)
+ (UIWindow *)show;
+ (UIWindow *)showInRect:(CGRect)rect;
+ (UIWindow *)showWithLevel:(UIWindowLevel)level Rect:(CGRect)rect;
+ (UIWindow *)showWithLevel:(UIWindowLevel)level;
+ (void)dismiss;

@end
