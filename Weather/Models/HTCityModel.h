//
//  HTCityModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTCityModel : HTBaseModel

/*
 "city":{
 "aqi":"120",
 "co":"1",
 "no2":"42",
 "o3":"104",
 "pm10":"78",
 "pm25":"120",
 "qlty":"轻度污染",
 "so2":"9"
 }
 */

PropertyStr(aqi);
PropertyStr(co);
PropertyStr(no2);
PropertyStr(pm10);
PropertyStr(pm25);
PropertyStr(qlty);
PropertyStr(so2);

@end
