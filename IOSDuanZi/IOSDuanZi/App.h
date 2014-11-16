//
//  App.h
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-15.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <UIKit/UIKit.h>
@interface App : NSObject{
    UIAlertView * _alertView;
}

-(void)showLoading:(NSString*)msg;
-(void)hideloading;


+(App*)getInstance;

@end
