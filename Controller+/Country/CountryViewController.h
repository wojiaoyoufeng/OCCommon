//
//  CountryViewController.h
//  OCCommon
//
//  Created by 游峰 on 16/3/2.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "BaseViewController.h"
@class CountryViewController;
@protocol CountryViewControllerDelegate <NSObject>
- (void)yf_countryViewControllerGetCountryInfo:(NSDictionary *)dict;
@end
@interface CountryViewController : BaseViewController
@property (nonatomic,assign) id <CountryViewControllerDelegate> delegate;

@end
