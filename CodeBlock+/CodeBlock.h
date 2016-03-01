//
//  CodeBlock.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/1.
//  Copyright © 2016年 RJ. All rights reserved.
//

        //=================== 培育技术阅读的习惯 ===================
        //=================== 培育阅读的习惯----接收新知识新技术的类型的人才  ===================

/**
 此代码块, 为了直接养成个人代码习惯, 节约时间, 使用方便
 */

// ============  Objective-C  ==============

// 星星注释 youf
/** <#desc...#> */
// 标注#pragma
pragma mark -- <#desc...#>
// 自动提示宏 zidongtishihong
#define HFkeyPath(objc, keyPath) @(((void)objc.keyPath, #keyPath))

// 加载xib xibLoad
[[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];

// Weak属性生成 weakpro
@property (weak, nonatomic) <#type#> * <#name#>
// Strong属性生成 strongpro
@property (strong, nonatomic) <#class#> * <#name#>
// Assign属性生成 assignpro
@property (assign, nonatomic) <#type#> <#name#>
// Copy属性生成 copypro
@property (copy, nonatomic) <#type#> * <#name#>
// Delegate属性生成 delegatepro
@property (weak, nonatomic) id<<#protocol#>> delegate<#jump#>

// 代理监听 ifdelegate
if([self.delegate respondsToSelector:@selector(<#selector#>)]){
   [self.delegate <#selector#>];<#jump#>
}

// 定义模型 initmodel.h
+ (instancetype)<#model#>
+ (instancetype)<#model#>WintDict:(NSDictionary *)dict<#jump#>
- (instancetype)initWithDict:(NSDictionary *)dict<#jump#>

// 实例模型 initmodel.m
+ (instancetype)<#model#>{
    
    return [[[self class] alloc] init];
}
<#jump#>

+ (instancetype)<#model#>WintDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}
<#jump#>

- (instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
<#jump#>

// 初始化模型 initmodel
- (instancetype)init
{
    if (self = [super init]) {
        
        self.<#name#> = @"";
        self.<#name#>
    }
    return self;
}
<#jump#>


// 懒加载 if!
if(!_<#name#>){
    
    <#init#>
    _<#name#> = <#impl...#>
    }
    return _<#name#>

// fori循环
for (<#int#> i = 0; i < <#count#>; i++){
    
    <#wirte#>
}
// fori循环
for (<#int#> j = 0; j < <#count#>; j++){
    
    <#wirte#>
}
    

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CodeBlock : NSObject





















@end
