//
//  ZYTableViewCell.m
//  微博demo
//
//  Created by 章芝源 on 16/2/3.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYTableViewCell.h"
#import "ZYWeiboFrame.h"
#import "ZYWeibo.h"

// 自动装箱,把基本类型的数据转换成对象
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//预编译可以不写前缀msa_
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

#import <Masonry.h>
@interface ZYTableViewCell()
//头像
@property(nonatomic, strong)UIImageView *iconImgView;
//配图
@property(nonatomic, strong)UIImageView *picImgView;
//昵称
@property(nonatomic, strong)UILabel *nameLb;
//vip
@property(nonatomic, strong)UIImageView *vipImgView;
//正文
@property(nonatomic, strong)UILabel *textLb;
@end
@implementation ZYTableViewCell

static NSString *nani = @"nani";
//设置cell内容
+ (instancetype)setupTableViewCellWith:(UITableView *)tableView
{
    ZYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nani];
    if (cell == nil) {
        cell = [[ZYTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nani];
    }
    return cell;
}

//重写
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建cell子控件
        //头像
        UIImageView *iconImgView = [[UIImageView alloc]init];
        self.iconImgView = iconImgView;
        [self.contentView addSubview:iconImgView];
        
        //配图
        UIImageView *picImgView = [[UIImageView alloc]init];
        self.picImgView = picImgView;
        [self.contentView addSubview:picImgView];
        
        //昵称
        UILabel *nameLb = [[UILabel alloc]init];
        self.nameLb = nameLb;
        [self.contentView addSubview:nameLb];
        
        //vip图片
        UIImageView *vipImgView = [[UIImageView alloc]init];
        self.vipImgView = vipImgView;
        [self.contentView addSubview:vipImgView];
        
        //正文
        UILabel *textLb = [[UILabel alloc]init];
        self.textLb = textLb;
        [self.contentView addSubview:textLb];
    }
    return self;
}



#pragma mark - 设置cell子控件内容
- (void)setWeiboFrame:(ZYWeiboFrame *)weiboFrame
{
    _weiboFrame = weiboFrame;
    
    //设置控件内容
    [self setupSubviewsContent];
    //设置控件frame
    [self setupSubviewsFrame];
}

- (void)setupSubviewsContent
{
    ZYWeibo *weibo = self.weiboFrame.weibo;
    
    //头像
    self.iconImgView.image = weibo.icon;
    
    //判断有没有配图
    if (weibo.picture) {
        self.picImgView.image = weibo.picture;
        self.picImgView.hidden = NO;
    }else{
        self.picImgView.hidden = YES;
    }
   
    //昵称
    self.nameLb.text = weibo.name;
    
    //正文
    self.textLb.text = weibo.text;
    
    //判断是否vip
    if (weibo.vip) {
        self.nameLb.textColor = [UIColor redColor];
        self.vipImgView.image = [UIImage imageNamed:@"vip"];
        self.vipImgView.hidden = NO;
    }else{
        self.vipImgView.hidden = YES;
    }
}

- (void)setupSubviewsFrame
{
    ZYWeiboFrame *weiboFrame = self.weiboFrame;
    
    //头像
    self.iconImgView.frame = weiboFrame.iconFrame;
    //配图
    self.picImgView.frame = weiboFrame.pictureFrame;
    //vip
    self.vipImgView.frame = weiboFrame.vipFrame;
    //正文
    self.textLb.frame = weiboFrame.textFrame;
    //昵称
    self.nameLb.frame = weiboFrame.nameFrame;
    
}

#pragma mark - 懒加载

- (void)awakeFromNib {
    NSLog(@"yyyy");
}


@end
