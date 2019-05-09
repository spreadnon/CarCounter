//
//  IKCustomLeftTextField.h
//  IKToolsModule
//
//  Created by iOS123 on 2019/1/30.
//  Copyright © 2019 HU. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^RightBtnBlock)(void);
@interface IKCustomLeftTextField : UITextField
@property (nonatomic,strong) NSString *title;
@property (nonatomic,assign) BOOL rightBtn;
@property (nonatomic,copy) RightBtnBlock block;
@end

NS_ASSUME_NONNULL_END
