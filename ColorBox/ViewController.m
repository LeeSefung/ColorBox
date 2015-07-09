//
//  ViewController.m
//  ColorBox
//
//  Created by rimi on 15/7/9.
//  Copyright (c) 2015年 LeeSefung. All rights reserved.
//  https://github.com/LeeSefung/ColorBox.git
//

#import "ViewController.h"

//颜色类型枚举
typedef NS_ENUM(NSInteger, RandColorType) {
    RandColorTypeRandom64Color                 = 0,
    RandColorTypeRandom128Color                = 1,
    RandColorTypeRandom128HightLightColor      = 2,
    RandColorTypeRandom192HightLightColor      = 3,
} NS_ENUM_AVAILABLE_IOS(6_0);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self colorBoxWithCountInHorize:5
    //                      randColorType:RandColorTypeRandom128HightLightColor];
    [self colorBoxWithCountInHorize:5
       randomColorWithRedColorRange:NSMakeRange(155, 100)
                    greenColorRange:NSMakeRange(50, 50)
                     blueColorRange:NSMakeRange(50, 50)];
}

//设置颜色范围的色板
- (void)colorBoxWithCountInHorize:(int)countInHorize
     randomColorWithRedColorRange:(NSRange)redColorRange
                  greenColorRange:(NSRange)greenColorRange
                   blueColorRange:(NSRange)blueColorRange {
    
    float width = [UIScreen mainScreen].bounds.size.width / countInHorize;
    int count = (((int)[UIScreen mainScreen].bounds.size.height) / (int)width + 1) * countInHorize;
    for (int i = 0; i < count; i ++) {
        
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(i % countInHorize * width, i / countInHorize * width, width, width)];
        colorView.backgroundColor = [self randomColorWithRedColorRange:redColorRange
                                                       greenColorRange:greenColorRange
                                                        blueColorRange:blueColorRange];
        [self.view addSubview:colorView];
    }
}

//设置颜色类型的色板
- (void)colorBoxWithCountInHorize:(int)countInHorize
                    randColorType:(RandColorType)randColorType {
    
    float width = [UIScreen mainScreen].bounds.size.width / countInHorize;
    int count = (((int)[UIScreen mainScreen].bounds.size.height) / (int)width + 1) * countInHorize;
    for (int i = 0; i < count; i ++) {
        
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(i % countInHorize * width, i / countInHorize * width, width, width)];
        if (randColorType == RandColorTypeRandom64Color) {
            
            colorView.backgroundColor = [self random64Color];
        }else if (randColorType == RandColorTypeRandom128Color) {
            
            colorView.backgroundColor = [self random128Color];
        }else if (randColorType == RandColorTypeRandom128HightLightColor) {
            
            colorView.backgroundColor = [self random128HightLightColor];
        }else {
            colorView.backgroundColor = [self random192HightLightColor];
        }
        [self.view addSubview:colorView];
    }
}

//64随机色
- (UIColor *)random64Color {
    
    return [UIColor colorWithRed:(arc4random() % 256 / 4 * 4 + 1) / 255.0
                           green:(arc4random() % 256 / 4 * 4 + 1) / 255.0
                            blue:(arc4random() % 256 / 4 * 4 + 1) / 255.0
                           alpha:1];
}

//128随机色
- (UIColor *)random128Color {
    
    return [UIColor colorWithRed:(arc4random() % 256 / 2 * 2 + 1) / 255.0
                           green:(arc4random() % 256 / 2 * 2 + 1) / 255.0
                            blue:(arc4random() % 256 / 2 * 2 + 1) / 255.0
                           alpha:1];
}

//128高亮随机色
- (UIColor *)random128HightLightColor {
    
    return [UIColor colorWithRed:(arc4random() % 128 + 128) / 255.0
                           green:(arc4random() % 128 + 128) / 255.0
                            blue:(arc4random() % 128 + 128) / 255.0
                           alpha:1];
}

//192高亮随机色
- (UIColor *)random192HightLightColor {
    
    return [UIColor colorWithRed:(arc4random() % 192 + 64) / 255.0
                           green:(arc4random() % 192 + 64) / 255.0
                            blue:(arc4random() % 192 + 64) / 255.0
                           alpha:1];
}

//范围随机色
- (UIColor *)randomColorWithRedColorRange:(NSRange)redColorRange
                          greenColorRange:(NSRange)greenColorRange
                           blueColorRange:(NSRange)blueColorRange {
    
    return [UIColor colorWithRed:(arc4random() % redColorRange.location + redColorRange.length) / 255.0
                           green:(arc4random() % greenColorRange.location + greenColorRange.length) / 255.0
                            blue:(arc4random() % blueColorRange.location + blueColorRange.length) / 255.0
                           alpha:1];
}

@end
