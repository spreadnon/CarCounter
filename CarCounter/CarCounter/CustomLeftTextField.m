//
//  CustomLeftTextField.m
//  IKToolsModule
//
//  Created by jeremy on 2019/5/9.
//  Copyright © 2019 jeremy. All rights reserved.
//

#import "CustomLeftTextField.h"
#import "EdgeInsetsLabel.h"
#import "DefineFile.h"
static float leftGap = 8.0;
@interface CustomLeftTextField()
@property (nonatomic,strong) EdgeInsetsLabel *titleLabel;

@end

@implementation CustomLeftTextField

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = ZBRGBHexAlpha(0xBFDDFF,0.5);
        self.textColor = ZBRGBHexAlpha(0x0076FE,1);
        self.font = [UIFont systemFontOfSize:15];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.layer.cornerRadius = 3.0f;
        self.clipsToBounds = YES;
        self.keyboardType = UIKeyboardTypeDecimalPad;
        [self buildUI];
        
    }
    return self;
}

- (void)buildUI{
    self.leftView = self.titleLabel;
    self.leftViewMode = UITextFieldViewModeAlways;
}


- (EdgeInsetsLabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[EdgeInsetsLabel alloc]initWithFrame:CGRectMake(0,0, 100, 50)];
        _titleLabel.text = @"";
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.numberOfLines = 1;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = ZBRGBHexAlpha(0x5F5F5F,1);
        _titleLabel.contentInset = UIEdgeInsetsMake(0, leftGap, 0, 0);
    }
    return _titleLabel;
}


- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLabel.text = _title;
    
    //4.根据text的font和字符串自动算出size（重点）
    CGSize size = [_title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];

    //5.根据size设置frame
    self.titleLabel.frame = CGRectMake(0, 0, size.width+12, 50);
  
}


@end
