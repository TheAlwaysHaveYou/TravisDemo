//
//  ViewController.m
//  TravisDemo
//
//  Created by 范魁东 on 2019/11/26.
//  Copyright © 2019 FanKD. All rights reserved.
//

#import "ViewController.h"
#import "MyHeaderView.h"
#import <objc/runtime.h>
#import "TwoController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    NSLog(@"------------------------------------");
//    NSNumber *number = @1;
//    NSNumber *thisPtrWillGoToNil = number;
//    @synchronized (thisPtrWillGoToNil) {
//        thisPtrWillGoToNil = nil;
//    }
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSCAssert(![NSThread isMainThread], @"必须是后台线程");
//
//        @synchronized (number) {
//            NSLog(@"This line does indeed get printed to stdout");
//        }
//    });
//
//    dispatch_queue_t queue = dispatch_queue_create("com.bestswifter.queue", nil);
//    dispatch_sync(queue, ^{
//        NSLog(@"current thread = %@", [NSThread currentThread]);
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"current thread = %@", [NSThread currentThread]);
//        });
//    });
//
//    dispatch_barrier_async_and_wait(queue, ^{
//
//    });
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(pushNewController:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSDictionary *dic = @{};
    
    UITableView *str = [NSNull null];
    [str reloadData];
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    NSOperation *op1 = [[NSOperation alloc] init];
//    op1.completionBlock = ^{
//        NSLog(@"op1----%@--",[NSThread currentThread]);
//    };
//    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"op2----%@--",[NSThread currentThread]);
//    }];
//    [queue addOperation:op1];
//    [queue addOperation:op2];
    
//    NSThread *oneThread = [[NSThread alloc] initWithBlock:^{
//
//    }];
//    [oneThread setStackSize:1024];
}




- (void)pushNewController:(UIButton *)sender {
    TwoController *vc = [[TwoController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
