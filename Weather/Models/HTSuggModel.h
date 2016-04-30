//
//  HTSuggestionModel.h
//  Weather
//
//  Created by guohaitao on 16/4/27.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTSuggModel : HTBaseModel

/*
 "comf":Object{...},
 "cw":Object{...},
 "drsg":Object{...},
 "flu":{
 "brf":"较易发",
 "txt":"相对今天出现了较大幅度降温，较易发生感冒，体质较弱的朋友请注意适当防护。"
 },
 */


PropertyStr(brf);
PropertyStr(txt);


@end
