//
//  ZYWeibo.m
//  微博demo
//
//  Created by 章芝源 on 16/2/3.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYWeibo.h"

@implementation ZYWeibo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

#pragma mark - 在模型中将字符串转图片做完
- (void)setIcon:(UIImage *)icon
{
    NSString *imgStr = (NSString *)icon;
    UIImage *image = [UIImage imageNamed:imgStr];
    _icon = image;
}

- (void)setPicture:(UIImage *)picture
{
    NSString *imgStr = (NSString *)picture;
    UIImage *image = [UIImage imageNamed:imgStr];
    _picture = image;
}

- (void)setVip:(int)vip
{
    NSString *imgStr = (NSString *)vip;
    
}
@end
