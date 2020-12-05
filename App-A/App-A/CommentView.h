//
//  CommentView.h
//  App-A
//
//  Created by 黄嘉群 on 2020/4/3.
//  Copyright © 2020 黄嘉群. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CommentViewDelegate <NSObject>

- (void)closeComment;

@end

@interface CommentView : UIView<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView       *tableView; //表视图对象
@property (nonatomic, weak) id<CommentViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
