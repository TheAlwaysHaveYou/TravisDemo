//
//  TwoController.m
//  TravisDemo
//
//  Created by 范魁东 on 2020/4/20.
//  Copyright © 2020 FanKD. All rights reserved.
//

#import "TwoController.h"
#import "AsyncManager.h"

@interface TwoController ()

@property (nonatomic , strong) NSMutableArray *tempArr;

@property (nonatomic , copy) void(^block)(void);

@property (nonatomic , strong) NSTimer *timer;


@end

@implementation TwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tempArr = [[NSMutableArray alloc] initWithCapacity:0];
    
    __weak typeof (self) weakSelf = self;
//    [[AsyncManager sharedInstance] oneDelayTest:^{
//        NSLog(@"不加strong情况");
////        self.title = @"hahahaha";
////        [weakSelf.tempArr addObject:@(1)];
//
////        NSLog(@"加strong的情况");
//        __strong typeof (weakSelf) strongSelf = weakSelf;
//        strongSelf.title = @"bbbbbbbb";
//        NSLog(@"地址---%@--",strongSelf);
//    }];
    
//    self.block = ^{
//        NSLog(@"block开始--%@",weakSelf);
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"定时器结束--%@",weakSelf);
//            [weakSelf.tempArr addObject:@2];
//        });
//    };
//    self.block();
    
    
    AsyncManager *manager = [AsyncManager sharedInstance];
    manager.myName(@"").myName(@"");
    [[manager myName] myName];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf timerRun];
//        NSLog(@"哈哈哈");
//    }];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    
//    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
    [self.timer fire];
    
    
}
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self;
}
- (void)timerRun {
    static NSInteger i = 0;
    NSLog(@"%ld",i ++);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)dealloc {
    NSLog(@"---release----[%@]--",NSStringFromClass([self class]));
    
}

@end
