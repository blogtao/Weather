//
//  HTCustomView.h
//  Weather
//
//  Created by guohaitao on 16/4/30.
//  Copyright © 2016年 guohaitao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HTHourModel.h"

@interface HTCustomView : UIView


+ (UILabel *)customLabel:(NSString *)lbltext withFrame:(CGRect)iframe withFont:(UIFont *)ifont;

+ (UIImageView *)customImageViewWithFrame:(CGRect)iframe withStrUrl:(NSString *)strUrl;


+ (void)customHourForcastView:(HTHourModel *)hourModel withView:(UIView *)selfVw;

@end
