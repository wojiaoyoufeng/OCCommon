//
//  Singleton.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/1.
//  Copyright © 2016年 RJ. All rights reserved.
//

/**
 此是示例 : 
 单例要满足的三个条件
 1. 类的构造方法是私有的: 某个类只能有一个实例。
 2. 类提供一个类方法用于产生对象: 他必须自行创建这个对象
 3. 类中有一个私有的自己对象: 必须自行向整个系统提供这个实例
 
 //保存一个全局的static变量 静态变量 
 //这个方法必须是一个静态类
 //静态方法
 //不能让外部访问，同时放在静态块中的
 //单例在什么时候都不要释放 因为其实就是全局变量
 
 */

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

+ (instancetype)shareSingleton;
+ (instancetype)defaultSingleton;

@end
