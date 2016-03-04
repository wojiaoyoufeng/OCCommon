//
//  CountryViewController.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/2.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "BaseViewController.h"
@class CountryViewController;
@protocol CountryViewControllerDelegate <NSObject>
- (void)countryViewControllerGetCountryInfo:(NSDictionary *)dict;
@end
@interface CountryViewController : BaseViewController
@property (nonatomic,assign) id <CountryViewControllerDelegate> delegate;

@end
