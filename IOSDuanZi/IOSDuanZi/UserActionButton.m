//
//  UserActionButton.m
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-16.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import "UserActionButton.h"

@implementation UserActionButton
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.jid = @"";
        self.uid = @"";
        self.userAction = USER_ACTION_AGREE;
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    [Net userAction:self.uid action:self.userAction jid:self.jid completrHandler:^(BOOL isok) {
        if (!isok) {
            [[[UIAlertView alloc] initWithTitle:@"提醒" message:@"通信失败，请稍后重试" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil] show];
        }
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
