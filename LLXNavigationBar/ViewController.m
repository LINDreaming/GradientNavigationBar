//
//  ViewController.m
//  LLXNavigationBar
//
//  Created by 林喜 on 4/14/17.
//  Copyright © 2017 林喜. All rights reserved.
//

#import "ViewController.h"
#import "MXNavigationBarManager.h"

static NSString *const KCellId = @"cellId";
static const CGFloat headerImageHeight = 260.f;
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;/**<1*/
@property(nonatomic,strong)NSMutableArray *dataSource;/**<##>1*/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self initBarManager];
    [self initBaseData];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




#pragma mark - UITableViewDelegate,UItableViewDataSource -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCellId];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - UIScrolview Delegate -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [MXNavigationBarManager changeAlphaWithCurrentOffset:scrollView.contentOffset.y-64];
}

#pragma mark - private Methods 
- (void)initBarManager {
    [MXNavigationBarManager managerWithController:self];
    [MXNavigationBarManager setBarColor:[UIColor colorWithRed:0.5 green:0.5 blue:1 alpha:1]];
    [MXNavigationBarManager setTintColor:[UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1]];
    [MXNavigationBarManager setStatusBarStyle:UIStatusBarStyleDefault];
    [MXNavigationBarManager setZeroAlphaOffset:-64];
    [MXNavigationBarManager setFullAlphaOffset:200];
    [MXNavigationBarManager setFullAlphaTintColor:[UIColor whiteColor]];
    [MXNavigationBarManager setFullAlphaBarStyle:UIStatusBarStyleLightContent];
}

- (void)initBaseData {
    self.title = @"标题";
    self.tableView.showsVerticalScrollIndicator = YES;
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, headerImageHeight)];
    headerImageView.image = [UIImage imageNamed:@"headerImage"];
    self.tableView.tableHeaderView = headerImageView;
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"right_arrow"]  style:UIBarButtonItemStylePlain target:self action:@selector(pushToBackView)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)pushToBackView {
    
}



#pragma mark - seter geterr Methods
- (UITableView *)tableView{
    if (!_tableView) {
        CGRect rect = self.view.frame;
        _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:KCellId];
        UIView *aview = [[UIView alloc]init];
        _tableView.tableFooterView = aview;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        
        
    }
    return _tableView;
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        NSArray *array = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
        [_dataSource addObjectsFromArray:array];
        
    }
    return _dataSource;
}


@end
