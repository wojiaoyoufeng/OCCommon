//
//  CountryViewCell.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/2.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CountryModel;

@interface CountryViewCell : UITableViewCell

@property (weak, nonatomic) UIImageView *countryFlagImageV;
@property (weak, nonatomic) UILabel *countryNameL;
@property (weak, nonatomic) UILabel *countryCodeL;
//@property (strong, nonatomic) CountryModel *countryModel;

+ (instancetype)countryViewCellWithTableView:(UITableView *)tableView;

@end
