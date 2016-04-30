//
//  HTCondModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTCondModel : HTBaseModel
/*
 "cond":{
 "code_d":"100",
 "code_n":"101",
 "txt_d":"晴",
 "txt_n":"多云"
 },
 */

PropertyStr(code_d);
PropertyStr(code_n);
PropertyStr(txt_d);
PropertyStr(txt_n);

/*
 "cond":{
 "code":"104",
 "txt":"阴"
 },
 */

PropertyStr(code);
PropertyStr(txt);
@end
