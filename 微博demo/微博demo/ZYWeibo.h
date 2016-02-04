//
//  ZYWeibo.h
//  微博demo
//
//  Created by 章芝源 on 16/2/3.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYWeibo : NSObject
//正文
@property(nonatomic, copy)NSString *text;
//头像
@property(strong, nonatomic)UIImage *icon;
//昵称
@property(copy, nonatomic)NSString *name;
//配图
@property(copy, nonatomic)UIImage *picture;
//是否vip
@property(assign, nonatomic)int vip;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
