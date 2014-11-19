//
//  Tools.m
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-9.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import "Tools.h"
#import <CommonCrypto/CommonCrypto.h>
#import <AdSupport/AdSupport.h>


@implementation Tools

//实现md5方法
+(NSString*)md5:(NSString *)str{
    
    //获取到c语言的字符串
    const char * cstr = [str UTF8String];
    
    unsigned char dist[CC_MD5_DIGEST_LENGTH];
    
    //强制转移类型为（cc_long）变量，长度，目标
    CC_MD5(cstr, (CC_LONG)strlen(cstr), dist);
    //换算成16进制
    NSMutableString * result = [[NSMutableString alloc] init];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x",dist[i]];
         
    }
         return result;
}

//实现idfa方法
+(NSString*)getIDFA{
    return [[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString;
}

@end
