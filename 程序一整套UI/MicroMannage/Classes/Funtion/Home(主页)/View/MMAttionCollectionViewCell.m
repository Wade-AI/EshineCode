//
//  MMAttionCollectionViewCell.m
//  MicroMannage
//
//  Created by 倪望龙 on 2017/3/7.
//  Copyright © 2017年 xunyijia. All rights reserved.
//
#import<QuartzCore/QuartzCore.h>
#import "MMAttionCollectionViewCell.h"
@interface MMAttionCollectionViewCell()
@property(nonatomic,strong)UIButton *btnClose;
@property(nonatomic,strong)UIImageView *logoImage;
@property(nonatomic,strong)UILabel *lableTitle;
@property(nonatomic,strong)UILabel *lableSubtitle;
@property(nonatomic,strong)UIButton *btnFunc;
@end
@implementation MMAttionCollectionViewCell

-(UIButton *)btnClose{
    if(_btnClose == nil){
        _btnClose = [UIButton new];
        [_btnClose setImage:[UIImage imageNamed:@"del_icon_guanbi"] forState:UIControlStateNormal];
//        [_btnClose setBackgroundColor:HEXCOLOR(0x999999) forState:UIControlStateHighlighted];
        [_btnClose.imageView setContentMode:UIViewContentModeCenter];
        [_btnClose addTarget:self action:@selector(btnCloseClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnClose;
}

-(UIImageView *)logoImage{
    if(_logoImage == nil){
        _logoImage = [UIImageView new];
        _logoImage.layer.cornerRadius = 30.0f;
        _logoImage.backgroundColor = [UIColor redColor];
        _logoImage.layer.masksToBounds = YES;
    }
    return _logoImage;
}

-(UILabel *)lableTitle{
    if(_lableTitle == nil){
        _lableTitle = [UILabel new];
        [_lableTitle setTextColor:HEXCOLOR(0x333333)];
        [_lableTitle setFont:[UIFont systemFontOfSize:15.0f]];
        [_lableTitle setTextAlignment:NSTextAlignmentCenter];
        [_lableTitle setNumberOfLines:2];
        [_lableTitle setLineBreakMode:NSLineBreakByTruncatingTail];
        _lableTitle.text = @"测试新闻";
    }
    return _lableTitle;
}

-(UILabel *)lableSubtitle{
    if(_lableSubtitle == nil){
        _lableSubtitle = [UILabel new];
        [_lableSubtitle setFont:[UIFont systemFontOfSize:13.0f]];
        [_lableSubtitle setTextColor:HEXCOLOR(0x999999)];
        [_lableSubtitle setTextAlignment:NSTextAlignmentCenter];
        _lableSubtitle.numberOfLines = 1;
        _lableSubtitle.text = @"柳叶叶";
    }
    return _lableSubtitle;
}

-(UIButton *)btnFunc{
    if(_btnFunc == nil){
        _btnFunc = [UIButton new];
        [_btnFunc setTitleColor:HEXCOLOR(kBlueColor) forState:UIControlStateNormal];
        [_btnFunc setBackgroundColor:HEXCOLOR(kBlueColor) forState:UIControlStateHighlighted];
        [_btnFunc setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_btnFunc.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
        _btnFunc.layer.cornerRadius = 5.0f;
        _btnFunc.layer.borderColor = HEXCOLOR(kBlueColor).CGColor;
        _btnFunc.layer.borderWidth = 1.0f;
        _btnFunc.layer.masksToBounds = YES;
        [_btnFunc setTitle:@"查看更多" forState:UIControlStateNormal];
        [_btnFunc addTarget:self action:@selector(btnFuncClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnFunc;
}



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
         [self MCsetUpSubview];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self MCsetUpSubview];
    }
    return self;
}

-(void)MCsetUpSubview{
    self.contentView.layer.cornerRadius = 5.0f;
    self.contentView.layer.borderWidth = 0.5f;
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.borderColor = HEXCOLOR(0xcccccc).CGColor;
    self.contentView.layer.shadowOpacity = 0.5;
    self.contentView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.contentView.layer.shadowRadius = 2.0f;
    self.contentView.layer.shadowOffset  = CGSizeMake(1, 1);
    
    [self.contentView addSubview:self.btnClose];
    [self.contentView addSubview:self.logoImage];
    [self.contentView addSubview:self.lableTitle];
    [self.contentView addSubview:self.lableSubtitle];
    [self.contentView addSubview:self.btnFunc];
    
    [_btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(28.0f, 28.0f));
    }];
    
    [_logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).with.offset(16.0f);
        make.size.mas_equalTo(CGSizeMake(60.0f, 60.0F));
    }];
    
    [_lableTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_logoImage.mas_bottom).with.offset(13.0f);
        make.left.mas_equalTo(self.contentView).with.offset(15.0f);
        make.right.mas_equalTo(self.contentView).with.offset(-15.0f);
        make.height.mas_equalTo(35.0f);
    }];
    
    [_lableSubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(17.0f);
        make.left.right.mas_equalTo(_lableTitle);
        make.top.mas_equalTo(_lableTitle.mas_bottom).with.offset(4);
    }];
    
    [_btnFunc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_lableSubtitle.mas_bottom).with.offset(8.0f);
        make.height.mas_equalTo(28.0f);
        make.left.right.mas_equalTo(_lableTitle);
    }];
}

-(void)btnCloseClick{
    
}

-(void)btnFuncClick{

}

@end
