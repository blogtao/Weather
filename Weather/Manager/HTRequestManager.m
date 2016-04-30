//
//  HTRequestData.m
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTRequestManager.h"

#import "HTComModel.h"
#import "HTDailyModel.h"
@interface HTRequestManager ()


@property (nonatomic, strong) AFHTTPSessionManager * manager;

@property (nonatomic, strong) NSMutableArray * dataArr;

@end

@implementation HTRequestManager


+ (HTRequestManager *)shareManager{
    static HTRequestManager * requestManager;
    if (requestManager == nil) {
        requestManager = [[HTRequestManager alloc] init];
    }
    return requestManager;
}

- (AFHTTPSessionManager *)manager{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return _manager;
}

- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}


- (void)requestDataWithUrl:(NSString *)url withParameters:(NSDictionary *)parameters withComplicate:(downData)complicate{

    [self.manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
//        debugLog(@"%@", downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dicts = [responseObject[@"HeWeather data service 3.0"]firstObject];
        if ([dicts[@"status"] isEqualToString:@"ok"]) {

            NSArray * dicArr = [HTComModel arrayOfModelsFromDictionaries:responseObject[@"HeWeather data service 3.0"] error:nil];
            // [dicArr firstObject] 是HTcomModel的一个对象
            [self.dataArr addObject:dicArr];
            debugLog(@"数据：%@", responseObject);
            NSDictionary * suggDic = @{@"comf":@"生活指数", @"drsg":@"穿衣指数", @"uv":@"紫外线指数", @"cw":@"洗车指数", @"trav":@"旅游指数", @"flu":@"感冒指数", @"sport":@"运动指数"};
            NSArray * suggArr = @[@"comf", @"drsg", @"uv", @"cw", @"trav", @"flu", @"sport"];
            
            NSMutableArray * modelArrs = [[NSMutableArray alloc] init];//存储suggestion的对象
            for (NSString * key in suggArr) {
                HTSuggModel * model  = [[HTSuggModel alloc] initWithDictionary:dicts[@"suggestion"][key] error:nil];
                [modelArrs addObject:model];
            }
            [self.dataArr addObject:modelArrs];
//            debugLog(@"%@", self.dataArr);
            complicate(YES, self.dataArr);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complicate(NO, error);
    }];
    
}

@end
