//
//  HTTmpModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTTmpModel : HTBaseModel
/*
 "tmp":{
 "max":"31",
 "min":"18"
 }
 */

PropertyStr(max);
PropertyStr(min);

@end
