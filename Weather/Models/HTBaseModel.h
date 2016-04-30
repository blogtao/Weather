//
//  HTBaseModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PropertyStr(str)  @property (nonatomic, copy) NSString <Optional> * str

#define PropertyArr(arr) @property (nonatomic, strong) NSMutableArray <Optional> * arr

@interface HTBaseModel : JSONModel


@end
