//
//  Net.m
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-9.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import "Net.h"
#import <UIKit/UIKit.h>
#import "Tools.h"
#import "App.h"

@implementation Net

+(void)loadData:(NSString *)url args:(NSDictionary *)dict completeHandler:(void (^)(NSData *))handler{
    
    NSMutableURLRequest * req = [[NSMutableURLRequest alloc]initWithURL:[[NSURL alloc] initWithString:url]];
    req.HTTPMethod = @"POST";
    
    
    NSMutableString * body = [[NSMutableString alloc] init];

    for (NSString * key in [dict keyEnumerator]) {
        [body appendFormat:@"%@=%@&",key,[dict valueForKey:key]];
    }
    
    [body appendFormat:@"api_key=%@&",API_KEY ];
    [body appendFormat:@"api_secret=%@&",API_SECRET];
    
    int nonce = rand();
    long timestamp = time(nil);
    
    [body appendFormat:@"nonce=%d&",nonce];
    [body appendFormat:@"timestamp=%ld&",timestamp];
    
    
    NSString *api_sig = [Tools md5:[NSString stringWithFormat:@"%d%ld%@%@",nonce,timestamp,API_KEY,API_SECRET]];
    
    [body appendFormat:@"api_sig=%@",api_sig];
    req.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    
    NSLog(@">>>>>>>>>>>>>>>>>>Upload body:\n%@",body);
    
    
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        [[App getInstance] hideloading];
        
        
        if (data) {
            
            NSString * dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@">>>>>>>>>>>>>>>>>>Result:\n%@",dataStr);
            
            handler(data);
            
        }else{
            [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"加载数据失败，请稍后重试" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        }
    }];
}

+(void)regWithIDFA:(NSString*)idfa completeHandler:(void(^)(NSDictionary * result))handler{
    [Net loadData:REG_URL args:[[NSDictionary alloc] initWithObjectsAndKeys:idfa,@"idfa", nil]completeHandler:^(NSData *data) {
        
        NSError * error;
        
        NSDictionary * result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!error) {
            handler(result);
        }else{
            [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"服务器端返回的json数据无效" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        }
        
    }];
}


+(void)getUid:(void (^)(NSString *))callback{
    
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    
    NSString * uid = [ud valueForKey:@"uid"];
    
    if (uid) {
        callback(uid);
        
        
        NSLog(@"Use cached uid");
        
    }else{
        
        [[App getInstance] showLoading:@"Loading"];
    
        [Net regWithIDFA:[Tools getIDFA] completeHandler:^(NSDictionary *result) {
            

        
            if ([[result valueForKey:@"rs"] isEqualToString:@"1"]) {
            
                NSString * uid = [result valueForKey:@"uid"];
            
            [ud setValue:uid forKey:@"uid"];
            
            callback(uid);
            
            
            NSLog(@"Use net uid");
            
        }else{
            [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"获取uid失败" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        }
    }];
    }
}


+(void)loadList:(JOKE_TYPE)jt dataType:(JOKE_DATA_TYPE)dt uid:(NSString *)uid pid:(NSString *)pid perPage:(NSString *)perPage completeHandler:(void(^)(NSDictionary* result))handler;{
    
    NSString * jType = nil;
    switch (jt) {
        case JOKE_TEXT:
            jType = @"_1";
            break;
        case JOKE_IMAGE_OR_VIDEO:
            jType = @"_2";
            break;
            
            
        default:
            break;
    }
    
    NSString * dType = nil;
    switch (dt) {
        case JOKE_DATA_RECENT:
            dType = @"_1";
            break;
        case JOKE_DATA_RANDOM:
            dType = @"_2";
            break;
            
        default:
            break;
    }
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setValue:jType forKey:@"at"];
    [dict setValue:dType forKey:@"dt"];
    [dict setValue:uid forKey:@"uid"];
    [dict setValue:pid forKey:@"aid"];
    [dict setValue:perPage forKey:@"pagesize"];
    
    [[App getInstance] showLoading:@"正在加载段子列表"];
    
    [Net loadData:GET_LIST_URL args:dict completeHandler:^(NSData *data) {
        
        NSError * error;
        
        NSDictionary * result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error) {
            [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"服务器返回数据无效" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil] show];
        }else{
            if ([[result valueForKey:@"rs"] isEqualToString:@"1"]) {
                
                
                handler(result);
                
            }else{
                [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"加载数据失败，请稍后重试" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil] show];
            }
        }
    }];
}

+(void)userAction:(NSString *)uid action:(USER_ACTION)action jid:(NSString *)jid completrHandler:(void (^)(BOOL))handler{
    
    
    NSString * uploadAction = @"1";
    
    switch (action) {
        case USER_ACTION_AGREE:
            uploadAction = @"1";
            break;
        case USER_ACTION_DISAGREE:
            uploadAction = @"2";
            break;
        case USER_ACTION_SHARE:
            uploadAction = @"3";
            break;
        default:
            break;
    }
    
    
    [[App getInstance] showLoading:@"正在通信，请稍后"];
    
    [Net loadData:USER_ACTION_URL args:[[NSDictionary alloc] initWithObjectsAndKeys:@"uid",uploadAction,@"action",jid,@"aid", nil] completeHandler:^(NSData *data) {
        
        
        NSError * err;
        
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err	) {
            [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"服务器返回数据无效" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil] show];
        }else{
            BOOL result = [[dict valueForKey:@"rs"] isEqualToString:@"1"];
            
            handler(result);
        }
        
    }];
    
}



@end
