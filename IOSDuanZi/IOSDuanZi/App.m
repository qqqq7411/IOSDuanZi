//
//  App.m
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-15.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import "App.h"

@implementation App


+(App*)getInstance{
    static App* __ins = nil;
    
    if (!__ins) {
        __ins = [[App alloc] init];
        
    }
    return __ins;
}

//初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        _alertView = nil;
    }
    return self;
}


-(void)showLoading:(NSString *)msg{
    if (!_alertView) {
        _alertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    }else{
        _alertView.message = msg;
        
    }
    [_alertView show];
}

-(void)hideloading{
    if (_alertView) {
        [_alertView dismissWithClickedButtonIndex:0 animated:YES];
    }
    
    
}
@end
