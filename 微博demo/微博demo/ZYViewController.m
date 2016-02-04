//
//  ViewController.m
//  微博demo
//
//  Created by 章芝源 on 16/2/3.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYViewController.h"
#import "ZYWeibo.h"
#import "ZYWeiboFrame.h"
#import "ZYTableViewCell.h"

// 自动装箱,把基本类型的数据转换成对象
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//预编译可以不写前缀msa_
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

#import <Masonry.h>

@interface ZYViewController ()<UITableViewDataSource>
//tableView
@property(nonatomic, strong)UITableView *tableView;
//微博模型数组
@property(nonatomic, strong)NSArray *weibos;

@end

@implementation ZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}


NSString *nani = @"nani";
- (void)setupUI
{
    self.tableView.dataSource = self;
    //注册cell
    [self.tableView registerClass:[ZYTableViewCell class] forCellReuseIdentifier:nani];
}

#pragma mark - tableView数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weibos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYWeiboFrame *weiboFrame = self.weibos[indexPath.row];
    //自定义cell
    ZYTableViewCell *cell = [ZYTableViewCell setupTableViewCellWith:tableView];
    cell.weiboFrame = weiboFrame;
    return cell;
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        self.tableView = _tableView;
        [self.view addSubview:_tableView];
        [_tableView makeConstraints:^(MASConstraintMaker *make) {
            UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
            make.edges.equalTo(self.view).offset(insets);
        }];
    }
    return _tableView;
}

- (NSArray *)weibos
{
    if (!_weibos) {
        _weibos = [[NSArray alloc]init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibos.plist" ofType:nil];
        NSArray *arrayWeibos = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in arrayWeibos) {
            ZYWeibo *weibo = [[ZYWeibo alloc]initWithDict:dict];
            ZYWeiboFrame *weiboFrame = [[ZYWeiboFrame alloc]init];
            weiboFrame.weibo = weibo;
            [arrayM addObject:weiboFrame];
        }
        _weibos = arrayM;
    }
    return _weibos;
}

@end
