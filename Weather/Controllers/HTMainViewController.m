//
//  HTMainViewController.m
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTMainViewController.h"

#import "HTRequestManager.h"


#define SUM 3 //视图滚动的数量
@interface HTMainViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView * upScrollVw;

@end

@implementation HTMainViewController

//懒加载方式
- (UIScrollView *)upScrollVw{
    if (_upScrollVw == nil) {
        _upScrollVw = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KViewWidth, KViewHeight * .6)];
        _upScrollVw.delegate = self;
        //设置内容大小
        _upScrollVw.contentSize = CGSizeMake(KViewWidth * SUM, KViewHeight * .6);
        //分页
        _upScrollVw.pagingEnabled = YES;
        //关闭弹性效果
        _upScrollVw.bounces = NO;
    }
    return _upScrollVw;
}

- (void)addSubView{

    for (int i = 0; i < SUM - 1; i++) {
        UIView * subView = [[UIView alloc] initWithFrame:CGRectMake(i * KViewWidth, 0, KViewWidth, KViewHeight * 0.6)];
        subView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:.5];
        [self.upScrollVw addSubview:subView];
    }
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(2 * KViewWidth, 0, 100 , 100)];

    [imgView sd_setImageWithURL:[NSURL URLWithString:@"http://files.heweather.com/cond_icon/100.png"]];
//    NSData * imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://files.heweather.com/cond_icon/100.png"]];
//    debugLog(@"===%@", imgData);
//    imgView.image = [UIImage imageWithData:imgData];
    
    [self.upScrollVw addSubview:imgView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //添加scrollView

    [self.view addSubview:self.upScrollVw];
    
    //往ScrollView上添加视图
    [self addSubView];
    //请求数据
    [self downLoadData];
}

#pragma mark--下载数据
- (void)downLoadData{
    NSDictionary * dicts = @{@"city":@"beijing",@"key":@"5d2fecb1e50a4b788d3d87c1f113a7f5"};
    [[HTRequestManager shareManager] requestDataWithUrl:CityUrl withParameters:dicts withComplicate:^(BOOL isSuccess, id Data) {
        if (isSuccess) {
            debugLog(@"%@",Data);
        }else{
            debugLog(@"错误信息：%@",Data);
        }
    }];

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
