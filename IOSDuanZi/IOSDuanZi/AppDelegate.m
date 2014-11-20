//
//  AppDelegate.m
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-8.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import "AppDelegate.h"
#import "App.h"
#import <ShareSDK/ShareSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
        [ShareSDK registerApp:@"450b4728828f"];     //参数为ShareSDK官网中添加应用后得到的AppKey
        //添加新浪微博应用 注册网址 http://open.weibo.com
        [ShareSDK connectSinaWeiboWithAppKey:@"568898243"
                                   appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                 redirectUri:@"http://www.sharesdk.cn"];
        //当使用新浪微博客户端分享的时候需要按照下面的方法来初始化新浪的平台
                //添加网易微博应用 注册网址  http://open.t.163.com
        [ShareSDK connect163WeiboWithAppKey:@"T5EI7BXe13vfyDuy"
                                  appSecret:@"gZxwyNOvjFYpxwwlnuizHRRtBRZ2lV1j"
                                redirectUri:@"http://www.shareSDK.cn"];
        
        //添加搜狐微博应用  注册网址  http://open.t.sohu.com
        [ShareSDK connectSohuWeiboWithConsumerKey:@"SAfmTG1blxZY3HztESWx"
                                   consumerSecret:@"yfTZf)!rVwh*3dqQuVJVsUL37!F)!yS9S!Orcsij"
                                      redirectUri:@"http://www.sharesdk.cn"];
        
        //添加豆瓣应用  注册网址 http://developers.douban.com
        [ShareSDK connectDoubanWithAppKey:@"07d08fbfc1210e931771af3f43632bb9"
                                appSecret:@"e32896161e72be91"
                              redirectUri:@"http://dev.kumoway.com/braininference/infos.php"];
        
        
        
        //添加开心网应用  注册网址 http://open.kaixin001.com
        [ShareSDK connectKaiXinWithAppKey:@"358443394194887cee81ff5890870c7c"
                                appSecret:@"da32179d859c016169f66d90b6db2a23"
                              redirectUri:@"http://www.sharesdk.cn/"];
        
        //添加Instapaper应用   注册网址  http://www.instapaper.com/main/request_oauth_consumer_token
        [ShareSDK connectInstapaperWithAppKey:@"4rDJORmcOcSAZL1YpqGHRI605xUvrLbOhkJ07yO0wWrYrc61FA"
                                    appSecret:@"GNr1GespOQbrm8nvd7rlUsyRQsIo3boIbMguAl9gfpdL0aKZWe"];
        
        //添加有道云笔记应用  注册网址 http://note.youdao.com/open/developguide.html#app
        [ShareSDK connectYouDaoNoteWithConsumerKey:@"dcde25dca105bcc36884ed4534dab940"
                                    consumerSecret:@"d98217b4020e7f1874263795f44838fe"
                                       redirectUri:@"http://www.sharesdk.cn/"];
        
        //添加Facebook应用  注册网址 https://developers.facebook.com
        [ShareSDK connectFacebookWithAppKey:@"107704292745179"
                                  appSecret:@"38053202e1a5fe26c80c753071f0b573"];
        
        //添加Twitter应用  注册网址  https://dev.twitter.com
        [ShareSDK connectTwitterWithConsumerKey:@"mnTGqtXk0TYMXYTN7qUxg"
                                 consumerSecret:@"ROkFqr8c3m1HXqS3rm3TJ0WkAJuwBOSaWhPbZ9Ojuc"
                                    redirectUri:@"http://www.sharesdk.cn"];
        
        //添加搜狐随身看应用 注册网址  https://open.sohu.com
        [ShareSDK connectSohuKanWithAppKey:@"e16680a815134504b746c86e08a19db0"
                                 appSecret:@"b8eec53707c3976efc91614dd16ef81c"
                               redirectUri:@"http://sharesdk.cn"];
        
        //添加Pocket应用  注册网址  http://getpocket.com/developer/
        [ShareSDK connectPocketWithConsumerKey:@"11496-de7c8c5eb25b2c9fcdc2b627"
                                   redirectUri:@"pocketapp1234"];
        
        //添加印象笔记应用   注册网址  http://dev.yinxiang.com
        [ShareSDK connectEvernoteWithType:SSEverNoteTypeSandbox
                              consumerKey:@"sharesdk-7807"
                           consumerSecret:@"d05bf86993836004"];
        
        //添加LinkedIn应用  注册网址 https://www.linkedin.com/secure/developer
        [ShareSDK connectLinkedInWithApiKey:@"ejo5ibkye3vo"
                                  secretKey:@"cC7B2jpxITqPLZ5M"
                                redirectUri:@"http://sharesdk.cn"];
        
        //……
    


    [[App getInstance] showLoading:@"Loading"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.jikexueyuan.IOSDuanZi" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"IOSDuanZi" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"IOSDuanZi.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
@end
