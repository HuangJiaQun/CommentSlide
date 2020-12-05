//
//  ViewController.m
//  App-A
//
//  Created by 黄嘉群 on 2020/4/3.
//  Copyright © 2020 黄嘉群. All rights reserved.
//

#import "ViewController.h"
#import "SQPanHandView.h"
#import "CommentView.h"


@interface ViewController ()<CommentViewDelegate>
@property (nonatomic, strong) SQPanHandView *popView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn setTitle:@"打开评论" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(open) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)open {
    CommentView *chView = [[CommentView alloc]init];
    chView.delegate = self;
    self.popView = [SQPanHandView DromPopViewWithFrame:[UIScreen mainScreen].bounds commentBackView:chView];
    [self.popView showToView:self.view];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}

#pragma mark - MyCommentViewDelegate
- (void)closeComment {
    [self.popView dismiss];
}

@end
