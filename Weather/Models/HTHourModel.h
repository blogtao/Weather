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
 */

PropertyStr(date);
PropertyStr(hum);
PropertyStr(pop);
PropertyStr(pres);
PropertyStr(tmp);
@property (nonatomic, strong) HTWindModel *wind;

@end
