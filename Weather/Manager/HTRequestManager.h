//
//  HTRequestData.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^downData)(BOOL isSuccess, id Data);
@interface HTRequestManager : NSObject

+ (HTRequestManager *)shareManager;

- (void)requestDataWithUrl:(NSString *)url withParameters:(NSDictionary *)parameters withComplicate:(downData)complicate;

@end
