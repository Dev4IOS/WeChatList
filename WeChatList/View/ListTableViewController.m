//
//  ListTableViewController.m
//  WeChatList
//
//  Created by zhengna on 15/6/25.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ListTableViewController.h"
#import "WeChatModel.h"
#import "ViewController.h"

@interface ListTableViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ListTableViewController

//lazy load
- (NSArray *)dataArray{
    
    if(!_dataArray){
    
        NSString *path = [[NSBundle mainBundle] pathForResource:@"wechat" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *dict in array) {
            WeChatModel *weChatModel = [WeChatModel weChatWithDict:dict];
            [muArray addObject:weChatModel];
        }
        _dataArray = [muArray copy];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"微信";
    //self.tableView.sectionFooterHeight = 40;
    
    [self clipExtraCellLine:self.tableView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    // Return the number of sections.
//    return self.dataArray.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.dataArray.count;
}

//create cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"wechatCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    WeChatModel *weChatModel = self.dataArray[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:weChatModel.icon];
    cell.textLabel.text = weChatModel.name;
    cell.detailTextLabel.text = weChatModel.message;
 
    return cell;
}

#pragma mark - remove useless lines
- (void)clipExtraCellLine:(UITableView *)tableView{
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ViewController *viewCtrl = [[ViewController alloc] init];
    [self.navigationController pushViewController:viewCtrl animated:NO];
}


@end
