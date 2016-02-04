//
//  ZYWeiboFrame.h
//  微博demo
//
//  Created by 章芝源 on 16/2/4.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYWeibo.h"
@interface ZYWeiboFrame : NSObject
@property(nonatomic, strong)ZYWeibo *weibo;

//cell子控件的frame
///头像
@property(assign, nonatomic)CGRect iconFrame;
///昵称
@property(assign, nonatomic)CGRect nameFrame;
///vip
@property(assign, nonatomic)CGRect vipFrame;
///正文
@property(assign, nonatomic)CGRect textFrame;
///配图
@property(assign, nonatomic)CGRect pictureFrame;
///行高
@property(assign, nonatomic)CGRect rowHeigtFrame;

@end
