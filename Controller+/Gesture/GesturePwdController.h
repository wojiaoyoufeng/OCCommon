//
//  GesturePwdController.h
//  OCCommon
//
//  Created by 游峰 on 16/4/14.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "BaseViewController.h"

@interface GesturePwdController : BaseViewController

@property (assign, nonatomic) BOOL isOne;//第一次
@property (assign, nonatomic) BOOL isUnlock;//解锁
@property (assign, nonatomic) BOOL isModify;//修改手势
@property (nonatomic, assign) BOOL isReset;//重置（忘记手势密码）
@property (copy, nonatomic) NSString * pwd;//密码

@end
