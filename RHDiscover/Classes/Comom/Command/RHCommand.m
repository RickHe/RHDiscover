//
//  RHCommand.m
//  planByGodWin
//
//  Created by DaFenQi on 17/4/5.
//  Copyright © 2017年 DFC. All rights reserved.
//

#import "RHCommand.h"
#import "RHCommandManager.h"

@implementation RHCommand 

- (void)execute {
    
}

- (void)cancel {
    self.delegate = nil;
    self.callBackBlock = nil;
}

- (void)done {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(commandDidFinish:)]) {
            [self.delegate commandDidFinish:self];
        }
        
        if (_callBackBlock) {
            _callBackBlock(self);
        }
        
        _callBackBlock = nil;
        
        [[RHCommandManager defaultManager].commandQueue removeObject:self];
    });
}

@end
