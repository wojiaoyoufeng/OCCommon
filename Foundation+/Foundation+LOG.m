//
//  NSDictionary+LOG.m
//  OCCommon
//
//  Created by 游峰 on 16/3/1.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma make -- 打印字典
@implementation NSDictionary (LOG)
- (NSString *)descriptionWithLocale:(id)locale
{
    
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@,\n", key, obj];
    }];
    
    [strM appendString:@"}"];
    
    if (self.allKeys.count > 0) {
        NSRange range = [strM rangeOfString:@"," options:NSBackwardsSearch];
        [strM deleteCharactersInRange:range];
    }
    
    return strM;
}

@end

#pragma make -- 打印数组
@implementation NSArray (LOG)
- (NSString *)descriptionWithLocale:(id)locale
{
    
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:@"[\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@"]\n"];
    
    if (self.count > 0) {
        NSRange range = [strM rangeOfString:@"," options:NSBackwardsSearch];
        [strM deleteCharactersInRange:range];
    }
    
    return strM;
}


@end
