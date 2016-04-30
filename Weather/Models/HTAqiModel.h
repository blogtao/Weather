//
//  HTAqiModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"
#import "HTCityModel.h"
@interface HTAqiModel : HTBaseModel

@property (nonatomic, strong) HTCityModel * city;

@end
