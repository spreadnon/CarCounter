//
//  CustomLeftTextField.m
//  IKToolsModule
//
//  Created by jeremy on 2019/5/9.
//  Copyright © 2019 jeremy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^RightBtnBlock)(void);
@interface CustomLeftTextField : UITextField
@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) BOOL rightBtn;
@property (nonatomic,copy) RightBtnBlock block;
@end

NS_ASSUME_NONNULL_END
