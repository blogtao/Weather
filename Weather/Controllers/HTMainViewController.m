//
//  HTMainViewController.m
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTMainViewController.h"
#import "HTComModel.h"
#import "HTRequestManager.h"
#import "HTCustomView.h"
#import "HTHourForcastCell.h"

#define SUM 1 //城市数量
#define HourTag 20
#define hourForcastID @"HourForcastID"
@interface HTMainViewController ()<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIScrollView * upScrollVw;
@property (nonatomic, strong) UICollectionView * hourCollVw;
@property (nonatomic, strong) HTComModel * models;
@property (nonatomic, strong) UICollectionViewFlowLayout * flowLayout;
@property (nonatomic, strong) UITableView * btmTableVw; //下半部分视图
@property (nonatomic, strong) NSArray * dataArr;//存储数据一个元素是数据，另一个元素也是数组（suggestion）

@end

@implementation HTMainViewController

#pragma mark--以懒加载的形式初始化ScrollView
- (UIScrollView *)upScrollVw{
    if (_upScrollVw == nil) {
        _upScrollVw = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KViewWidth, KViewHeight * .6 - 155)];
        _upScrollVw.delegate = self;
        //设置内容大小
        _upScrollVw.contentSize = CGSizeMake(KViewWidth * SUM, KViewHeight * .6 - 155 );
        //分页
        _upScrollVw.pagingEnabled = YES;
        //关闭弹性效果
        _upScrollVw.bounces = NO;
        
        _upScrollVw.backgroundColor = [UIColor colorWithRed:0.93 green:0.90 blue:0.87 alpha:1.00];
    }
    return _upScrollVw;
}
- (UICollectionViewFlowLayout *)flowLayout{
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(100, 150);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _flowLayout.minimumLineSpacing = 5;

    }
    return _flowLayout;
}
- (UICollectionView *)hourCollVw{
    if (_hourCollVw == nil) {
        _hourCollVw = [[UICollectionView alloc] initWithFrame:CGRectMake(0, KViewHeight * 0.6 - 155, KViewWidth, 155) collectionViewLayout:self.flowLayout];
        _hourCollVw.delegate =  self;
        _hourCollVw.dataSource = self;
        _hourCollVw.backgroundColor = [UIColor colorWithRed:0.82 green:0.73 blue:0.66 alpha:1.00];
        [_hourCollVw registerClass:[HTHourForcastCell class] forCellWithReuseIdentifier:hourForcastID];
    }
    return _hourCollVw;
}
#pragma mark--为ScrollView添加子视图
- (void)addSubView{

    for (int i = 0; i < SUM - 1; i++) {
        UIView * subView = [[UIView alloc] initWithFrame:CGRectMake(i * KViewWidth, 0, KViewWidth, KViewHeight * 0.6)];
        subView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:.5];
        [self.upScrollVw addSubview:subView];
    }
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(KViewWidth / 2 -50, 20, 100 , 100)];
    [imgView sd_setImageWithURL:[NSURL URLWithString:@"http://files.heweather.com/cond_icon/100.png"]];

//    UILabel * tmpLbl = [UILabel alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    [self.upScrollVw addSubview:imgView];
    
    
}

#pragma mark--初始化TableView
- (UITableView *)btmTableVw{
    if (_btmTableVw == nil) {
        _btmTableVw = [[UITableView alloc] initWithFrame:CGRectMake(0, KViewHeight * .6, KViewWidth, KViewHeight * .4) style:UITableViewStylePlain];
        _btmTableVw.delegate = self;
        _btmTableVw.dataSource = self;
    }
    return _btmTableVw;
}

- (NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [[NSArray alloc] init];
    }
    return _dataArr;
}

- (HTComModel *)models{
    if (_models == nil) {
        _models = [[HTComModel alloc] init];
    }
    return _models;
}
#pragma mark--视图加载过程
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //添加scrollView
    [self.view addSubview:self.upScrollVw];
    
    [self.view addSubview:self.hourCollVw];
    
    //往ScrollView上添加视图
    [self addSubView];
    [self.view addSubview:self.btmTableVw];
    //请求数据
    [self downLoadData];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.90 blue:0.87 alpha:1.00];
    //小时播报
    [self hourForecast];
    

}
#pragma mark--下载数据
- (void)downLoadData{
    NSDictionary * dicts = @{@"cityid":@"CN101030400",@"key":@"5d2fecb1e50a4b788d3d87c1f113a7f5"};
    [[HTRequestManager shareManager] requestDataWithUrl:CityUrl withParameters:dicts withComplicate:^(BOOL isSuccess, id Data) {
        if (isSuccess) {
            debugLog(@"%@",Data);
            self.dataArr = [NSArray arrayWithArray:Data];
            self.models = [[_dataArr firstObject] firstObject];
            [self hourForecast];
            //刷新表格
            [self.btmTableVw reloadData];
            ///
            [self.hourCollVw reloadData];
        }else{
            debugLog(@"错误信息：%@",Data);
        }
    }];

}

#pragma mark--每小时预报
- (void)hourForecast{
    
//    for (int i = 0; i < [[self.models hourly_forecast] count]; i ++) {
//        UIView * hourView = [[UIView alloc] init];
//        hourView.backgroundColor = [UIColor whiteColor];
//        UIView * superVw  = self.upScrollVw;
//
//        hourView.userInteractionEnabled = NO;
//
//        [self.upScrollVw addSubview:hourView];
//        
//        [hourView makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(superVw.top).offset(KViewHeight * .6 - 170);
//            make.bottom.equalTo(superVw.bottom).offset(-10);
//            make.left.equalTo(superVw.left).offset(20 + (20 + (KViewWidth - 80) / 3 ) * i);
//            make.right.equalTo(superVw.right).offset(-20);
//            
////            make.width.equalTo(@((KViewWidth - 80) / 3));
////            make.height.equalTo(@(150));
//            [HTCustomView customHourForcastView:[[self.models hourly_forecast] objectAtIndex:i] withView:hourView];
//        }];
//
//    }
    
}

#pragma mark--TableView delegate
//每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (![[self.models daily_forecast] count]) {
        return 7;
    }
    return [[self.models  daily_forecast] count];
}
//一组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * cellID = @"WeatherCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 /255.0 alpha:.4];
    
    return cell;
}

#pragma mark--CollectionView
//行数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    if ([[self.models hourly_forecast] count] > 0) {
        return [[self.models hourly_forecast]count];
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    HTHourForcastCell * itemCell = [collectionView dequeueReusableCellWithReuseIdentifier:hourForcastID forIndexPath:indexPath];
    itemCell.backgroundColor = [UIColor purpleColor];
    itemCell.hourModel = [[self.models hourly_forecast] objectAtIndex:indexPath.item];
    return itemCell;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    UIKIT_STATIC_INLINE UIEdgeInsets UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) 
    return UIEdgeInsetsMake(5, 5, 5, -5);
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
