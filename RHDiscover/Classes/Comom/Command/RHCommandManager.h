//
//  RHCommandManager.h
//  planByGodWin
//
//  Created by DaFenQi on 17/4/5.
//  Copyright © 2017年 DFC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RHCommand.h"

@interface RHCommandManager : NSObject

+ (instancetype)defaultManager;

@property (nonatomic ,strong) NSMutableArray *commandQueue;

+ (void)excuteCommand:(id<RHCommand>)cmd
             delegate:(id<DFCCommandDelegate>)delegate;
+ (void)excuteCommand:(id<RHCommand>)cmd
        completeBlock:(kCommandBlock)block;

+ (void)cancelCommand:(id<RHCommand>)cmd;
+ (void)cancelCommandByClass:(Class)cls;
+ (void)cancelCommandByDelegate:(id <DFCCommandDelegate>)delegate;

@end
