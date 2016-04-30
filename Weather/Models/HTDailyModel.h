//
//  HTDailyModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

#import "HTAstroModel.h"
#import "HTCondModel.h"
#import "HTTmpModel.h"
#import "HTWindModel.h"

@interface HTDailyModel : HTBaseModel
/*
 daily_forecast":[
 {
 "astro":Object{...},
 "cond":Object{...},
 "date":"2016-04-27",
 "hum":"52",
 "pcpn":"0.6",
 "pop":"84",
 "pres":"1013",
 "tmp":Object{...},
 "vis":"2",
 "wind":Object{...}
 },
 */

@property (nonatomic, strong) HTAstroModel *astro;
@property (nonatomic, strong) HTCondModel *cond;
PropertyStr(date);
PropertyStr(hum);
PropertyStr(pcpn);
PropertyStr(pop);
PropertyStr(pres);
PropertyStr(vis);
@property (nonatomic, strong) HTTmpModel *tmp;
@property (nonatomic, strong) HTWindModel *wind;

@end
