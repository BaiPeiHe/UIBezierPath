//
//  RootViewController.m
//  bezierpath
//
//  Created by 白鹤 on 16/9/13.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "RootViewController.h"
#import "Case01ViewController.h"


@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation RootViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self createData];
    
    [self createView];
}

- (void)createData{
    
    self.dataArr = [NSMutableArray arrayWithObjects:
                    /* 01 */   @"Case01   初识 BezierPath",
                    /* 02 */   @"Case02   ",
                    /* 03 */   @"Case03   ",
                    /* 04 */   @"Case04   ",
                    /* 05 */   @"Case05   ",
                    /* 06 */   @"Case06   ",
                    /* 07 */   @"Case07   ",
                    nil];
}


- (void)createView{
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
}


#pragma mark UITableView 协议方法


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    switch (indexPath.row + 1) {
        case 1:{
            
            Case01ViewController *case1VC = [[Case01ViewController alloc] init];
            
            [self.navigationController pushViewController:case1VC animated:YES];
            
            break;
        }
        
        default:
            break;
    }
    
}




@end
