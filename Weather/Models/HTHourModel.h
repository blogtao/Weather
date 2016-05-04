//
//  HTHourModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

#import "HTWindModel.h"

@interface HTHourModel : HTBaseModel
/*
 {
 "date":"2016-04-27 16:00",
 "hum":"37",
 "pop":"37",
 "pres":"1014",
 "tmp":"20",
 "wind":Object{...}
 },
 
 "date":"2016-04-30 22:00",  时间 *
 "hum":"32",  湿度
 "pop":"1",   降水率
 "pres":"1002", 气压
 "tmp":"28",  温度  *
 "wind":{   风力
 "deg":"115",
 "dir":"东南风",  风向  *
 "sc":"微风",  风力等级  *
 "spd":"12"  风速
 }
 
 */

PropertyStr(date);
PropertyStr(hum);
PropertyStr(pop);
PropertyStr(pres);
PropertyStr(tmp);
@property (nonatomic, strong) HTWindModel *wind;

@end
