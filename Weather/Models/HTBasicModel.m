//
//  HTBasicModel.m
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBasicModel.h"

@implementation HTBasicModel

+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"ID", @"update.loc":@"loc", @"update.utc":@"utc"}];
}


@end
