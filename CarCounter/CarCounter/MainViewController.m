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
#import "DefineFile.h"

@interface MainViewController ()
@property (nonatomic,strong) CustomLeftTextField *insuranceField;
@property (nonatomic,strong) CustomLeftTextField *insuranceDiscountField;
@property (nonatomic,strong) UILabel *insurancePercentageLabel;
@property (nonatomic,strong) UILabel *insuranceDetailLabel;

@property (nonatomic,strong) CustomLeftTextField *businessField;
@property (nonatomic,strong) CustomLeftTextField *businessDiscountField;
@property (nonatomic,strong) UILabel *businessPercentageLabel;
@property (nonatomic,strong) UILabel *businessDetailLabel;

@property (nonatomic,strong) CustomLeftTextField *carAndShipField;
@property (nonatomic,strong) CustomLeftTextField *carAndShipDiscountField;
@property (nonatomic,strong) UILabel *carAndShipDetailLabel;

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
    
    [self.view addSubview:self.insuranceDetailLabel];
    [self.insuranceDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.insuranceDiscountField.mas_bottom).offset(5);
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(50);
    }];
    
    
    ///2
    [self.view addSubview:self.businessField];
    [self.businessField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.insuranceDetailLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(firstWidth/2);
    }];
    
    
    [self.view addSubview:self.businessPercentageLabel];
    [self.businessPercentageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.insuranceDetailLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(40);
    }];
    
    
    [self.view addSubview:self.businessDiscountField];
    [self.businessDiscountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.insuranceDetailLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(50);
        make.left.equalTo(self.insuranceField.mas_right).offset(10);
        make.right.equalTo(self.businessPercentageLabel.mas_left).offset(-10);
    }];
    
    
    [self.view addSubview:self.businessDetailLabel];
    [self.businessDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.businessDiscountField.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(50);
    }];
    
    ///3
    [self.view addSubview:self.carAndShipField];
    [self.carAndShipField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.businessDetailLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(SCREEN_WIDTH/2-5);
    }];
    
    [self.view addSubview:self.carAndShipDiscountField];
    [self.carAndShipDiscountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.businessDetailLabel.mas_bottom).offset(10);
        make.left.equalTo(self.carAndShipField.mas_right).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(SCREEN_WIDTH/2-20);
    }];
    
    [self.view addSubview:self.carAndShipDetailLabel];
    [self.carAndShipDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.carAndShipDiscountField.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(50);
    }];
    
    
    ///4
    [self.view addSubview:self.saleMoneyLabel];
    [self.saleMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.carAndShipDetailLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self.view addSubview:self.allMoneyLabel];
    [self.allMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.saleMoneyLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
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
        _insurancePercentageLabel.text =  @"÷ 1.06";
        _insurancePercentageLabel.font = [UIFont systemFontOfSize:13];
        _insurancePercentageLabel.numberOfLines = 1;
        _insurancePercentageLabel.textAlignment = NSTextAlignmentRight;
        _insurancePercentageLabel.textColor = ZBRGBHexAlpha(0x4A4A4A,1);
    }
    return _insurancePercentageLabel;
}

- (UILabel *)insuranceDetailLabel{
    if (!_insuranceDetailLabel) {
        _insuranceDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 50, 50)];
        _insuranceDetailLabel.text = @"交强优惠：0.0";
        _insuranceDetailLabel.font = [UIFont systemFontOfSize:15];
        _insuranceDetailLabel.numberOfLines = 1;
        _insuranceDetailLabel.textAlignment = NSTextAlignmentRight;
        _insuranceDetailLabel.textColor = ZBRGBHexAlpha(0x9B9B9B,1);
    }
    return _insuranceDetailLabel;
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
        _businessPercentageLabel.textColor = ZBRGBHexAlpha(0x4A4A4A,1);
    }
    return _businessPercentageLabel;
}

- (UILabel *)businessDetailLabel{
    if (!_businessDetailLabel) {
        _businessDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 50, 50)];
        _businessDetailLabel.text = @"商业优惠：0.0";
        _businessDetailLabel.font = [UIFont systemFontOfSize:15];
        _businessDetailLabel.numberOfLines = 1;
        _businessDetailLabel.textAlignment = NSTextAlignmentRight;
        _businessDetailLabel.textColor = ZBRGBHexAlpha(0x9B9B9B,1);
    }
    return _businessDetailLabel;
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

