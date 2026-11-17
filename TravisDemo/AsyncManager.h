//
//  AsyncManager.h
//  TravisDemo
//
//  Created by 范魁东 on 2020/4/20.
//  Copyright © 2020 FanKD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AsyncManager : NSObject

+ (instancetype)sharedInstance;


+ (void)oneDelayTest:(void(^)(void))block;

- (void)oneDelayTest:(void(^)(void))block;

- (AsyncManager *(^)(NSString *))myName;

@end

NS_ASSUME_NONNULL_END
