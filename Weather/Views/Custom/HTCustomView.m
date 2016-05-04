//
//  HTCustomView.m
//  Weather
//
//  Created by guohaitao on 16/4/30.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import "HTCustomView.h"

@implementation HTCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-  (instancetype)init{
    if (self = [super init]) {
        
        
    }
    return self;
}


+ (UILabel *)customLabel:(NSString *)lbltext withFrame:(CGRect)iframe withFont:(UIFont *)ifont{

    UILabel * lbl = [[UILabel alloc] init];
    lbl.text = lbltext;
    lbl.font = ifont;
    
    return lbl;
}

+ (UIImageView *)customImageViewWithFrame:(CGRect)iframe withStrUrl:(NSString *)strUrl{
    UIImageView * imgView  = [[UIImageView alloc] initWithFrame:iframe];
    
    [imgView sd_setImageWithURL:[NSURL URLWithString:strUrl] placeholderImage:[UIImage imageNamed:@"999.png"]];
    
    return imgView;
}

+ (void)customHourForcastView:(HTHourModel *)hourModel withView:(UIView *)selfVw{
    
    HTCustomView * hourView = (HTCustomView *)selfVw;
    
    if (hourModel != nil) {
        
    }
}
@end
