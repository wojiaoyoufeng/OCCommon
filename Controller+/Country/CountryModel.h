//
//  CountryModel.h
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/2.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryModel : NSObject

@property (strong, nonatomic) NSString * area_code;
@property (strong, nonatomic) NSString * cn_key;
@property (strong, nonatomic) NSString * cn_name;
@property (strong, nonatomic) NSString * en_key;
@property (strong, nonatomic) NSString * en_name;
@property (strong, nonatomic) NSString * flag_image_name;
@property (strong, nonatomic) NSArray * formats;
@property (strong, nonatomic) NSString * isocode;
@property (strong, nonatomic) NSString * maxlen;
@property (strong, nonatomic) NSString * minlen;

+ (instancetype)countryModelWintDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
