//
//  SQPanHandView.h
//  App-A
//
//  Created by 黄嘉群 on 2020/4/3.
//  Copyright © 2020 黄嘉群. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQPanHandView : UIView

+ (instancetype)DromPopViewWithFrame:(CGRect)frame commentBackView:(UIView *)commentBackView;

- (void)showToView:(UIView *)view;
- (void)dismiss;



@end

NS_ASSUME_NONNULL_END
