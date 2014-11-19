//
//  DuanziList.m
//  IOSDuanZi
//
//  Created by 谢家勋 on 14-11-9.
//  Copyright (c) 2014年 谢家勋. All rights reserved.
//

#import "DuanziList.h"
#import "Net.h"
#import "UserActionButton.h"
@interface DuanziList ()

@end

@implementation DuanziList

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        dataList = [[NSArray alloc] init];
        
        self.jokeType = JOKE_TEXT;
        self.dataType = JOKE_DATA_RECENT;
        _uid = @"";
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //获取uid
    [Net getUid:^(NSString *uid) {
        NSLog(@"%@",uid);
        
        _uid = uid;
        
        [Net loadList:self.jokeType dataType:self.dataType uid:uid pid:@"0" perPage:@"100" completeHandler:^(NSDictionary *result) {
            
            dataSource = result;
            dataList = [dataSource valueForKey:@"list"];
            
            [self.tableView reloadData];
        }];	
        
    }];
    NSLog(@"Start Get Uid");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [dataList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //get data
    NSDictionary * data = dataList[indexPath.row];
    
    NSString * body = [data valueForKey:@"body"];
    
    NSString * jid = [data valueForKey:@"id"];
    
    NSString * agreeTimes = [data valueForKey:@"agreetimes"];
    
    NSString * disagreeTimes = [data valueForKey:@"disagreetimes"];
    
    NSString * shareTimes = [data valueForKey:@"sharetimes"];
    
    
    // Configure the cell...
    UITextView * bodyTv = (UITextView*)[cell viewWithTag:2];
    //bodyTv.text = [dataList[indexPath.row] valueForKey:@"body"];
    bodyTv.text = body;
    UserActionButton * btnAgree,*btnDisagree,*btnShare;
    btnAgree = (UserActionButton*)[cell viewWithTag:3];
    btnDisagree = (UserActionButton*)[cell viewWithTag:4];
    btnShare = (UserActionButton*)[cell viewWithTag:5];
    
    btnAgree.uid = _uid;
    btnDisagree.uid = _uid;
    btnShare.uid = _uid;
    
    btnAgree.jid = jid;
    btnDisagree.jid = jid;
    btnShare.jid = jid;
    
    btnAgree.userAction = USER_ACTION_AGREE;
    btnDisagree.userAction = USER_ACTION_DISAGREE;
    btnShare.userAction = USER_ACTION_SHARE;
    
    [btnAgree setTitle:[NSString stringWithFormat:@"赞(%@)",agreeTimes] forState:UIControlStateNormal];
    [btnDisagree setTitle:[NSString stringWithFormat:@"踩(%@)",disagreeTimes] forState:UIControlStateNormal];
    [btnShare setTitle:[NSString stringWithFormat:@"分享(%@)",shareTimes] forState:UIControlStateNormal];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
