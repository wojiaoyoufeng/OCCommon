//
//  TestCollectionViewCell.m
//  OCCommon
//
//  Created by 一泓明峰 on 16/3/7.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "TestCollectionViewCell.h"

@implementation TestCollectionViewCell
#pragma mark -- LAZY
- (UIImageView *)imageV
{
    if (!_imageV) {
        
        UIImageView * imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:imageV];
        imageV.backgroundColor = [UIColor whiteColor];
        imageV.frame = CGRectMake(0, 0, 100, 100);
        [imageV setImage:[UIImage imageNamed:@"Afghanistan.png"]];
        [imageV setHighlightedImage:[UIImage imageNamed:@"Afghanistan.png"]];


        _imageV = imageV;
    }
    return _imageV;
}

- (UILabel *)titleL
{
    if (!_titleL) {
        
        UILabel * label = [[UILabel alloc] init];
        [self addSubview:label];
        label.numberOfLines = 0;
        [label setFont:[UIFont <#font#>]];
        [label setTextColor:[UIColor <#color#>]];
        [label setTextAlignment:<#(NSTextAlignment)#>];
        [label setBackgroundColor:<#(UIColor * _Nullable)#>];
        [label sizeToFit];
        

        
        _titleL = <#impl...#>
    }
    return _titleL;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

@end
