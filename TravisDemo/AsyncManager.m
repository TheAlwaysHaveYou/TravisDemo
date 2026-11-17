//
//  AsyncManager.m
//  TravisDemo
//
//  Created by 范魁东 on 2020/4/20.
//  Copyright © 2020 FanKD. All rights reserved.
//

#import "AsyncManager.h"

@implementation AsyncManager

+ (instancetype)sharedInstance {
    static AsyncManager *request;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        request = [[AsyncManager alloc] init];
    });
    return request;
}

+ (void)oneDelayTest:(void(^)(void))block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"将要睡眠---");
        sleep(3);
        NSLog(@"结束睡眠---");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    });
}

- (void)oneDelayTest:(void(^)(void))block {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"将要睡眠---");
        sleep(3);
        NSLog(@"结束睡眠---");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            block();
        });
    });
}

- (AsyncManager *(^)(NSString *))myName {
    return ^id(NSString *name) {
        return self;
    };
}

//后台常驻线程
+ (NSThread *)networkReqeustThread {
    static NSThread *_networkRequestThread = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _networkRequestThread = [[NSThread alloc] initWithTarget:self selector:@selector(networkRequestThreadEntryPoint:) object:nil];
        [_networkRequestThread start];
        
    });
    return _networkRequestThread;
}

+ (void)networkRequestThreadEntryPoint:(id __unused)value {
    @autoreleasepool {
        [[NSThread currentThread] setName:@"haha"];
        
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runloop run];
    }
}

@end
