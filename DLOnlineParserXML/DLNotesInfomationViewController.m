
//
//  DLNotesInfomationViewController.m
//  DLOnlineParserXML
//
//  Created by Char on 2016/12/15.
//  Copyright © 2016年 zhangqi. All rights reserved.
//

#import "DLNotesInfomationViewController.h"
#import "DLNoteUnfoldInfoTableViewCell.h"
#import "DLNoteInfomation.h"
#import "DLNoteUnfoldInfoTableViewCell.h"

#import "DLOnlineParserNotesXMLManager.h"

@interface DLNotesInfomationViewController ()<UITableViewDelegate,UITableViewDataSource,UnfoldDelegate>

@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)UITableView * tableView;

@end

@implementation DLNotesInfomationViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.tableView];
    [self initLoadData];
}

- (void)initLoadData{

    [DLOnlineParserNotesXMLManager onlineParserNotesXML:@"http://192.168.0.126:8080/18701617157/2/%E8%97%8F%E5%9C%B0%E5%AF%86%E7%A0%812%E8%AF%BB%E4%B9%A6%E7%AC%94%E8%AE%B0.xml" Completion:^(NSArray * _Nonnull responseObjects) {
        NSLog(@"responseObjects.count = %ld",(long)responseObjects.count);

        [responseObjects enumerateObjectsUsingBlock:^(DLNoteInfomation *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

            obj.isUnflod = NO;
            DLNoteUnfoldInfomation *frameModel = [[DLNoteUnfoldInfomation alloc] init];
            frameModel.model = obj;
            [self.dataArray addObject:frameModel];
        }];

        [self.tableView reloadData];

    }];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"DLNoteUnfoldInfoTableViewCell";
    DLNoteUnfoldInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[DLNoteUnfoldInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    DLNoteUnfoldInfomation *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.frameModel = model;
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DLNoteUnfoldInfomation *frameModel = [self.dataArray objectAtIndex:indexPath.row];
    return frameModel.cellH;
}

- (void)UnfoldCellDidClickUnfoldBtn:(DLNoteUnfoldInfomation *)model{
    NSInteger index = [self.dataArray indexOfObject:model];
    DLNoteInfomation *model1 = model.model;
    model1.isUnflod = !model1.isUnflod;
    model.model = model1;

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.allowsSelection = NO;

        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
