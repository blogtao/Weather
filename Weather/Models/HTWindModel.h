//
//  HTWindModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTWindModel : HTBaseModel
/*
 "wind":{ //风力状况
 "deg":"197", //风向(角度)
 "dir":"无持续风向", //风向(方向)
 "sc":"微风", //风力等级
 "spd":"8" //风速(Kmph)
 }
 */

PropertyStr(deg);
PropertyStr(dir);
PropertyStr(sc);
PropertyStr(spd);

@end
