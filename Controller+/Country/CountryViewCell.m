//
//  CountryViewCell.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/2.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "CountryViewCell.h"
#import "CountryModel.h"

@implementation CountryViewCell
- (UIImageView *)countryFlagImageV
{
    if (!_countryFlagImageV) {
        
        UIImageView * imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:imageV];
        _countryFlagImageV = imageV;
    }
    return _countryFlagImageV;
}

- (UILabel *)countryNameL
{
    if (!_countryNameL) {
        
        UILabel * label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont fontWithName:nil size:15];
        [self.contentView addSubview:label];
        _countryNameL = label;
    }
    return _countryNameL;
}

- (UILabel *)countryCodeL
{
    if (!_countryCodeL) {
        
        UILabel * label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont fontWithName:nil size:14];
        [self.contentView addSubview:label];
        _countryCodeL = label;
    }
    return _countryCodeL;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
    }
    return self;
}

+ (instancetype)countryViewCellWithTableView:(UITableView *)tableView
{
    static NSString * countryViewCellId = @"CountryViewCell";
    CountryViewCell * cell = [tableView dequeueReusableCellWithIdentifier:countryViewCellId];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:countryViewCellId];
    }
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.countryFlagImageV.frame = CGRectMake(15, 0, 24, 24);
    self.countryFlagImageV.centerY = self.contentView.centerY;
    
    CGFloat nx = CGRectGetMaxX(self.countryFlagImageV.frame) + 10;
    self.countryNameL.frame = CGRectMake(nx, 0, 120, 21);
    self.countryNameL.centerY = self.contentView.centerY;
    
    CGFloat cx = self.contentView.right - 15 - 85;
    self.countryCodeL.frame = CGRectMake(cx, 0, 85, 21);
    self.countryCodeL.centerY = self.contentView.centerY;
}


@end
