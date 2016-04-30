//
//  HTBasicModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTBasicModel : HTBaseModel
/*
 "basic":{
 "city":"北京",
 "cnty":"中国",
 "id":"CN101010100",
 "lat":"39.904000",
 "lon":"116.391000",
 "update":{
 "loc":"2016-04-27 15:50",
 "utc":"2016-04-27 07:50"
 }
 }
 */


PropertyStr(city);
PropertyStr(cnty);
PropertyStr(ID);//id
PropertyStr(lat);
PropertyStr(lon);
PropertyStr(loc);
PropertyStr(utc);
@end
