//
//  RHCommandManager.m
//  planByGodWin
//
//  Created by DaFenQi on 17/4/5.
//  Copyright © 2017年 DFC. All rights reserved.
//

#import "RHCommandManager.h"

@implementation RHCommandManager

static RHCommandManager *_dafaultManager;

+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dafaultManager = [[RHCommandManager alloc] init];
    });
    
    return _dafaultManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.commandQueue = [NSMutableArray array];
    }
    return self;
}

+ (void)excuteCommand:(id<RHCommand>)cmd
             delegate:(id<DFCCommandDelegate>)delegate {
    if (cmd) {
        [[RHCommandManager defaultManager] excuteCommand:cmd
                                                 observer:delegate];
    }
}

- (void)excuteCommand:(id<RHCommand>)cmd
             observer:(id<DFCCommandDelegate>)observer {
    [self.commandQueue addObject:cmd];
    cmd.delegate = observer;
    [cmd execute];
}

+ (void)excuteCommand:(id<RHCommand>)cmd
        completeBlock:(kCommandBlock)block {
    if (cmd) {
        [[RHCommandManager defaultManager] excuteCommand:cmd
                                                 completeBlock:block];
    }
}

- (void)excuteCommand:(id<RHCommand>)cmd
        completeBlock:(kCommandBlock)block {
    [self.commandQueue addObject:cmd];
    cmd.callBackBlock = block;
    [cmd execute];
}

+ (void)cancelCommand:(id<RHCommand>)cmd {
    if (cmd) {
        [cmd cancel];
        [[RHCommandManager defaultManager].commandQueue removeObject:cmd];
    }
}

+ (void)cancelCommandByClass:(Class)cls {
    NSArray *tempArr = [NSArray arrayWithArray:[RHCommandManager defaultManager].commandQueue];
    
    for (id<RHCommand> cmd in tempArr) {
        if ([cmd isKindOfClass:cls]) {
            [cmd cancel];
            [[RHCommandManager defaultManager].commandQueue removeObject:cmd];
        }
    }
}

+ (void)cancelCommandByDelegate:(id <DFCCommandDelegate>)delegate {
    if (!delegate) {
        return;
    }
    
    NSArray *tempArr = [NSArray arrayWithArray:[RHCommandManager defaultManager].commandQueue];
    
    for (id<RHCommand> cmd in tempArr) {
        if (cmd.delegate == delegate) {
            [cmd cancel];
            [[RHCommandManager defaultManager].commandQueue removeObject:cmd];
        }
    }
}

@end
