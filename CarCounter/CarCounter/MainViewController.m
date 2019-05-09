//
//  MainViewController.m
//  CarCounter
//
//  Created by jeremy on 2019/5/9.
//  Copyright © 2019 jeremy. All rights reserved.
//

#import "MainViewController.h"
#import "CustomLeftTextField.h"
#import "UIControl+Block.h"
#import "Masonry.h"
#import "MBManager.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface MainViewController ()
@property (nonatomic,strong) CustomLeftTextField *insuranceField;
@property (nonatomic,strong) CustomLeftTextField *insuranceDiscountField;
@property (nonatomic,strong) UILabel *insurancePercentageLabel;

@property (nonatomic,strong) CustomLeftTextField *businessField;
@property (nonatomic,strong) CustomLeftTextField *businessDiscountField;
@property (nonatomic,strong) UILabel *businessPercentageLabel;

@property (nonatomic,strong) CustomLeftTextField *carAndShipField;
@property (nonatomic,strong) CustomLeftTextField *carAndShipDiscountField;
@property (nonatomic,strong) UILabel *allMoneyLabel;
@property (nonatomic,strong) UILabel *saleMoneyLabel;

@property (nonatomic,strong) UIButton *cleanBtn;
@property (nonatomic,strong) UIButton *calculationbBtn;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"车保计算器";
    UIBarButtonItem *leftCunstomButtonView = [[UIBarButtonItem alloc] initWithCustomView:self.cleanBtn];
    self.navigationItem.leftBarButtonItem = leftCunstomButtonView;
    
    UIBarButtonItem *rightCunstomButtonView = [[UIBarButtonItem alloc] initWithCustomView:self.calculationbBtn];
    self.navigationItem.rightBarButtonItem = rightCunstomButtonView;
    
    
    [self.view addSubview:self.insuranceField];
    
    CGFloat firstWidth = SCREEN_WIDTH - 80;
    ///1
    [self.insuranceField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(firstWidth/2);
    }];
    
    [self.view addSubview:self.insurancePercentageLabel];
    [self.insurancePercentageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.insuranceDiscountField];
    [self.insuranceDiscountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.equalTo(self.insuranceField.mas_right).offset(10);
        make.right.equalTo(self.insurancePercentageLabel.mas_left).offset(-10);
        make.height.mas_equalTo(50);
    }];
    
    ///2
    [self.view addSubview:self.businessField];
    [self.businessField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.insuranceField.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(firstWidth/2);
    }];
    
    
    [self.view addSubview:self.businessPercentageLabel];
    [self.businessPercentageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.insuranceField.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(40);
    }];
    
    
    [self.view addSubview:self.businessDiscountField];
    [self.businessDiscountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.insuranceField.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
        make.left.equalTo(self.insuranceField.mas_right).offset(10);
        make.right.equalTo(self.businessPercentageLabel.mas_left).offset(-10);
    }];
    
    ///3
    [self.view addSubview:self.carAndShipField];
    [self.carAndShipField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.businessField.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(SCREEN_WIDTH/2-5);
    }];
    
    [self.view addSubview:self.carAndShipDiscountField];
    [self.carAndShipDiscountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.businessField.mas_bottom).offset(10);
        make.left.equalTo(self.carAndShipField.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(SCREEN_WIDTH/2-20);
    }];
    
    ///4
    [self.view addSubview:self.saleMoneyLabel];
    [self.saleMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.carAndShipField.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
    }];
    
    [self.view addSubview:self.allMoneyLabel];
    [self.allMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.saleMoneyLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
    }];
    

}

