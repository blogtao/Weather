//
//  HTHourForcastCell.m
//  Weather
//
//  Created by guohaitao on 16/5/4.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTHourForcastCell.h"

#define KItemWidth  self.bounds.size.width
#define KItemHeight (self.bounds.size.height / 4)


@interface HTHourForcastCell ()

@property (nonatomic, strong) UILabel * dateLbl;
@property (nonatomic, strong) UILabel * tmpLbl;
@property (nonatomic, strong) UILabel * scLbl;
@property (nonatomic, strong) UILabel * dirLbl;

@end

@implementation HTHourForcastCell

- (UILabel *)dateLbl{
    if (_dateLbl == nil) {
        _dateLbl = [[UILabel  alloc] initWithFrame:CGRectMake(0, 0, KItemWidth, KItemHeight)];
        [self.contentView addSubview:_dateLbl];
    }
    return _dateLbl;
}

- (void)setHourModel:(HTHourModel *)hourModel{

    NSArray *hourArr = @[[hourModel date], [hourModel tmp], [[hourModel wind] dir], [[hourModel wind] sc]];
    
    for (NSString * str in hourArr) {
        NSInteger i = [hourArr indexOfObject:str];
        UILabel * lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, KItemHeight * i, KItemWidth, KItemHeight)];
        if (i == 0) {
            lbl.text = [[str componentsSeparatedByString:@" "] lastObject];
        }else{
            lbl.text = str;
        }

        [self.contentView addSubview:lbl];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.backgroundColor = [UIColor whiteColor];
        if (i == 1) {
            lbl.text = [str stringByAppendingString:@"℃"];
            
        }
        if (i == 3) {
            for (int i = 0; i < [str length]; i++ ) {
                unichar c = [str characterAtIndex:i];
                if (isdigit(c)) {//如果包含数字
                   lbl.text = [str stringByAppendingString:@"级"];
                    break;
                }
            }
        }
//        if (i == 2) {
//            lbl.text = [NSString stringWithFormat:@"风向:%@", str];
//        }else if (i == 3){
//            lbl.text = [NSString stringWithFormat:@"级别:%@", str];
//        }
        

    }
}
@end
