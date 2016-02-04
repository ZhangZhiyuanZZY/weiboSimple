//
//  ZYTableViewCell.m
//  微博demo
//
//  Created by 章芝源 on 16/2/3.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYTableViewCell.h"
#import "ZYWeibo.h"

// 自动装箱,把基本类型的数据转换成对象
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

//预编译可以不写前缀msa_
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

#import <Masonry.h>

//间距
#define ZYMARGIN 10
//正文字体
#define ZYTEXTFONT [UIFont systemFontOfSize:12]
//名字字体
#define ZYNAMEFONT [UIFont systemFontOfSize:13]

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
        self.iconImgView.image = self.weibo.icon;
    
        //昵称
        self.nameLb.text = self.weibo.name;
        
        //vip图片
        self.vipImgView.image = [UIImage imageNamed:@"vip"];
        
        //正文
        self.textLb.text = self.weibo.text;

        //配图
        self.picImgView.image = self.weibo.picture;
        
        //cell  rowheight
        CGFloat maxY = CGRectGetMaxY(self.textLb.frame);
        self.cellRowHeight = maxY + ZYMARGIN;
        
        NSLog(@"%@", self.iconImgView);
    
    }
    return self;
}


#pragma mark - 懒加载
- (UIImageView *)iconImgView
{
    if (!_iconImgView) {
        _iconImgView = [[UIImageView alloc]init];
        [self addSubview:_iconImgView];
        [_iconImgView makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(30);
            make.top.left.equalTo(self).offset(ZYMARGIN);
        }];
    }
    return _iconImgView;
}

- (UILabel *)nameLb
{
    if (!_nameLb) {
        _nameLb = [[UILabel alloc]init];
        self.nameLb = _nameLb;
        CGSize nameSize = [self sizeWithText:self.weibo.name font:ZYNAMEFONT maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        
        [self addSubview:_nameLb];
        [_nameLb makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(nameSize.height);
            make.width.equalTo(nameSize.width);
            make.left.equalTo(self.iconImgView.right).offset(ZYMARGIN);
            make.top.equalTo(self.iconImgView).offset(0);
        }];
    }
    return _nameLb;
}

- (UIImageView *)vipImgView
{
    if (!_vipImgView) {
        _vipImgView = [[UIImageView alloc]init];
        self.vipImgView = _vipImgView;
        [self addSubview:_vipImgView];
        
        [_vipImgView makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(15);
            make.left.equalTo(self.iconImgView.right).offset(ZYMARGIN);
            make.top.equalTo(self.iconImgView);
        }];
    }
    return _vipImgView;
}

- (UILabel *)textLb
{
    if (!_textLb) {
        _textLb = [[UILabel alloc]init];
        self.textLb = _textLb;
        [self addSubview:_textLb];
        CGFloat textMaxW = [UIScreen mainScreen].bounds.size.width - 2 * ZYMARGIN;
        CGSize textSize = [self sizeWithText:self.weibo.text font:ZYTEXTFONT maxSize:CGSizeMake(textMaxW, MAXFLOAT)];
        CGFloat textH = textSize.height;
        [_textLb makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.left).offset(ZYMARGIN);
            make.right.equalTo(self.right).offset(-ZYMARGIN);
            make.bottom.equalTo(self.bottom).offset(-ZYMARGIN);
            make.height.equalTo(textH);
        }];
    }
    return _textLb;
}

- (UIImageView *)picImgView
{
    if (!_picImgView) {
        _picImgView = [[UIImageView alloc]init];
        self.picImgView = _picImgView;
        [self addSubview:_picImgView];
        
        [_picImgView makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(100);
            make.left.equalTo(self.left).offset(10);
            make.top.equalTo(self.iconImgView.bottom).offset(10);
            make.bottom.equalTo(self.textLb.top).offset(-10);
        }];
    }
    return _picImgView;
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    //指定字体
    NSDictionary *attrs = @{NSFontAttributeName : font};
    
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


- (void)awakeFromNib {
    NSLog(@"yyyy");
}


@end
