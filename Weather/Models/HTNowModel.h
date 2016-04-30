//
//  HTNowModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

#import "HTCondModel.h"
#import "HTWindModel.h"

@interface HTNowModel : HTBaseModel

/*
 "now":{
 "cond":Object{...},
 "fl":"17",
 "hum":"46",
 "pcpn":"0",
 "pres":"1013",
 "tmp":"19",
 "vis":"8",
 "wind":Object{...}
 },
 */
@property (nonatomic, strong) HTCondModel * cond;
PropertyStr(fl);
PropertyStr(hum);
PropertyStr(pcpn);
PropertyStr(pres);
PropertyStr(tmp);
PropertyStr(vis);
@property (nonatomic, strong) HTWindModel * wind;


/*
 "now":{
 "cond":{   天气状况
 "code":"101", //图片  天气代码  *
 "txt":"多云"  天气描述    *
 },
 "fl":"25",  体感温度  *
 "hum":"51",  湿度(%)  *
 "pcpn":"0",  降雨量(mm)
 "pres":"1004",  气压
 "tmp":"22",  当前温度(摄氏度)  *
 "vis":"5",   能见度(km)
 "wind":{  风力状况   *
 "deg":"30",   风向(角度)
 "dir":"东风",  风向(方向)
 "sc":"4-5", 风力等级
 "spd":"24"  风速(Kmph)
 }
 },
 
 */

@end
