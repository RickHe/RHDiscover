//
//  RHCommand.h
//  planByGodWin
//
//  Created by DaFenQi on 17/4/5.
//  Copyright © 2017年 DFC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DFCCommandDelegate;
@protocol RHCommand;

typedef void (^kCommandBlock)(id<RHCommand> cmd);

@protocol RHCommand <NSObject>

@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, weak) id<DFCCommandDelegate> delegate;
@property (nonatomic, copy)   kCommandBlock callBackBlock;

- (void)execute; //TODO doesn't need super
- (void)cancel;  //TODO need super;
- (void)done;

@optional
- (void)useLANForClass;
- (void)useWIFIForClass;

@end

@protocol DFCCommandDelegate <NSObject>

@optional
- (void)commandDidFinish:(id<RHCommand>)cmd;
- (void)commandDidFailed:(id<RHCommand>)cmd;
@end

@interface RHCommand : NSObject <RHCommand>

@property (nonatomic, strong) NSDictionary *userInfo;
@property (nonatomic, weak) id<DFCCommandDelegate> delegate;
@property (nonatomic, copy)   kCommandBlock callBackBlock;

- (void)execute; //TODO doesn't need super
- (void)cancel;  //TODO need super;
- (void)done;

@end
