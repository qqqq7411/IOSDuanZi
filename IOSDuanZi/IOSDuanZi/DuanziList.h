//
//  DuanziList.h
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-9.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import <UIKit/UIKit.h>



//定义段子的类型
typedef enum : NSUInteger {
    JOKE_TEXT,
    JOKE_IMAGE_OR_VIDEO,
    
} JOKE_TYPE;


//定义数据的类型
typedef enum : NSUInteger {
    JOKE_DATA_RECENT,
    JOKE_DATA_RANDOM,
} JOKE_DATA_TYPE;


@interface DuanziList : UITableViewController{
    NSDictionary * dataSource;
    NSArray * dataList;
    
    NSString * _uid;
}

//设置2个属性
@property JOKE_DATA_TYPE dataType;
@property JOKE_TYPE jokeType;

@end
