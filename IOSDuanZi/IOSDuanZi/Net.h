//
//  Net.h
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-9.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DuanziList.h"

#define API_KEY @"0FQ2D96JH7ZQXCBT7HZTZ2"
#define API_SECRET @"bb7aec125b1929997169f0v1axfaad00"
#define REG_URL @"http://duanzi.joyme.com/register.do"
#define GET_LIST_URL @"http://duanzi.joyme.com/article/list.do"
#define USER_ACTION_URL @"http://duanzi.joyme.com/action.do"

typedef enum : NSUInteger {
    USER_ACTION_AGREE,
    USER_ACTION_DISAGREE,
    USER_ACTION_SHARE,
} USER_ACTION;



@interface Net : NSObject

+(void)loadData:(NSString*)url args:(NSDictionary*)dict completeHandler:(void(^)(NSData * data))handler;


+(void)regWithIDFA:(NSString*)idfa completeHandler:(void(^)(NSDictionary * result))handler;

+(void)getUid:(void(^)(NSString * Uid))callback;

+(void)loadList:(JOKE_TYPE)jt dataType:(JOKE_DATA_TYPE)dt uid:(NSString*)uid pid:(NSString*)pid perPage:(NSString*)perPage completeHandler:(void(^)(NSDictionary* result))handler;

+(void)userAction:(NSString*)uid action:(USER_ACTION)action jid:(NSString*)jid completrHandler:(void(^)(BOOL isok))handler;

@end
