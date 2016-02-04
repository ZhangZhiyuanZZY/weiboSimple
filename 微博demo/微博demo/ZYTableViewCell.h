//
//  ZYTableViewCell.h
//  微博demo
//
//  Created by 章芝源 on 16/2/3.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYWeibo;
@interface ZYTableViewCell : UITableViewCell
@property(nonatomic, strong)ZYWeibo *weibo;
@property(assign, nonatomic)CGFloat cellRowHeight;
+ (instancetype)setupTableViewCellWith:(UITableView *)tableView;
@end
