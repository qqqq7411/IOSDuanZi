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
    //使用uialertview呈现加载界面
    UIAlertView * _alertView;
}
//提示加载界面
-(void)showLoading:(NSString*)msg;
//隐藏加载界面
-(void)hideloading;


+(App*)getInstance;

@end
