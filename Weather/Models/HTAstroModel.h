//
//  HTAstroModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTAstroModel : HTBaseModel
/*
 "astro":{
 "mr":"01:00",
 "ms":"11:37",
 "sr":"05:15",
 "ss":"19:07"
 },
 */

PropertyStr(mr);
PropertyStr(ms);
PropertyStr(sr);
PropertyStr(ss);
@end
