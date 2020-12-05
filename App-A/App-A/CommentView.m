//
//  CommentView.m
//  App-A
//
//  Created by 黄嘉群 on 2020/4/3.
//  Copyright © 2020 黄嘉群. All rights reserved.
//

#import "CommentView.h"
#import "Masonry/Masonry.h"
//定义颜色宏
#define colorwithrgb(x, y, z, alp) [UIColor colorWithRed:(x)/255.0 green:(y)/255.0 blue:(z)/255.0 alpha:(alp)]

@implementation CommentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initSubviews];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

/**
 功能:初始化子视图
 参数:无
 返回值:无
 */
- (void)initSubviews
{
    UIButton *closeBtn = [[UIButton alloc] init];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.with.offset(0);
        make.size.mas_equalTo(CGSizeMake(50, 40));
    }];
    [closeBtn setBackgroundColor:[UIColor redColor]];
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeComment) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.with.offset(0);
        make.top.with.offset(40);
    }];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self addSubview:self.tableView];
}

- (void)closeComment {
    if([self.delegate respondsToSelector:@selector(closeComment)]) {
        [self.delegate closeComment];
    }
}



#pragma mark - UITableViewDataSource && UITableVideDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


//设置表格视图每一行显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //说明：UITableViewCell表示表视图单元格，UITableView里的每一行都是UITableViewCell
    static NSString *cellIdentifier = @"myCell";//定义一个可重用标识
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];//从重用队列里获取可重用的cell
    if (!cell)
    {
        //如果不存在，创建一个可重用表视图单元格cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifier];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;//设置cell文本样式
        cell.textLabel.textColor = [UIColor blackColor];//设置cell文本颜色
    }
    cell.textLabel.text =@"这是一个评论";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

@end
