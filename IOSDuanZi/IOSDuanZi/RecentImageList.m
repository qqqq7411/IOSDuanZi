//
//  RecentImageList.m
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-9.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import "RecentImageList.h"

@interface RecentImageList ()

@end

@implementation RecentImageList

//重写1个方法
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.dataType = JOKE_DATA_RECENT;
        self.jokeType = JOKE_IMAGE_OR_VIDEO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading theview.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"随机段子>" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClicked)];}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rightBarButtonClicked{
    DuanziList * dl = [self.storyboard instantiateViewControllerWithIdentifier:@"DuanziList"];
    
    dl.jokeType = JOKE_IMAGE_OR_VIDEO;
    dl.dataType = JOKE_DATA_RANDOM;
    dl.title = @"随机段子";
    
    [self.navigationController pushViewController:dl animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