- (UILabel *)carAndShipDetailLabel{
    if (!_carAndShipDetailLabel) {
        _carAndShipDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 50, 50)];
        _carAndShipDetailLabel.text = @"车船优惠：0.0";
        _carAndShipDetailLabel.font = [UIFont systemFontOfSize:15];
        _carAndShipDetailLabel.numberOfLines = 1;
        _carAndShipDetailLabel.textAlignment = NSTextAlignmentRight;
        _carAndShipDetailLabel.textColor = ZBRGBHexAlpha(0x9B9B9B,1);
    }
    return _carAndShipDetailLabel;
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
        _saleMoneyLabel.textColor = ZBRGBHexAlpha(0x0076FE,1);
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
        _allMoneyLabel.textColor = ZBRGBHexAlpha(0x0076FE,1);
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
        [_cleanBtn setTitleColor:ZBRGBHexAlpha(0x6A6A77,1) forState:UIControlStateNormal];
        [_cleanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        WS(ws)
        [_cleanBtn addActionforControlEvents:UIControlEventTouchUpInside Completion:^{
            [ws.view endEditing:YES];
            
            ws.insuranceField.text = @"";
            ws.insuranceDiscountField.text = @"";
            ws.insuranceDetailLabel.text = @"交强优惠：0.0";
            
            ws.businessField.text = @"";
            ws.businessDiscountField.text = @"";
            ws.businessDetailLabel.text = @"商业优惠：0.0";
            
            ws.carAndShipField.text = @"";
            ws.carAndShipDiscountField.text = @"";
            ws.carAndShipDetailLabel.text =  @"车船优惠：0.0";
            
            ws.saleMoneyLabel.text = [NSString stringWithFormat:@"手续费合计：0.0元"];
            ws.allMoneyLabel.text = [NSString stringWithFormat:@"应收净费：0.0元"];
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
        [_calculationbBtn setTitleColor:ZBRGBHexAlpha(0x0076FE,1) forState:UIControlStateNormal];
        [_calculationbBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        WS(ws)
        [_calculationbBtn addActionforControlEvents:UIControlEventTouchUpInside Completion:^{
            [ws.view endEditing:YES];
            
            CGFloat insurance = 1.0;
            NSString *insuranceSaleMoney = @"0.0";
            if (ws.insuranceDiscountField.text.length > 0) {
                insurance = [ws.insuranceDiscountField.text floatValue];
                insuranceSaleMoney = [NSString stringWithFormat:@"%.2f",[ws.insuranceField.text floatValue] * insurance / 1.06];
            }
            NSString *insuranceMoney = [NSString stringWithFormat:@"%.2f",[ws.insuranceField.text floatValue] - [insuranceSaleMoney floatValue]];
            if (ws.insuranceDiscountField.text.length > 0) {
                ws.insuranceDetailLabel.text = [NSString stringWithFormat:@"交强优惠：%.2f x %.2f ÷ 1.06 = %.2f",[ws.insuranceField.text floatValue],insurance,[insuranceSaleMoney floatValue]];
            }else{
                ws.insuranceDetailLabel.text = [NSString stringWithFormat:@"交强优惠：0.0"];
            }
          
            
      
            CGFloat business = 1.0;
            NSString *businessSaleMoney = @"0.0";
            if (ws.businessDiscountField.text.length > 0) {
                business = [ws.businessDiscountField.text floatValue];
                businessSaleMoney = [NSString stringWithFormat:@"%.2f",[ws.businessField.text floatValue] * business / 1.06];
            }
            NSString *businessMoney = [NSString stringWithFormat:@"%.2f",[ws.businessField.text floatValue] - [businessSaleMoney floatValue]];
            if (ws.businessDiscountField.text.length > 0) {
                ws.businessDetailLabel.text = [NSString stringWithFormat:@"商业优惠：%.2f x %.2f ÷ 1.06 = %.2f",[ws.businessField.text floatValue],business,[businessSaleMoney floatValue]];
            }else{
                 ws.businessDetailLabel.text = [NSString stringWithFormat:@"商业优惠：0.0"];
            }
         
            
            
            CGFloat carAndShip = 1.0;
            NSString *carAndShipSaleMoney = @"0.0";
            if (ws.carAndShipDiscountField.text.length > 0) {
                carAndShip = [ws.carAndShipDiscountField.text floatValue];
                carAndShipSaleMoney = [NSString stringWithFormat:@"%f",[ws.carAndShipField.text floatValue] * carAndShip];
            }
            NSString *carAndShipMoney = [NSString stringWithFormat:@"%.2f",[ws.carAndShipField.text floatValue] - [carAndShipSaleMoney floatValue]];
            if (ws.carAndShipDiscountField.text.length > 0) {
                ws.carAndShipDetailLabel.text =  [NSString stringWithFormat:@"车船优惠：%.2f x %.2f = %.2f",[ws.carAndShipField.text floatValue],carAndShip,[carAndShipSaleMoney floatValue]];
            }else{
                ws.carAndShipDetailLabel.text =  [NSString stringWithFormat:@"车船优惠：0.0"];
            }
           
            
            
            NSString *saleMoney = [NSString stringWithFormat:@"%f",[insuranceSaleMoney floatValue] + [businessSaleMoney floatValue] + [carAndShipSaleMoney floatValue]];
            ws.saleMoneyLabel.text = [NSString stringWithFormat:@"手续费合计：%.2f元",[saleMoney floatValue]];
            
            NSString *allMoney = [NSString stringWithFormat:@"%f",[insuranceMoney floatValue] + [businessMoney floatValue] + [carAndShipMoney floatValue]];
            ws.allMoneyLabel.text = [NSString stringWithFormat:@"应收净费：%.2f元",[allMoney floatValue]];
            
            

        }];
    }
    return _calculationbBtn;
}


- (void)nameTextFieldEditChanged:(UITextField *)textField{
    NSLog(@"textfield.text %@",textField.text);
}
@end
