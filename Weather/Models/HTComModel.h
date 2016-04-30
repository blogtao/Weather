//
//  HTComModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"
#import "HTAqiModel.h"
#import "HTBasicModel.h"
#import "HTDailyModel.h"
#import "HTHourModel.h"
#import "HTNowModel.h"
#import "HTSuggModel.h"

@protocol HTDailyModel <NSObject>

@end

@protocol HTHourModel <NSObject>



@end

@interface HTComModel : HTBaseModel
/*
 "HeWeather data service 3.0":[
 {
 "aqi":Object{...},
 "basic":Object{...},
 "daily_forecast":Array[7],
 "hourly_forecast":Array[3],
 "now":Object{...},
 "status":"ok",
 "suggestion":Object{...}
 }
 ]
 */
@property (nonatomic, strong) HTAqiModel * aqi;
@property (nonatomic, strong) HTBasicModel * basic;
@property (nonatomic, strong) NSArray <Optional, ConvertOnDemand, HTDailyModel> *  daily_forecast;
@property (nonatomic, strong) NSArray <Optional, ConvertOnDemand, HTHourModel> * hourly_forecast;
@property (nonatomic, strong) HTNowModel * now;
PropertyStr(status);


@end
