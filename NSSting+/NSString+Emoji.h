//
//  NSString+Emoji.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/1.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Emoji)

#pragma make -- 判断是否有emoji表情
+ (BOOL)isContainsEmoji:(NSString *)string;

@end
