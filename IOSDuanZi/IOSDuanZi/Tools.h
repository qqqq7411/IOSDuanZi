//
//  Tools.h
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-9.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

//创建md5方法
+(NSString*)md5:(NSString*)str;

//创建idfa方法
+(NSString*)getIDFA;


@end
