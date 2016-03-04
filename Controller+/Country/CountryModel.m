//
//  CountryModel.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/2.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "CountryModel.h"

@implementation CountryModel

/*
 "area_code": "374",
 "cn_key": "A",
 "cn_name": "亚美尼亚",
 "en_key": "A",
 "en_name": "Armenia",
 "flag_image_name": "Armenia.png",
 "formats": [],
 "isocode": "AM",
 "maxlen": "20",
 "minlen": "8"
 */

//- (instancetype)init
//{
//    if (self = [super init]) {
//        self.area_code = @"";
//        self.cn_key = @"";
//        self.cn_name = @"";
//        self.en_key = @"";
//        self.en_name = @"";
//        self.flag_image_name = @"";
//        self.formats = [NSArray arrayWithArray:[NSArray arrayWithObjects:@"", nil]];
//        self.isocode = @"";
//        self.maxlen = @"";
//        self.minlen = @"";
//    }
//    
//    return self;
//}

+ (instancetype)countryModelWintDict:(NSDictionary *)dict
{
    
    return [[self alloc] initWithDict:dict];
}


- (instancetype)initWithDict:(NSDictionary *)dict
{
    
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        self.area_code = dict[@"area_code"];
        self.cn_key = dict[@"cn_key"];
        self.cn_name = dict[@"cn_name"];
        self.en_key = dict[@"en_key"];
        self.en_name = dict[@"en_name"];
        self.flag_image_name = dict[@"flag_image_name"];
        self.formats = dict[@"formats"];
        self.isocode = dict[@"isocode"];
        self.maxlen = dict[@"maxlen"];
        self.minlen = dict[@"minlen"];
    }
    return self;
}


@end
