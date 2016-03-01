//
//  ViewController.m
//  12.25.YSSlider
//
//  Created by Color on 15/12/25.
//  Copyright © 2015年 com.moon-box. All rights reserved.
//

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "UIViewExt.h"

#import "YSProgressView.h"

@interface ViewController ()
{
    UIProgressView *progressV1;
    UIView *progressV;
    YSProgressView *ysView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, kDeviceWidth, 21)];
    descLabel.textAlignment = NSTextAlignmentCenter;
    descLabel.text = @"点击任意位置触发条件";
    descLabel.font = [UIFont systemFontOfSize:14.0f];
    
    [self.view addSubview:descLabel];
    
    
    
    /********** system progressview ************/
    progressV1 = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progressV1.frame = CGRectMake(20, 100, kDeviceWidth - 40, 100);
    progressV1.progressTintColor = [UIColor redColor];
    progressV1.trackTintColor = [UIColor cyanColor];
    progressV1.transform = CGAffineTransformMakeScale(1.0, 3.0);
    [self.view addSubview:progressV1];
    
    
    
    /********** 未封装 progressview ************/
    CGFloat silderHeight = 5;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 200, kDeviceWidth - 40, silderHeight)];
    bgView.backgroundColor = [UIColor cyanColor];
    bgView.layer.cornerRadius = silderHeight/2.0;
    [self.view addSubview:bgView];
    
    progressV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, silderHeight)];
    progressV.backgroundColor = [UIColor colorWithRed:0.973 green:0.745 blue:0.306 alpha:1.000];
    progressV.layer.cornerRadius = silderHeight/2.0;
    [bgView addSubview:progressV];
    
    
    
    
    /********** YSProgressView ************/
    
    
    ysView = [[YSProgressView alloc] initWithFrame:CGRectMake(20, 300, kDeviceWidth - 40, 10)];
//    ysView.progressHeight = 10;
//    ysView.progressTintColor = [UIColor cyanColor];
//    ysView.trackTintColor = [UIColor redColor];
//    ysView.progressValue = 1000;
    [self.view addSubview:ysView];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
    // 系统progress
    [progressV1 setProgress:(arc4random() % 322)/322.0 animated:YES];
    
    
    // 未封装 progressview
    int maxValue = 280;
    // 变量
    CGFloat tempValue = (arc4random() % maxValue) *10.0f;
    
    CGFloat progressWidth = tempValue/10.f;
    
    double durationValue = (tempValue/2.0) / (maxValue * 10.0f) + .5 ;
    NSLog(@"%f",durationValue);
    
    [UIView animateWithDuration:durationValue animations:^{
        
        progressV.width = progressWidth;
    }];
    
    
    // YSProgressView 
    ysView.progressValue = progressWidth;
    
    
}

@end
