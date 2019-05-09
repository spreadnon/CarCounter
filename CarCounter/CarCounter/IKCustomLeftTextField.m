//
//  IKCustomLeftTextField.m
//  IKToolsModule
//
//  Created by iOS123 on 2019/1/30.
//  Copyright © 2019 HU. All rights reserved.
//

#import "IKCustomLeftTextField.h"
#import "EdgeInsetsLabel.h"
static float leftGap = 8.0;
@interface IKCustomLeftTextField()
@property (nonatomic,strong) EdgeInsetsLabel *titleLabel;

@end

@implementation IKCustomLeftTextField

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [self colorWithHexString:@"#0084FF" alpha:0.05];
        self.textColor = [self colorWithHexString:@"#6239FF" alpha:1.0];
        self.font = [UIFont systemFontOfSize:15];
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.layer.cornerRadius = 3.0f;
        self.clipsToBounds = YES;
        self.keyboardType = UIKeyboardTypeDecimalPad;
        [self buildUI];
        
    }
    return self;
}

- (UIColor *) colorWithHexString: (NSString *)color alpha:(CGFloat)alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
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
        _titleLabel.textColor = [self colorWithHexString:@"#5F5F5F" alpha:1.0];
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