- ( CustomLeftTextField*)insuranceField{
    if (!_insuranceField) {
        _insuranceField = [[ CustomLeftTextField alloc] init];
        [_insuranceField addTarget:self action:@selector(nameTextFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        _insuranceField.title = @"交强保费:";
        _insuranceField.text = @"";
        _insuranceField.placeholder = @"0.0";
    }
    return _insuranceField;
}

- ( CustomLeftTextField*)insuranceDiscountField{
    if (!_insuranceDiscountField) {
        _insuranceDiscountField = [[ CustomLeftTextField alloc] init];
        [_insuranceDiscountField addTarget:self action:@selector(nameTextFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        _insuranceDiscountField.title = @"交强比例:";
        _insuranceDiscountField.text = @"";
        _insuranceDiscountField.placeholder = @"0.0";
    }
    return _insuranceDiscountField;
}

- (UILabel *)insurancePercentageLabel{
    if (!_insurancePercentageLabel) {
        _insurancePercentageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 50, 50)];
        _insurancePercentageLabel.text = @"÷ 1.06";
        _insurancePercentageLabel.font = [UIFont systemFontOfSize:13];
        _insurancePercentageLabel.numberOfLines = 1;
        _insurancePercentageLabel.textAlignment = NSTextAlignmentRight;
        _insurancePercentageLabel.textColor = [self colorWithHexString:@"#88889C" alpha:1.0];
    }
    return _insurancePercentageLabel;
}

- ( CustomLeftTextField*)businessField{
    if (!_businessField) {
        _businessField = [[ CustomLeftTextField alloc] init];
        [_businessField addTarget:self action:@selector(nameTextFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        _businessField.title = @"商业保费:";
        _businessField.text = @"";
        _businessField.placeholder = @"0.0";
    }
    return _businessField;
}

- ( CustomLeftTextField*)businessDiscountField{
    if (!_businessDiscountField) {
        _businessDiscountField = [[ CustomLeftTextField alloc] init];
        [_businessDiscountField addTarget:self action:@selector(nameTextFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        _businessDiscountField.title = @"商业比例:";
        _businessDiscountField.text = @"";
        _businessDiscountField.placeholder = @"0.0";
    }
    return _businessDiscountField;
}

- (UILabel *)businessPercentageLabel{
    if (!_businessPercentageLabel) {
        _businessPercentageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 50, 50)];
        _businessPercentageLabel.text = @"÷ 1.06";
        _businessPercentageLabel.font = [UIFont systemFontOfSize:13];
        _businessPercentageLabel.numberOfLines = 1;
        _businessPercentageLabel.textAlignment = NSTextAlignmentRight;
        _businessPercentageLabel.backgroundColor = [UIColor clearColor];
        _businessPercentageLabel.textColor = [self colorWithHexString:@"#88889C" alpha:1.0];
    }
    return _businessPercentageLabel;
}

- ( CustomLeftTextField*)carAndShipField{
    if (!_carAndShipField) {
        _carAndShipField = [[ CustomLeftTextField alloc] init];
        [_carAndShipField addTarget:self action:@selector(nameTextFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        _carAndShipField.title = @"车船税费:";
        _carAndShipField.text = @"";
        _carAndShipField.placeholder = @"0.0";
    }
    return _carAndShipField;
}

- ( CustomLeftTextField*)carAndShipDiscountField{
    if (!_carAndShipDiscountField) {
        _carAndShipDiscountField = [[ CustomLeftTextField alloc] init];
        [_carAndShipDiscountField addTarget:self action:@selector(nameTextFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
        _carAndShipDiscountField.title = @"车船比例:";
        _carAndShipDiscountField.text = @"";
        _carAndShipDiscountField.placeholder = @"0.0";
    }
    return _carAndShipDiscountField;
}

- (UILabel *)saleMoneyLabel{
    if (!_saleMoneyLabel) {
        _saleMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 50, 50)];
        _saleMoneyLabel.text = @"手续费合计应收净费：0.0元";
        _saleMoneyLabel.font = [UIFont boldSystemFontOfSize:16];
        _saleMoneyLabel.numberOfLines = 1;
        _saleMoneyLabel.textAlignment = NSTextAlignmentRight;
        _saleMoneyLabel.backgroundColor = [UIColor clearColor];
        _saleMoneyLabel.layer.cornerRadius = 3.0f;
        _saleMoneyLabel.clipsToBounds = YES;
        _saleMoneyLabel.textColor = [self colorWithHexString:@"#FA7268" alpha:1.0];
    }
    return _saleMoneyLabel;
}

- (UILabel *)allMoneyLabel{
    if (!_allMoneyLabel) {
        _allMoneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 50, 50)];
        _allMoneyLabel.text = @"应收净费：0.0元";
        _allMoneyLabel.font = [UIFont boldSystemFontOfSize:16];
        _allMoneyLabel.numberOfLines = 1;
        _allMoneyLabel.textAlignment = NSTextAlignmentRight;
        _allMoneyLabel.backgroundColor = [UIColor clearColor];
        _allMoneyLabel.layer.cornerRadius = 3.0f;
        _allMoneyLabel.clipsToBounds = YES;
        _allMoneyLabel.textColor = [self colorWithHexString:@"#FA7268" alpha:1.0];
    }
    return _allMoneyLabel;
}


- (UIButton *)cleanBtn{
    if (!_cleanBtn) {
        _cleanBtn = [[UIButton alloc]init];
        _cleanBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_cleanBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_cleanBtn setTitle:@"清空" forState:UIControlStateNormal];
        _cleanBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 15.0];
        [_cleanBtn setTitleColor:[self colorWithHexString:@"#6A6A77" alpha:1.0] forState:UIControlStateNormal];
        [_cleanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        WS(ws)
        [_cleanBtn addActionforControlEvents:UIControlEventTouchUpInside Completion:^{
            [ws.view endEditing:YES];
            
            ws.insuranceField.text = @"";
            ws.insuranceDiscountField.text = @"";
            
            ws.businessField.text = @"";
            ws.businessDiscountField.text = @"";
            
            ws.carAndShipField.text = @"";
            ws.carAndShipDiscountField.text = @"";
        }];
    }
    return _cleanBtn;
}

- (UIButton *)calculationbBtn{
    if (!_calculationbBtn) {
        _calculationbBtn = [[UIButton alloc]init];
        _calculationbBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_calculationbBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_calculationbBtn setTitle:@"计算" forState:UIControlStateNormal];
        _calculationbBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 15.0];
        [_calculationbBtn setTitleColor:[self colorWithHexString:@"#20CD84" alpha:1.0] forState:UIControlStateNormal];
        [_calculationbBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        WS(ws)
        [_calculationbBtn addActionforControlEvents:UIControlEventTouchUpInside Completion:^{
            [ws.view endEditing:YES];
            
            if (ws.insuranceField.text.length == 0 && ws.insuranceDiscountField.text.length == 0 && ws.businessField.text.length == 0 && ws.businessDiscountField.text.length == 0 &&
                ws.carAndShipField.text.length == 0 && ws.carAndShipDiscountField.text.length == 0) {
                [MBManager showBriefAlert:@"请输入正确数值"];
                return ;
            }
            
            
            CGFloat insurance = 1.0;
            if (ws.insuranceDiscountField.text.length == 0 || [ws.insuranceDiscountField.text isEqualToString:@"0"]  || [ws.insuranceDiscountField.text isEqualToString:@"0.0"]) {
                insurance = 1.0;
            }else{
                insurance = [ws.insuranceDiscountField.text floatValue];
            }
            NSString *insuranceMoney = [NSString stringWithFormat:@"%f",[ws.insuranceField.text floatValue] * insurance / 1.06];
            NSString *insuranceSaleMoney = [NSString stringWithFormat:@"%.2f",[ws.insuranceField.text floatValue] - [insuranceMoney floatValue]];
            
            
      
            CGFloat business = 1.0;
            if (ws.businessDiscountField.text.length == 0 || [ws.businessDiscountField.text isEqualToString:@"0"]  || [ws.businessDiscountField.text isEqualToString:@"0.0"]) {
                business = 1.0;
            }else{
                business = [ws.businessDiscountField.text floatValue];
            }
            NSString *businessMoney = [NSString stringWithFormat:@"%f",[ws.businessField.text floatValue] * business / 1.06];
            NSString *businessSaleMoney = [NSString stringWithFormat:@"%.2f",[ws.businessField.text floatValue] - [businessMoney floatValue]];
            
            
            
            CGFloat carAndShip = 1.0;
            if (ws.carAndShipDiscountField.text.length == 0 || [ws.carAndShipDiscountField.text isEqualToString:@"0"]  || [ws.carAndShipDiscountField.text isEqualToString:@"0.0"]) {
                carAndShip = 1.0;
            }else{
                carAndShip = [ws.carAndShipDiscountField.text floatValue];
            }
            NSString *carAndShipFieldMoney = [NSString stringWithFormat:@"%f",[ws.carAndShipField.text floatValue] * carAndShip];
            NSString *carAndShipSaleMoney = [NSString stringWithFormat:@"%.2f",[ws.carAndShipField.text floatValue] - [carAndShipFieldMoney floatValue]];
            
            
            
            
            NSString *allMoney = [NSString stringWithFormat:@"%f",[insuranceSaleMoney floatValue] + [businessSaleMoney floatValue] + [carAndShipSaleMoney floatValue]];
            
             NSString *allSaleMoney = [NSString stringWithFormat:@"%f",[insuranceMoney floatValue] + [businessMoney floatValue] + [carAndShipFieldMoney floatValue]];
            
            ws.allMoneyLabel.text = [NSString stringWithFormat:@"应收净费：%.2f元",[allMoney floatValue]];
            
            ws.saleMoneyLabel.text = [NSString stringWithFormat:@"手续费合计：%.2f元",[allSaleMoney floatValue]];

        }];
    }
    return _calculationbBtn;
}


- (void)nameTextFieldEditChanged:(UITextField *)textField{
    NSLog(@"textfield.text %@",textField.text);
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

@end
